import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_all_lesson_progress_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_course_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_next_lesson_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/is_lesson_unlocked_use_case.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_state.dart';

@injectable
final class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  CourseDetailsCubit(
    this._getCourse,
    this._getAllLessonProgress,
    this._getNextLesson,
    this._isLessonUnlocked,
  ) : super(const CourseDetailsState.initial());

  final GetCourseUseCase _getCourse;
  final GetAllLessonProgressUseCase _getAllLessonProgress;
  final GetNextLessonUseCase _getNextLesson;
  final IsLessonUnlockedUseCase _isLessonUnlocked;

  void progressUpdated(LessonProgress progress) {
    state.maybeWhen(
      loaded: (course, progressByLessonId) {
        if (course.lessonById(progress.lessonId) == null) return;

        emit(
          CourseDetailsState.loaded(course, {
            ...progressByLessonId,
            progress.lessonId: progress,
          }),
        );
      },
      orElse: () {},
    );
  }

  Future<void> load(String courseId) async {
    emit(const CourseDetailsState.loading());
    final courseResult = await _getCourse(
      GetCourseUseCaseParam(courseId: courseId),
    );
    await courseResult.fold(
      (failure) async => emit(CourseDetailsState.error(failure.message)),
      (course) async {
        if (course == null) {
          emit(const CourseDetailsState.notFound());
          return;
        }

        final progressResult = await _getAllLessonProgress(
          const GetAllLessonProgressUseCaseParam(),
        );
        if (isClosed) return;
        progressResult.fold(
          (failure) => emit(CourseDetailsState.error(failure.message)),
          (progressByLessonId) =>
              emit(CourseDetailsState.loaded(course, progressByLessonId)),
        );
      },
    );
  }

  Lesson? getNextUnlockedLesson({
    required String currentLessonId,
    required Map<String, LessonProgress> progressByLessonId,
  }) {
    final nextLesson = getNextLesson(currentLessonId: currentLessonId);
    if (nextLesson == null) return null;

    final isUnlocked = isLessonUnlocked(
      lessonId: nextLesson.id,
      progressByLessonId: progressByLessonId,
    );

    return isUnlocked ? nextLesson : null;
  }

  Lesson? getNextLesson({required String currentLessonId}) {
    final course = state.maybeWhen(
      loaded: (course, _) => course,
      orElse: () => null,
    );
    if (course == null) return null;

    return _getNextLesson(
      GetNextLessonUseCaseParam(
        course: course,
        currentLessonId: currentLessonId,
      ),
    );
  }

  bool isLessonUnlocked({
    required String lessonId,
    required Map<String, LessonProgress> progressByLessonId,
  }) {
    final course = state.maybeWhen(
      loaded: (course, _) => course,
      orElse: () => null,
    );
    if (course == null) return false;

    return _isLessonUnlocked(
      IsLessonUnlockedUseCaseParam(
        course: course,
        lessonId: lessonId,
        progressByLessonId: progressByLessonId,
      ),
    );
  }
}
