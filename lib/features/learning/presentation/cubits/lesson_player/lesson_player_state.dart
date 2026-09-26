import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';

part 'lesson_player_state.freezed.dart';

@freezed
abstract class LessonPlayerState with _$LessonPlayerState {
  const factory LessonPlayerState({
    LessonProgress? progress,
    LessonProgress? latestSavedProgress,
    @Default(false) bool isSaving,
    String? errorMessage,
  }) = _LessonPlayerState;
}
