import 'package:equatable/equatable.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';

final class ContinueWatchingLesson extends Equatable {
  const ContinueWatchingLesson({
    required this.course,
    required this.lesson,
    required this.progress,
  });

  final Course course;
  final Lesson lesson;
  final LessonProgress progress;

  @override
  List<Object> get props => [course, lesson, progress];
}
