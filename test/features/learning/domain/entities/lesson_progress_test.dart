import 'package:flutter_test/flutter_test.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_status.dart';

void main() {
  group('LessonProgress completion threshold', () {
    late LessonProgress initialProgress;

    setUp(() {
      initialProgress = LessonProgress.notStarted(
        courseId: 'course-1',
        lessonId: 'lesson-1',
        duration: const Duration(seconds: 100),
      );
    });

    test('remains in progress below 90 percent', () {
      final progress = initialProgress.withPosition(
        newPosition: const Duration(seconds: 89),
        newDuration: const Duration(seconds: 100),
        watchedAt: DateTime(2026),
      );

      expect(progress.isCompleted, isFalse);
      expect(progress.status, LessonStatus.inProgress);
    });

    test('becomes completed at exactly 90 percent', () {
      final progress = initialProgress.withPosition(
        newPosition: const Duration(seconds: 90),
        newDuration: const Duration(seconds: 100),
        watchedAt: DateTime(2026),
      );

      expect(progress.isCompleted, isTrue);
      expect(progress.status, LessonStatus.completed);
    });
  });
}
