import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_course_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_next_lesson_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/is_lesson_unlocked_use_case.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_state.dart';

@injectable
final class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  CourseDetailsCubit(
    this._getCourse,
    this._getNextLesson,
    this._isLessonUnlocked,
  ) : super(const CourseDetailsInitial());

  final GetCourseUseCase _getCourse;
  final GetNextLessonUseCase _getNextLesson;
  final IsLessonUnlockedUseCase _isLessonUnlocked;

  Future<void> load(String courseId) async {
    emit(const CourseDetailsLoading());
    final result = await _getCourse(GetCourseUseCaseParam(courseId: courseId));
    result.fold(
      (failure) => emit(CourseDetailsError(failure.message)),
      (course) => emit(
        course == null
            ? const CourseDetailsNotFound()
            : CourseDetailsLoaded(course),
      ),
    );
  }

  Lesson? getNextUnlockedLesson({
    required String currentLessonId,
    required Map<String, LessonProgress> progressByLessonId,
  }) {
    final currentState = state;
    if (currentState is! CourseDetailsLoaded) return null;

    final nextLesson = _getNextLesson(
      GetNextLessonUseCaseParam(
        course: currentState.course,
        currentLessonId: currentLessonId,
      ),
    );
    if (nextLesson == null) return null;

    final isUnlocked = _isLessonUnlocked(
      IsLessonUnlockedUseCaseParam(
        course: currentState.course,
        lessonId: nextLesson.id,
        progressByLessonId: progressByLessonId,
      ),
    );

    return isUnlocked ? nextLesson : null;
  }
}
