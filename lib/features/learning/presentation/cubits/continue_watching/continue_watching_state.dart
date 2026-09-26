import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thaheen_task/features/learning/domain/entities/continue_watching_lesson.dart';

part 'continue_watching_state.freezed.dart';

@freezed
sealed class ContinueWatchingState with _$ContinueWatchingState {
  const factory ContinueWatchingState.initial() = ContinueWatchingInitial;
  const factory ContinueWatchingState.loading() = ContinueWatchingLoading;
  const factory ContinueWatchingState.hidden() = ContinueWatchingHidden;
  const factory ContinueWatchingState.loaded(ContinueWatchingLesson lesson) =
      ContinueWatchingLoaded;
  const factory ContinueWatchingState.error(String message) =
      ContinueWatchingError;
}
