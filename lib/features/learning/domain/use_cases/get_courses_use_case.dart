import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/repositories/course_repository.dart';

@injectable
final class GetCoursesUseCase {
  const GetCoursesUseCase(this._repository);

  final CourseRepository _repository;

  Future<Either<Failure, List<Course>>> call() {
    return _repository.getCourses();
  }
}
