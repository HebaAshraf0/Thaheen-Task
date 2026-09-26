import 'dart:convert';

import 'package:thaheen_task/features/learning/data/models/lesson_progress_model.dart';

final class ProgressStorageModel {
  const ProgressStorageModel({
    required this.encodedProgress,
    required this.activeCourseId,
  });

  factory ProgressStorageModel.fromUpdate({
    required List<LessonProgressModel> savedProgress,
    required LessonProgressModel updatedProgress,
  }) {
    final progressByLessonId = {
      for (final progress in savedProgress) progress.lessonId: progress,
      updatedProgress.lessonId: updatedProgress,
    };

    return ProgressStorageModel(
      encodedProgress: jsonEncode(
        progressByLessonId.values
            .map((progress) => progress.toJson())
            .toList(growable: false),
      ),
      activeCourseId: updatedProgress.courseId,
    );
  }

  final String encodedProgress;
  final String activeCourseId;
}
