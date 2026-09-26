import 'package:flutter_test/flutter_test.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/course_section.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/is_lesson_unlocked_use_case.dart';

void main() {
  const useCase = IsLessonUnlockedUseCase();
  const firstLesson = Lesson(
    id: 'first',
    title: 'First',
    duration: Duration(minutes: 1),
    videoAssetPath: 'first.mp4',
  );
  const secondLesson = Lesson(
    id: 'second',
    title: 'Second',
    duration: Duration(minutes: 1),
    videoAssetPath: 'second.mp4',
  );
  const course = Course(
    id: 'course',
    title: 'Course',
    instructor: 'Instructor',
    thumbnailAssetPath: 'thumbnail',
    sections: [
      CourseSection(
        id: 'section',
        title: 'Section',
        lessons: [firstLesson, secondLesson],
      ),
    ],
  );

  test('unlocks the first lesson without progress', () {
    final isUnlocked = useCase(
      IsLessonUnlockedUseCaseParam(
        course: course,
        lessonId: firstLesson.id,
        progressByLessonId: const {},
      ),
    );

    expect(isUnlocked, isTrue);
  });

  test('next lesson unlocks only after previous lesson is completed', () {
    final locked = useCase(
      IsLessonUnlockedUseCaseParam(
        course: course,
        lessonId: secondLesson.id,
        progressByLessonId: const {},
      ),
    );
    final unlocked = useCase(
      IsLessonUnlockedUseCaseParam(
        course: course,
        lessonId: secondLesson.id,
        progressByLessonId: {
          firstLesson.id: LessonProgress(
            courseId: course.id,
            lessonId: firstLesson.id,
            position: firstLesson.duration,
            duration: firstLesson.duration,
            lastWatchedAt: DateTime(2026),
            isCompleted: true,
          ),
        },
      ),
    );

    expect(locked, isFalse);
    expect(unlocked, isTrue);
  });

  test('an in-progress lesson remains unlocked', () {
    final isUnlocked = useCase(
      IsLessonUnlockedUseCaseParam(
        course: course,
        lessonId: secondLesson.id,
        progressByLessonId: {
          secondLesson.id: LessonProgress(
            courseId: course.id,
            lessonId: secondLesson.id,
            position: const Duration(seconds: 20),
            duration: secondLesson.duration,
            lastWatchedAt: DateTime(2026),
            isCompleted: false,
          ),
        },
      ),
    );

    expect(isUnlocked, isTrue);
  });

  test('a completed lesson remains unlocked', () {
    final isUnlocked = useCase(
      IsLessonUnlockedUseCaseParam(
        course: course,
        lessonId: secondLesson.id,
        progressByLessonId: {
          secondLesson.id: LessonProgress(
            courseId: course.id,
            lessonId: secondLesson.id,
            position: secondLesson.duration,
            duration: secondLesson.duration,
            lastWatchedAt: DateTime(2026),
            isCompleted: true,
          ),
        },
      ),
    );

    expect(isUnlocked, isTrue);
  });
}
