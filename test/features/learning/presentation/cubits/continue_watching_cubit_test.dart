import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/course_section.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/repositories/course_repository.dart';
import 'package:thaheen_task/features/learning/domain/repositories/progress_repository.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_active_course_id_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_all_lesson_progress_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_continue_watching_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_course_use_case.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/continue_watching/continue_watching_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/continue_watching/continue_watching_state.dart';

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
    id: 'off-page-course',
    title: 'Off-page course',
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
  late ContinueWatchingCubit cubit;

  LessonProgress progressFor(Lesson lesson, {bool isCompleted = false}) {
    return LessonProgress(
      courseId: course.id,
      lessonId: lesson.id,
      position: isCompleted ? lesson.duration : const Duration(seconds: 10),
      duration: lesson.duration,
      lastWatchedAt: DateTime(2026),
      isCompleted: isCompleted,
    );
  }

  setUp(() {
    courseRepository = _MockCourseRepository();
    progressRepository = _MockProgressRepository();
    when(() => progressRepository.getAllProgress()).thenAnswer(
      (_) async => Right({firstLesson.id: progressFor(firstLesson)}),
    );
    when(
      () => progressRepository.getActiveCourseId(),
    ).thenAnswer((_) async => const Right('off-page-course'));
    when(
      () => courseRepository.getCourse(course.id),
    ).thenAnswer((_) async => const Right(course));
    cubit = ContinueWatchingCubit(
      GetAllLessonProgressUseCase(progressRepository),
      GetActiveCourseIdUseCase(progressRepository),
      GetCourseUseCase(courseRepository),
      const GetContinueWatchingUseCase(),
    );
  });

  tearDown(() => cubit.close());

  test('loads the active course independently of the visible page', () async {
    await cubit.load();

    final lesson = cubit.state.maybeWhen(
      loaded: (continueWatching) => continueWatching.lesson,
      orElse: () => null,
    );
    expect(lesson, firstLesson);
    verify(() => courseRepository.getCourse(course.id)).called(1);
  });

  test('advances to the next lesson after a progress update', () async {
    await cubit.load();
    await cubit.progressUpdated(progressFor(firstLesson, isCompleted: true));

    final lesson = cubit.state.maybeWhen(
      loaded: (continueWatching) => continueWatching.lesson,
      orElse: () => null,
    );
    expect(lesson, secondLesson);
  });
}
