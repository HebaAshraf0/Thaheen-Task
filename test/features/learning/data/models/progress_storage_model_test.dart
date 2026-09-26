import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:thaheen_task/features/learning/data/models/lesson_progress_model.dart';
import 'package:thaheen_task/features/learning/data/models/progress_storage_model.dart';

void main() {
  test('prepares an up-to-date payload for direct local storage', () {
    const savedProgress = LessonProgressModel(
      courseId: 'course-1',
      lessonId: 'lesson-1',
      positionMilliseconds: 1000,
      durationMilliseconds: 10000,
      lastWatchedAtMilliseconds: 1,
      isCompleted: false,
    );
    const updatedProgress = LessonProgressModel(
      courseId: 'course-1',
      lessonId: 'lesson-1',
      positionMilliseconds: 9000,
      durationMilliseconds: 10000,
      lastWatchedAtMilliseconds: 2,
      isCompleted: true,
    );

    final storageModel = ProgressStorageModel.fromUpdate(
      savedProgress: const [savedProgress],
      updatedProgress: updatedProgress,
    );
    final encodedProgress = jsonDecode(storageModel.encodedProgress) as List;

    expect(storageModel.activeCourseId, 'course-1');
    expect(encodedProgress, hasLength(1));
    expect(encodedProgress.single['positionMilliseconds'], 9000);
    expect(encodedProgress.single['isCompleted'], isTrue);
  });
}
