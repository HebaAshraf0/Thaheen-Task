import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_lesson_progress_use_case.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/save_lesson_progress_use_case.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/lesson_player/lesson_player_state.dart';

@injectable
final class LessonPlayerCubit extends Cubit<LessonPlayerState> {
  LessonPlayerCubit(this._getLessonProgress, this._saveProgress)
    : super(const LessonPlayerState());

  final GetLessonProgressUseCase _getLessonProgress;
  final SaveLessonProgressUseCase _saveProgress;
  LessonProgress? _pendingProgress;
  bool _isPersisting = false;

  Future<void> initialize({
    required String courseId,
    required Lesson lesson,
  }) async {
    if (state.progress?.lessonId == lesson.id) return;

    final fallbackProgress = LessonProgress.notStarted(
      courseId: courseId,
      lessonId: lesson.id,
      duration: lesson.duration,
    );
    final result = await _getLessonProgress(
      GetLessonProgressUseCaseParam(lessonId: lesson.id),
    );
    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          progress: fallbackProgress,
          isSaving: false,
          errorMessage: failure.message,
        ),
      ),
      (savedProgress) => emit(
        state.copyWith(
          progress: savedProgress ?? fallbackProgress,
          isSaving: false,
          errorMessage: null,
        ),
      ),
    );
  }

  void positionChanged({
    required Duration position,
    required Duration duration,
  }) {
    final current = state.progress;
    if (current == null) return;

    final updatedProgress = current.withPosition(
      newPosition: position,
      newDuration: duration,
      watchedAt: DateTime.now(),
    );

    emit(
      state.copyWith(
        progress: updatedProgress,
        isSaving: true,
        errorMessage: null,
      ),
    );
    _pendingProgress = updatedProgress;
    if (!_isPersisting) unawaited(_persistPendingProgress());
  }

  Future<void> _persistPendingProgress() async {
    _isPersisting = true;

    while (_pendingProgress != null) {
      final progress = _pendingProgress!;
      _pendingProgress = null;
      final result = await _saveProgress(
        SaveLessonProgressUseCaseParam(updatedProgress: progress),
      );
      if (isClosed) return;

      result.fold(
        (failure) => emit(state.copyWith(errorMessage: failure.message)),
        (savedProgress) {
          emit(
            state.copyWith(
              latestSavedProgress: savedProgress,
              errorMessage: null,
            ),
          );
        },
      );
    }

    _isPersisting = false;
    if (!isClosed) emit(state.copyWith(isSaving: false));
  }
}
