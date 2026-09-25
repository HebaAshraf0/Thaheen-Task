import 'package:thaheen_task/features/learning/data/models/course_model.dart';
import 'package:thaheen_task/features/learning/data/models/lesson_model.dart';
import 'package:thaheen_task/features/learning/data/models/section_model.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/course_section.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';

extension CourseModelMapper on CourseModel {
  Course toEntity() {
    return Course(
      id: id,
      title: title,
      instructor: instructor,
      thumbnailAssetPath: thumbnailAssetPath,
      sections: sections.map((section) => section.toEntity()).toList(),
    );
  }
}

extension on SectionModel {
  CourseSection toEntity() {
    return CourseSection(
      id: id,
      title: title,
      lessons: lessons.map((lesson) => lesson.toEntity()).toList(),
    );
  }
}

extension on LessonModel {
  Lesson toEntity() {
    return Lesson(
      id: id,
      title: title,
      duration: Duration(seconds: durationSeconds),
      videoAssetPath: videoAssetPath,
    );
  }
}
