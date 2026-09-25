import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/repositories/course_repository.dart';

@injectable
final class GetCourseUseCase {
  const GetCourseUseCase(this._repository);

  final CourseRepository _repository;

  Future<Either<Failure, Course?>> call(GetCourseUseCaseParam param) {
    return _repository.getCourse(param.courseId);
  }
}

final class GetCourseUseCaseParam {
  const GetCourseUseCaseParam({required this.courseId});

  final String courseId;
}
