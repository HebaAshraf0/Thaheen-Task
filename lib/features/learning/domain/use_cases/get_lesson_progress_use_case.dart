import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/repositories/progress_repository.dart';

@injectable
final class GetLessonProgressUseCase {
  const GetLessonProgressUseCase(this._repository);

  final ProgressRepository _repository;

  Future<Either<Failure, LessonProgress?>> call(
    GetLessonProgressUseCaseParam param,
  ) {
    return _repository.getLessonProgress(param.lessonId);
  }
}

final class GetLessonProgressUseCaseParam {
  const GetLessonProgressUseCaseParam({required this.lessonId});

  final String lessonId;
}
