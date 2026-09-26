import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/course_section.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/repositories/course_repository.dart';
import 'package:thaheen_task/features/learning/domain/repositories/progress_repository.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/calculate_course_progress_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_all_lesson_progress_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_courses_use_case.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/courses/courses_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/courses/courses_state.dart';

final class _MockCourseRepository extends Mock implements CourseRepository {}

final class _MockProgressRepository extends Mock
    implements ProgressRepository {}

void main() {
  const firstLesson = Lesson(
    id: 'first',
    title: 'First lesson',
    duration: Duration(seconds: 30),
    videoAssetPath: 'first.mp4',
  );
  const secondLesson = Lesson(
    id: 'second',
    title: 'Second lesson',
    duration: Duration(seconds: 30),
    videoAssetPath: 'second.mp4',
  );
  const course = Course(
    id: 'course',
    title: 'Course',
    instructor: 'Instructor',
    thumbnailAssetPath: 'thumbnail.png',
    sections: [
      CourseSection(
        id: 'section',
        title: 'Section',
        lessons: [firstLesson, secondLesson],
      ),
    ],
  );

  late CourseRepository courseRepository;
  late ProgressRepository progressRepository;
  late CoursesCubit cubit;

  LessonProgress completedProgress(Lesson lesson) {
    return LessonProgress(
      courseId: course.id,
      lessonId: lesson.id,
      position: lesson.duration,
      duration: lesson.duration,
      lastWatchedAt: DateTime(2026),
      isCompleted: true,
    );
  }

  double currentCourseProgress() {
    return cubit.state.maybeWhen(
      loaded: (_, progressByCourseId) => progressByCourseId[course.id] ?? 0,
      orElse: () => 0,
    );
  }

  setUp(() {
    courseRepository = _MockCourseRepository();
    progressRepository = _MockProgressRepository();
    when(
      () => courseRepository.getCourses(),
    ).thenAnswer((_) async => const Right([course]));
    when(
      () => progressRepository.getAllProgress(),
    ).thenAnswer((_) async => const Right({}));
    cubit = CoursesCubit(
      GetCoursesUseCase(courseRepository),
      GetAllLessonProgressUseCase(progressRepository),
      const CalculateCourseProgressUseCase(),
    );
  });

  tearDown(() => cubit.close());

  test('updates visible course progress from presentation events', () async {
    await cubit.load();
    expect(currentCourseProgress(), 0);

    cubit.progressUpdated(completedProgress(firstLesson));
    expect(currentCourseProgress(), 50);

    cubit.progressUpdated(completedProgress(secondLesson));
    expect(currentCourseProgress(), 100);
  });
}
