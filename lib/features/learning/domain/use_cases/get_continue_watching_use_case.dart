import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/repositories/progress_repository.dart';

@injectable
final class GetContinueWatchingUseCase {
  const GetContinueWatchingUseCase(this._repository);

  final ProgressRepository _repository;

  Future<Either<Failure, LessonProgress?>> call() async {
    final result = await _repository.getAllProgress();
    return result.map((progress) => _mostRecentUnfinished(progress.values));
  }

  LessonProgress? _mostRecentUnfinished(Iterable<LessonProgress> progress) {
    final unfinished =
        progress
            .where((item) => !item.isCompleted && item.position > Duration.zero)
            .toList()
          ..sort((a, b) => b.lastWatchedAt.compareTo(a.lastWatchedAt));
    return unfinished.isEmpty ? null : unfinished.first;
  }
}
