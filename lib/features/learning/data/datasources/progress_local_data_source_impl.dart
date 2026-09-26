import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thaheen_task/core/constants/app_constants.dart';
import 'package:thaheen_task/core/errors/app_exception.dart';
import 'package:thaheen_task/features/learning/data/datasources/progress_local_data_source.dart';
import 'package:thaheen_task/features/learning/data/models/lesson_progress_model.dart';
import 'package:thaheen_task/features/learning/data/models/progress_storage_model.dart';

@LazySingleton(as: ProgressLocalDataSource)
final class ProgressLocalDataSourceImpl implements ProgressLocalDataSource {
  const ProgressLocalDataSourceImpl(this._preferences);

  final SharedPreferencesAsync _preferences;

  @override
  Future<List<LessonProgressModel>> getAllProgress() async {
    try {
      final source = await _preferences.getString(
        AppConstants.progressStorageKey,
      );
      if (source == null || source.isEmpty) return const [];

      final decoded = jsonDecode(source);
      if (decoded is! List<dynamic>) {
        throw const LocalStorageException('Invalid saved progress format.');
      }
      return decoded
          .map(
            (item) => LessonProgressModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(growable: false);
    } on AppException {
      rethrow;
    } catch (error) {
      throw LocalStorageException('Could not read lesson progress.', error);
    }
  }

  @override
  Future<String?> getActiveCourseId() async {
    try {
      return await _preferences.getString(AppConstants.activeCourseStorageKey);
    } catch (error) {
      throw LocalStorageException('Could not read the active course.', error);
    }
  }

  @override
  Future<void> saveProgress(ProgressStorageModel storageModel) async {
    try {
      await _preferences.setString(
        AppConstants.progressStorageKey,
        storageModel.encodedProgress,
      );
      await _preferences.setString(
        AppConstants.activeCourseStorageKey,
        storageModel.activeCourseId,
      );
    } on AppException {
      rethrow;
    } catch (error) {
      throw LocalStorageException('Could not save lesson progress.', error);
    }
  }
}
