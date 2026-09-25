import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/constants/asset_paths.dart';
import 'package:thaheen_task/core/errors/app_exception.dart';
import 'package:thaheen_task/features/learning/data/datasources/course_asset_data_source.dart';
import 'package:thaheen_task/features/learning/data/models/course_model.dart';

@LazySingleton(as: CourseAssetDataSource)
final class CourseAssetDataSourceImpl implements CourseAssetDataSource {
  const CourseAssetDataSourceImpl(this._assetBundle);

  final AssetBundle _assetBundle;

  @override
  Future<List<CourseModel>> getCourses() async {
    try {
      final source = await _assetBundle.loadString(AssetPaths.courses);
      final decoded = jsonDecode(source);
      if (decoded is! Map<String, dynamic>) {
        throw const AssetDataException('Invalid courses JSON root.');
      }
      final courses = decoded['courses'];
      if (courses is! List<dynamic>) {
        throw const AssetDataException('Courses must be a JSON list.');
      }
      return courses
          .map(
            (course) =>
                CourseModel.fromJson(Map<String, dynamic>.from(course as Map)),
          )
          .toList(growable: false);
    } on AppException {
      rethrow;
    } catch (error) {
      throw AssetDataException('Could not load bundled courses.', error);
    }
  }
}
