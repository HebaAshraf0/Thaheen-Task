import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/repositories/progress_repository.dart';

@injectable
final class GetAllLessonProgressUseCase {
  const GetAllLessonProgressUseCase(this._repository);

  final ProgressRepository _repository;

  Future<Either<Failure, Map<String, LessonProgress>>> call(
    GetAllLessonProgressUseCaseParam param,
  ) {
    return _repository.getAllProgress();
  }
}

final class GetAllLessonProgressUseCaseParam {
  const GetAllLessonProgressUseCaseParam();
}
