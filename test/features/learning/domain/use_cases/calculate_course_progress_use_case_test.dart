import 'package:flutter_test/flutter_test.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/course_section.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/calculate_course_progress_use_case.dart';

void main() {
  const useCase = CalculateCourseProgressUseCase();
  final course = Course(
    id: 'course',
    title: 'Course',
    instructor: 'Instructor',
    thumbnailAssetPath: 'thumbnail',
    sections: [
      CourseSection(
        id: 'section',
        title: 'Section',
        lessons: List.generate(
          4,
          (index) => Lesson(
            id: 'lesson-$index',
            title: 'Lesson $index',
            duration: const Duration(minutes: 1),
            videoAssetPath: 'video.mp4',
          ),
        ),
      ),
    ],
  );

  group('CalculateCourseProgressUseCase', () {
    test('returns completed lessons divided by total lessons', () {
      final progress = {
        'lesson-0': _completedProgress('lesson-0'),
        'lesson-1': _completedProgress('lesson-1'),
      };

      final percentage = useCase(
        CalculateCourseProgressUseCaseParam(
          course: course,
          progressByLessonId: progress,
        ),
      );

      expect(percentage, 50);
    });

    test('does not count unfinished lessons', () {
      final percentage = useCase(
        CalculateCourseProgressUseCaseParam(
          course: course,
          progressByLessonId: {
            'lesson-0': LessonProgress(
              courseId: 'course',
              lessonId: 'lesson-0',
              position: const Duration(seconds: 30),
              duration: const Duration(minutes: 1),
              lastWatchedAt: DateTime(2026),
              isCompleted: false,
            ),
          },
        ),
      );

      expect(percentage, 0);
    });
  });
}

LessonProgress _completedProgress(String lessonId) {
  return LessonProgress(
    courseId: 'course',
    lessonId: lessonId,
    position: const Duration(minutes: 1),
    duration: const Duration(minutes: 1),
    lastWatchedAt: DateTime(2026),
    isCompleted: true,
  );
}
