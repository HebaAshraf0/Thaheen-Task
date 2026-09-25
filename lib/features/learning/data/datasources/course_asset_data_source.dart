import 'package:thaheen_task/features/learning/data/models/course_model.dart';

abstract interface class CourseAssetDataSource {
  Future<List<CourseModel>> getCourses();
}
