import 'package:thaheen_task/features/learning/data/models/lesson_progress_model.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';

extension LessonProgressModelMapper on LessonProgressModel {
  LessonProgress toEntity() {
    return LessonProgress(
      courseId: courseId,
      lessonId: lessonId,
      position: Duration(milliseconds: positionMilliseconds),
      duration: Duration(milliseconds: durationMilliseconds),
      lastWatchedAt: DateTime.fromMillisecondsSinceEpoch(
        lastWatchedAtMilliseconds,
      ),
      isCompleted: isCompleted,
    );
  }
}

extension LessonProgressEntityMapper on LessonProgress {
  LessonProgressModel toModel() {
    return LessonProgressModel(
      courseId: courseId,
      lessonId: lessonId,
      positionMilliseconds: position.inMilliseconds,
      durationMilliseconds: duration.inMilliseconds,
      lastWatchedAtMilliseconds: lastWatchedAt.millisecondsSinceEpoch,
      isCompleted: isCompleted,
    );
  }
}
