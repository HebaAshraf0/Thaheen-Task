import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/errors/app_exception.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/learning/data/datasources/course_asset_data_source.dart';
import 'package:thaheen_task/features/learning/data/mappers/course_mapper.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/repositories/course_repository.dart';

@LazySingleton(as: CourseRepository)
final class CourseRepositoryImpl implements CourseRepository {
  const CourseRepositoryImpl(this._dataSource);

  final CourseAssetDataSource _dataSource;

  @override
  Future<Either<Failure, List<Course>>> getCourses() async {
    try {
      final models = await _dataSource.getCourses();
      return Right(models.map((model) => model.toEntity()).toList());
    } on AssetDataException catch (error) {
      return Left(AssetFailure(error.message));
    } catch (error) {
      return Left(UnexpectedFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Course?>> getCourse(String courseId) async {
    final result = await getCourses();

    return result.map((courses) {
      for (final course in courses) {
        if (course.id == courseId) return course;
      }

      return null;
    });
  }
}
