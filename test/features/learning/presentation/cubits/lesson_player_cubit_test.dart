import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/repositories/progress_repository.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_lesson_progress_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/save_lesson_progress_use_case.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/lesson_player/lesson_player_cubit.dart';

final class _MockProgressRepository extends Mock
    implements ProgressRepository {}

void main() {
  const lesson = Lesson(
    id: 'lesson',
    title: 'Lesson',
    duration: Duration(seconds: 100),
    videoAssetPath: 'lesson.mp4',
  );

  late ProgressRepository repository;
  late LessonPlayerCubit cubit;

  setUpAll(
    () => registerFallbackValue(
      LessonProgress.notStarted(
        courseId: 'fallback-course',
        lessonId: 'fallback',
        duration: Duration.zero,
      ),
    ),
  );

  setUp(() {
    repository = _MockProgressRepository();
    cubit = LessonPlayerCubit(
      GetLessonProgressUseCase(repository),
      SaveLessonProgressUseCase(repository),
    );
  });

  tearDown(() => cubit.close());

  test('loads saved progress so playback can resume', () async {
    final savedProgress = LessonProgress(
      courseId: 'course',
      lessonId: lesson.id,
      position: const Duration(seconds: 42),
      duration: lesson.duration,
      lastWatchedAt: DateTime(2026),
      isCompleted: false,
    );
    when(
      () => repository.getLessonProgress(lesson.id),
    ).thenAnswer((_) async => Right(savedProgress));

    await cubit.initialize(courseId: 'course', lesson: lesson);

    expect(cubit.state.progress, savedProgress);
    verify(() => repository.getLessonProgress(lesson.id)).called(1);
  });

  test('marks and saves a lesson as completed at 90 percent', () async {
    when(
      () => repository.getLessonProgress(lesson.id),
    ).thenAnswer((_) async => const Right(null));
    when(
      () => repository.saveProgress(any()),
    ).thenAnswer((_) async => const Right(unit));
    await cubit.initialize(courseId: 'course', lesson: lesson);

    cubit.positionChanged(
      position: const Duration(seconds: 90),
      duration: lesson.duration,
    );
    await pumpEventQueue();

    expect(cubit.state.progress?.isCompleted, isTrue);
    expect(cubit.state.isSaving, isFalse);
    final savedProgress =
        verify(() => repository.saveProgress(captureAny())).captured.single
            as LessonProgress;
    expect(savedProgress.isCompleted, isTrue);
    expect(cubit.state.latestSavedProgress, savedProgress);
  });
}
