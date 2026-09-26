import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/repositories/progress_repository.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_lesson_progress_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/save_lesson_progress_use_case.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/lesson_player/lesson_player_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/lesson_player/lesson_player_state.dart';

final class _MockProgressRepository extends Mock
    implements ProgressRepository {}

void main() {
  const courseId = 'course-1';
  const lesson = Lesson(
    id: 'lesson-1',
    title: 'Lesson 1',
    duration: Duration(seconds: 100),
    videoAssetPath: 'lesson.mp4',
  );

  late ProgressRepository repository;

  LessonPlayerCubit buildCubit() {
    return LessonPlayerCubit(
      GetLessonProgressUseCase(repository),
      SaveLessonProgressUseCase(repository),
    );
  }

  setUpAll(() {
    registerFallbackValue(
      LessonProgress.notStarted(
        courseId: 'fallback-course',
        lessonId: 'fallback-lesson',
        duration: Duration.zero,
      ),
    );
  });

  setUp(() {
    repository = _MockProgressRepository();
  });

  group('LessonPlayerCubit', () {
    final savedProgress = LessonProgress(
      courseId: courseId,
      lessonId: lesson.id,
      position: const Duration(seconds: 42),
      duration: lesson.duration,
      lastWatchedAt: DateTime(2026),
      isCompleted: false,
    );

    blocTest<LessonPlayerCubit, LessonPlayerState>(
      'restores the persisted playback position',
      setUp: () {
        when(
          () => repository.getLessonProgress(lesson.id),
        ).thenAnswer((_) async => Right(savedProgress));
      },
      build: buildCubit,
      act: (cubit) => cubit.initialize(courseId: courseId, lesson: lesson),
      expect: () => [LessonPlayerState(progress: savedProgress)],
      verify: (_) {
        verify(() => repository.getLessonProgress(lesson.id)).called(1);
        verifyNever(() => repository.saveProgress(any()));
      },
    );

    blocTest<LessonPlayerCubit, LessonPlayerState>(
      'persists and publishes progress after reaching 90 percent',
      setUp: () {
        when(
          () => repository.getLessonProgress(lesson.id),
        ).thenAnswer((_) async => const Right(null));
        when(
          () => repository.saveProgress(any()),
        ).thenAnswer((_) async => const Right(unit));
      },
      build: buildCubit,
      act: (cubit) async {
        await cubit.initialize(courseId: courseId, lesson: lesson);
        cubit.positionChanged(
          position: const Duration(seconds: 90),
          duration: lesson.duration,
        );
      },
      verify: (cubit) {
        final captured =
            verify(() => repository.saveProgress(captureAny())).captured.single
                as LessonProgress;
        expect(captured.isCompleted, isTrue);
        expect(cubit.state.progress, captured);
        expect(cubit.state.latestSavedProgress, captured);
        expect(cubit.state.isSaving, isFalse);
        expect(cubit.state.errorMessage, isNull);
      },
    );

    blocTest<LessonPlayerCubit, LessonPlayerState>(
      'exposes a storage failure without publishing unsaved progress',
      setUp: () {
        when(
          () => repository.getLessonProgress(lesson.id),
        ).thenAnswer((_) async => const Right(null));
        when(() => repository.saveProgress(any())).thenAnswer(
          (_) async => const Left(StorageFailure('Could not save progress')),
        );
      },
      build: buildCubit,
      act: (cubit) async {
        await cubit.initialize(courseId: courseId, lesson: lesson);
        cubit.positionChanged(
          position: const Duration(seconds: 50),
          duration: lesson.duration,
        );
      },
      verify: (cubit) {
        expect(cubit.state.latestSavedProgress, isNull);
        expect(cubit.state.isSaving, isFalse);
        expect(cubit.state.errorMessage, 'Could not save progress');
      },
    );
  });
}
