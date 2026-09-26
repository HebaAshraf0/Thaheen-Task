import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';

part 'course_details_state.freezed.dart';

@freezed
sealed class CourseDetailsState with _$CourseDetailsState {
  const factory CourseDetailsState.initial() = CourseDetailsInitial;
  const factory CourseDetailsState.loading() = CourseDetailsLoading;
  const factory CourseDetailsState.loaded(
    Course course,
    Map<String, LessonProgress> progressByLessonId,
  ) = CourseDetailsLoaded;
  const factory CourseDetailsState.empty(Course course) = CourseDetailsEmpty;
  const factory CourseDetailsState.notFound() = CourseDetailsNotFound;
  const factory CourseDetailsState.error(String message) = CourseDetailsError;
}
