import 'package:equatable/equatable.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';

sealed class CourseDetailsState extends Equatable {
  const CourseDetailsState();

  @override
  List<Object?> get props => [];
}

final class CourseDetailsInitial extends CourseDetailsState {
  const CourseDetailsInitial();
}

final class CourseDetailsLoading extends CourseDetailsState {
  const CourseDetailsLoading();
}

final class CourseDetailsLoaded extends CourseDetailsState {
  const CourseDetailsLoaded(this.course);

  final Course course;

  @override
  List<Object?> get props => [course];
}

final class CourseDetailsNotFound extends CourseDetailsState {
  const CourseDetailsNotFound();
}

final class CourseDetailsError extends CourseDetailsState {
  const CourseDetailsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
