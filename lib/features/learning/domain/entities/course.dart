import 'package:equatable/equatable.dart';
import 'package:thaheen_task/features/learning/domain/entities/course_section.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';

final class Course extends Equatable {
  const Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.thumbnailAssetPath,
    required this.sections,
  });

  final String id;
  final String title;
  final String instructor;
  final String thumbnailAssetPath;
  final List<CourseSection> sections;

  List<Lesson> get lessons => [
        for (final section in sections) ...section.lessons,
      ];

  int get lessonCount => lessons.length;

  Lesson? lessonById(String lessonId) {
    for (final lesson in lessons) {
      if (lesson.id == lessonId) return lesson;
    }
    return null;
  }

  @override
  List<Object?> get props => [
        id,
        title,
        instructor,
        thumbnailAssetPath,
        sections,
      ];
}
