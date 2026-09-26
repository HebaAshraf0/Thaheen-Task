import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/errors/app_exception.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/learning/data/datasources/progress_local_data_source.dart';
import 'package:thaheen_task/features/learning/data/mappers/lesson_progress_mapper.dart';
import 'package:thaheen_task/features/learning/data/models/progress_storage_model.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/repositories/progress_repository.dart';

@LazySingleton(as: ProgressRepository)
final class ProgressRepositoryImpl implements ProgressRepository {
  const ProgressRepositoryImpl(this._dataSource);

  final ProgressLocalDataSource _dataSource;

  @override
  Future<Either<Failure, Map<String, LessonProgress>>> getAllProgress() async {
    try {
      final models = await _dataSource.getAllProgress();
      final progress = {
        for (final model in models) model.lessonId: model.toEntity(),
      };
      return Right(progress);
    } on LocalStorageException catch (error) {
      return Left(StorageFailure(error.message));
    } catch (error) {
      return Left(UnexpectedFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> getActiveCourseId() async {
    try {
      return Right(await _dataSource.getActiveCourseId());
    } on LocalStorageException catch (error) {
      return Left(StorageFailure(error.message));
    } catch (error) {
      return Left(UnexpectedFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, LessonProgress?>> getLessonProgress(
    String lessonId,
  ) async {
    final result = await getAllProgress();
    return result.map((progressByLessonId) => progressByLessonId[lessonId]);
  }

  @override
  Future<Either<Failure, Unit>> saveProgress(LessonProgress progress) async {
    try {
      final storageModel = ProgressStorageModel.fromUpdate(
        savedProgress: await _dataSource.getAllProgress(),
        updatedProgress: progress.toModel(),
      );
      await _dataSource.saveProgress(storageModel);
      return const Right(unit);
    } on LocalStorageException catch (error) {
      return Left(StorageFailure(error.message));
    } catch (error) {
      return Left(UnexpectedFailure(error.toString()));
    }
  }
}
