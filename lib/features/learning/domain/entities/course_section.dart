import 'package:equatable/equatable.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';

final class CourseSection extends Equatable {
  const CourseSection({
    required this.id,
    required this.title,
    required this.lessons,
  });

  final String id;
  final String title;
  final List<Lesson> lessons;

  @override
  List<Object?> get props => [id, title, lessons];
}
