import 'package:dartz/dartz.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';

abstract interface class CourseRepository {
  Future<Either<Failure, List<Course>>> getCourses();

  Future<Either<Failure, Course?>> getCourse(String courseId);
}
