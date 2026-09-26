import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';

part 'courses_state.freezed.dart';

@freezed
sealed class CoursesState with _$CoursesState {
  const factory CoursesState.initial() = CoursesInitial;
  const factory CoursesState.loading() = CoursesLoading;
  const factory CoursesState.empty() = CoursesEmpty;
  const factory CoursesState.loaded(
    List<Course> courses,
    Map<String, double> progressByCourseId,
  ) = CoursesLoaded;
  const factory CoursesState.error(String message) = CoursesError;
}
