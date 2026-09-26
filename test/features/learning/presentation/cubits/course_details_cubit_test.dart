import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/course_section.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/repositories/course_repository.dart';
import 'package:thaheen_task/features/learning/domain/repositories/progress_repository.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_all_lesson_progress_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_course_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_next_lesson_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/is_lesson_unlocked_use_case.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_state.dart';

final class _MockCourseRepository extends Mock implements CourseRepository {}

final class _MockProgressRepository extends Mock
    implements ProgressRepository {}

void main() {
  const lesson = Lesson(
    id: 'lesson',
    title: 'Lesson',
    duration: Duration(seconds: 30),
    videoAssetPath: 'lesson.mp4',
  );
  const course = Course(
    id: 'course',
    title: 'Course',
    instructor: 'Instructor',
    thumbnailAssetPath: 'thumbnail.png',
    sections: [
      CourseSection(id: 'section', title: 'Section', lessons: [lesson]),
    ],
  );

  late CourseRepository courseRepository;
  late ProgressRepository progressRepository;
  late CourseDetailsCubit cubit;

  setUp(() {
    courseRepository = _MockCourseRepository();
    progressRepository = _MockProgressRepository();
    when(
      () => courseRepository.getCourse(course.id),
    ).thenAnswer((_) async => const Right(course));
    when(
      () => progressRepository.getAllProgress(),
    ).thenAnswer((_) async => const Right({}));

    cubit = CourseDetailsCubit(
      GetCourseUseCase(courseRepository),
      GetAllLessonProgressUseCase(progressRepository),
      const GetNextLessonUseCase(),
      const IsLessonUnlockedUseCase(),
    );
  });

  tearDown(() => cubit.close());

  test('updates loaded progress when a saved progress event arrives', () async {
    await cubit.load(course.id);
    final completedProgress = LessonProgress(
      courseId: course.id,
      lessonId: lesson.id,
      position: lesson.duration,
      duration: lesson.duration,
      lastWatchedAt: DateTime(2026),
      isCompleted: true,
    );

    cubit.progressUpdated(completedProgress);

    final isCompleted = cubit.state.maybeWhen(
      loaded: (_, progressByLessonId) =>
          progressByLessonId[lesson.id]?.isCompleted ?? false,
      orElse: () => false,
    );
    expect(isCompleted, isTrue);
  });
}
