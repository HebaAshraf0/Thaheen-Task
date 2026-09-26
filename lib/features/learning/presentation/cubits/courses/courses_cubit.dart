import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/calculate_course_progress_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_all_lesson_progress_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_courses_use_case.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/courses/courses_state.dart';

@injectable
final class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit(
    this._getCoursesUseCase,
    this._getAllLessonProgressUseCase,
    this._calculateCourseProgressUseCase,
  ) : super(const CoursesState.initial());

  final GetCoursesUseCase _getCoursesUseCase;
  final GetAllLessonProgressUseCase _getAllLessonProgressUseCase;
  final CalculateCourseProgressUseCase _calculateCourseProgressUseCase;
  Map<String, LessonProgress> _progressByLessonId = const {};

  Future<void> load() async {
    emit(const CoursesState.loading());
    final courses = await _loadCourses();
    if (courses == null || isClosed) return;
    if (courses.isEmpty) {
      emit(const CoursesState.empty());
      return;
    }

    _progressByLessonId = await _loadAllLessonProgress();
    if (isClosed) return;
    _emitLoadedState(courses, _buildProgressByCourseId(courses));
  }

  void progressUpdated(LessonProgress progress) {
    final courses = state.maybeWhen(
      loaded: (courses, _) => courses,
      orElse: () => null,
    );
    if (courses == null) return;

    _progressByLessonId = {..._progressByLessonId, progress.lessonId: progress};
    _emitLoadedState(courses, _buildProgressByCourseId(courses));
  }

  Future<List<Course>?> _loadCourses() async {
    final result = await _getCoursesUseCase();
    if (isClosed) return null;

    return result.fold((failure) {
      emit(CoursesState.error(failure.message));
      return null;
    }, (courses) => courses);
  }

  Future<Map<String, LessonProgress>> _loadAllLessonProgress() async {
    final result = await _getAllLessonProgressUseCase(
      const GetAllLessonProgressUseCaseParam(),
    );
    return result.fold((_) => const {}, (progress) => progress);
  }

  Map<String, double> _buildProgressByCourseId(List<Course> courses) {
    return {
      for (final course in courses)
        course.id: _calculateProgressForCourse(course),
    };
  }

  double _calculateProgressForCourse(Course course) {
    return _calculateCourseProgressUseCase(
      CalculateCourseProgressUseCaseParam(
        course: course,
        progressByLessonId: _progressByLessonId,
      ),
    );
  }

  void _emitLoadedState(
    List<Course> courses,
    Map<String, double> progressByCourseId,
  ) {
    emit(CoursesState.loaded(courses, progressByCourseId));
  }
}
