import 'package:thaheen_task/features/learning/data/models/lesson_progress_model.dart';
import 'package:thaheen_task/features/learning/data/models/progress_storage_model.dart';

abstract interface class ProgressLocalDataSource {
  Future<List<LessonProgressModel>> getAllProgress();

  Future<String?> getActiveCourseId();

  Future<void> saveProgress(ProgressStorageModel storageModel);
}
