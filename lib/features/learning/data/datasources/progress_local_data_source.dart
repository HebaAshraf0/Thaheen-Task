import 'package:thaheen_task/features/learning/data/models/lesson_progress_model.dart';

abstract interface class ProgressLocalDataSource {
  Future<List<LessonProgressModel>> getAllProgress();

  Future<void> saveProgress(LessonProgressModel progress);
}
