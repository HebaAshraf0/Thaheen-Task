import 'package:equatable/equatable.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';

sealed class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object?> get props => [];
}

final class CoursesInitial extends CoursesState {
  const CoursesInitial();
}

final class CoursesLoading extends CoursesState {
  const CoursesLoading();
}

final class CoursesEmpty extends CoursesState {
  const CoursesEmpty();
}

final class CoursesLoaded extends CoursesState {
  const CoursesLoaded(this.courses);

  final List<Course> courses;

  @override
  List<Object?> get props => [courses];
}

final class CoursesError extends CoursesState {
  const CoursesError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
