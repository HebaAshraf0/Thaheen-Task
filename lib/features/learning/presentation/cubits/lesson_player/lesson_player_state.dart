import 'package:equatable/equatable.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';

final class LessonPlayerState extends Equatable {
  const LessonPlayerState({
    this.progress,
    this.isSaving = false,
    this.errorMessage,
  });

  final LessonProgress? progress;
  final bool isSaving;
  final String? errorMessage;

  LessonPlayerState copyWith({
    LessonProgress? progress,
    bool? isSaving,
    String? errorMessage,
    bool clearError = false,
  }) {
    return LessonPlayerState(
      progress: progress ?? this.progress,
      isSaving: isSaving ?? this.isSaving,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [progress, isSaving, errorMessage];
}
