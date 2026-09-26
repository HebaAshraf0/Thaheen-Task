import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/features/learning/domain/entities/continue_watching_lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_active_course_id_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_all_lesson_progress_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_continue_watching_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_course_use_case.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/continue_watching/continue_watching_state.dart';

@injectable
final class ContinueWatchingCubit extends Cubit<ContinueWatchingState> {
  ContinueWatchingCubit(
    this._getAllLessonProgressUseCase,
    this._getActiveCourseIdUseCase,
    this._getCourseUseCase,
    this._getContinueWatchingUseCase,
  ) : super(const ContinueWatchingState.initial());

  final GetAllLessonProgressUseCase _getAllLessonProgressUseCase;
  final GetActiveCourseIdUseCase _getActiveCourseIdUseCase;
  final GetCourseUseCase _getCourseUseCase;
  final GetContinueWatchingUseCase _getContinueWatchingUseCase;
  Map<String, LessonProgress> _progressByLessonId = const {};
  String? _activeCourseId;
  int _stateRevision = 0;

  Future<void> load() async {
    emit(const ContinueWatchingState.loading());
    if (!await _loadAllLessonProgress()) return;
    if (!await _loadActiveCourseId()) return;
    await _prepareState();
  }

  Future<void> progressUpdated(LessonProgress progress) async {
    _progressByLessonId = {..._progressByLessonId, progress.lessonId: progress};
    _activeCourseId = progress.courseId;
    await _prepareState();
  }

  Future<bool> _loadAllLessonProgress() async {
    final result = await _getAllLessonProgressUseCase(
      const GetAllLessonProgressUseCaseParam(),
    );
    if (isClosed) return false;

    return result.fold(
      (failure) {
        _emitErrorState(failure.message);
        return false;
      },
      (progress) {
        _progressByLessonId = progress;
        return true;
      },
    );
  }

  Future<bool> _loadActiveCourseId() async {
    final result = await _getActiveCourseIdUseCase(
      const GetActiveCourseIdUseCaseParam(),
    );
    if (isClosed) return false;

    return result.fold(
      (failure) {
        _emitErrorState(failure.message);
        return false;
      },
      (courseId) {
        _activeCourseId = courseId;
        return true;
      },
    );
  }

  Future<void> _prepareState() async {
    final revision = ++_stateRevision;
    final course = await _loadActiveCourse();
    if (isClosed || revision != _stateRevision) return;
    if (course == null) {
      _emitHiddenState();
      return;
    }

    final lesson = _findContinueWatching(course);
    if (lesson == null) {
      _emitHiddenState();
      return;
    }
    _emitLoadedState(lesson);
  }

  Future<Course?> _loadActiveCourse() async {
    final courseId = _activeCourseId;
    if (courseId == null || courseId.isEmpty) return null;

    final result = await _getCourseUseCase(
      GetCourseUseCaseParam(courseId: courseId),
    );
    return result.fold((_) => null, (course) => course);
  }

  ContinueWatchingLesson? _findContinueWatching(Course course) {
    return _getContinueWatchingUseCase(
      GetContinueWatchingUseCaseParam(
        course: course,
        progressByLessonId: _progressByLessonId,
      ),
    );
  }

  void _emitHiddenState() {
    emit(const ContinueWatchingState.hidden());
  }

  void _emitLoadedState(ContinueWatchingLesson lesson) {
    emit(ContinueWatchingState.loaded(lesson));
  }

  void _emitErrorState(String message) {
    emit(ContinueWatchingState.error(message));
  }
}
