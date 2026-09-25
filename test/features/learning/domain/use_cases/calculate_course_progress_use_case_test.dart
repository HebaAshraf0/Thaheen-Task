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

  test(
    'returns completed lessons divided by total lessons as a percentage',
    () {
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
    },
  );
}

LessonProgress _completedProgress(String lessonId) {
  return LessonProgress(
    lessonId: lessonId,
    position: const Duration(minutes: 1),
    duration: const Duration(minutes: 1),
    lastWatchedAt: DateTime(2026),
    isCompleted: true,
  );
}
