import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/save_lesson_progress_use_case.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/lesson_player/lesson_player_state.dart';

@injectable
final class LessonPlayerCubit extends Cubit<LessonPlayerState> {
  LessonPlayerCubit(this._saveProgress) : super(const LessonPlayerState());

  final SaveLessonProgressUseCase _saveProgress;

  void initialize(Lesson lesson) {
    if (state.progress != null) return;
    emit(
      state.copyWith(
        progress: LessonProgress.notStarted(
          lessonId: lesson.id,
          duration: lesson.duration,
        ),
        clearError: true,
      ),
    );
  }

  Future<void> positionChanged({
    required Duration position,
    required Duration duration,
  }) async {
    final current = state.progress;
    if (current == null) return;

    final updatedProgress = current.withPosition(
      newPosition: position,
      newDuration: duration,
      watchedAt: DateTime.now(),
    );

    emit(state.copyWith(isSaving: true, clearError: true));
    final result = await _saveProgress(
      SaveLessonProgressUseCaseParam(
        updatedProgress: updatedProgress,
      ),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isSaving: false, errorMessage: failure.message)),
      (progress) => emit(
        state.copyWith(progress: progress, isSaving: false, clearError: true),
      ),
    );
  }
}
