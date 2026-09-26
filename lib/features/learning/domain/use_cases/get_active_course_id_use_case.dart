import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/learning/domain/repositories/progress_repository.dart';

@injectable
final class GetActiveCourseIdUseCase {
  const GetActiveCourseIdUseCase(this._repository);

  final ProgressRepository _repository;

  Future<Either<Failure, String?>> call(GetActiveCourseIdUseCaseParam param) {
    return _repository.getActiveCourseId();
  }
}

final class GetActiveCourseIdUseCaseParam {
  const GetActiveCourseIdUseCaseParam();
}
