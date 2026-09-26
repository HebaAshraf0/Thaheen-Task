import 'package:dartz/dartz.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';

abstract interface class ProgressRepository {
  Future<Either<Failure, Map<String, LessonProgress>>> getAllProgress();

  Future<Either<Failure, String?>> getActiveCourseId();

  Future<Either<Failure, LessonProgress?>> getLessonProgress(String lessonId);

  Future<Either<Failure, Unit>> saveProgress(LessonProgress progress);
}
