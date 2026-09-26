import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/repositories/progress_repository.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/save_lesson_progress_use_case.dart';

final class _MockProgressRepository extends Mock
    implements ProgressRepository {}

void main() {
  late ProgressRepository repository;
  late SaveLessonProgressUseCase useCase;

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
    useCase = SaveLessonProgressUseCase(repository);
    when(
      () => repository.saveProgress(any()),
    ).thenAnswer((_) async => const Right(unit));
  });

  test(
    'saves and returns the updated progress supplied by the caller',
    () async {
      final initial = LessonProgress.notStarted(
        courseId: 'course',
        lessonId: 'lesson',
        duration: const Duration(seconds: 100),
      );
      final updated = initial.withPosition(
        newPosition: const Duration(seconds: 90),
        newDuration: const Duration(seconds: 100),
        watchedAt: DateTime(2026),
      );

      final result = await useCase(
        SaveLessonProgressUseCaseParam(updatedProgress: updated),
      );

      final progress = result.getOrElse(
        () => throw StateError('Expected a successful progress update.'),
      );
      expect(progress.isCompleted, isTrue);
      verify(() => repository.saveProgress(updated)).called(1);
    },
  );

  test('does not modify the supplied progress', () async {
    final initial = LessonProgress.notStarted(
      courseId: 'course',
      lessonId: 'lesson',
      duration: const Duration(seconds: 100),
    );
    final updated = initial.withPosition(
      newPosition: const Duration(seconds: 89),
      newDuration: const Duration(seconds: 100),
      watchedAt: DateTime(2026),
    );

    final result = await useCase(
      SaveLessonProgressUseCaseParam(updatedProgress: updated),
    );

    final progress = result.getOrElse(
      () => throw StateError('Expected a successful progress update.'),
    );
    expect(progress.isCompleted, isFalse);
    expect(progress, updated);
  });
}
