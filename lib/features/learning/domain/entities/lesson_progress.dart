import 'package:equatable/equatable.dart';
import 'package:thaheen_task/core/constants/app_constants.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_status.dart';

final class LessonProgress extends Equatable {
  const LessonProgress({
    required this.lessonId,
    required this.position,
    required this.duration,
    required this.lastWatchedAt,
    required this.isCompleted,
  });

  factory LessonProgress.notStarted({
    required String lessonId,
    required Duration duration,
  }) {
    return LessonProgress(
      lessonId: lessonId,
      position: Duration.zero,
      duration: duration,
      lastWatchedAt: DateTime.fromMillisecondsSinceEpoch(0),
      isCompleted: false,
    );
  }

  final String lessonId;
  final Duration position;
  final Duration duration;
  final DateTime lastWatchedAt;
  final bool isCompleted;

  /// Returns the watched portion as a value from 0.0 to 1.0.
  ///
  /// Returns 0.0 when the duration is invalid and clamps positions that fall
  /// outside the lesson duration.
  double get watchedRatio {
    if (duration <= Duration.zero) return 0;
    return (position.inMilliseconds / duration.inMilliseconds).clamp(0, 1);
  }

  LessonStatus get status {
    if (isCompleted) return LessonStatus.completed;
    if (position > Duration.zero) return LessonStatus.inProgress;
    return LessonStatus.notStarted;
  }

  /// Creates a new progress value with the latest playback position.
  ///
  /// Invalid positions and durations are normalized, [lastWatchedAt] is
  /// updated, and the lesson becomes completed after reaching the configured
  /// completion threshold. A completed lesson never becomes incomplete again.
  LessonProgress withPosition({
    required Duration newPosition,
    required Duration newDuration,
    required DateTime watchedAt,
  }) {
    final effectiveDuration =
        newDuration > Duration.zero ? newDuration : duration;
    final nonNegativePosition =
        newPosition.isNegative ? Duration.zero : newPosition;
    final effectivePosition = effectiveDuration > Duration.zero &&
            nonNegativePosition > effectiveDuration
        ? effectiveDuration
        : nonNegativePosition;
    final ratio = effectiveDuration <= Duration.zero
        ? 0.0
        : effectivePosition.inMilliseconds / effectiveDuration.inMilliseconds;

    return LessonProgress(
      lessonId: lessonId,
      position: effectivePosition,
      duration: effectiveDuration,
      lastWatchedAt: watchedAt,
      isCompleted: isCompleted || ratio >= AppConstants.completionThreshold,
    );
  }

  @override
  List<Object?> get props => [
        lessonId,
        position,
        duration,
        lastWatchedAt,
        isCompleted,
      ];
}
