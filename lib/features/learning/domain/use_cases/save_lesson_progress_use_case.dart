import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/repositories/progress_repository.dart';

@injectable
final class SaveLessonProgressUseCase {
  const SaveLessonProgressUseCase(this._repository);

  final ProgressRepository _repository;

  Future<Either<Failure, LessonProgress>> call(
    SaveLessonProgressUseCaseParam param,
  ) async {
    final result = await _repository.saveProgress(param.updatedProgress);
    return result.map((_) => param.updatedProgress);
  }
}

final class SaveLessonProgressUseCaseParam {
  const SaveLessonProgressUseCaseParam({required this.updatedProgress});

  final LessonProgress updatedProgress;
}
