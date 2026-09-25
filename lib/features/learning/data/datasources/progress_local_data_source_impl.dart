import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thaheen_task/core/constants/app_constants.dart';
import 'package:thaheen_task/core/errors/app_exception.dart';
import 'package:thaheen_task/features/learning/data/datasources/progress_local_data_source.dart';
import 'package:thaheen_task/features/learning/data/models/lesson_progress_model.dart';

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
  Future<void> saveProgress(LessonProgressModel progress) async {
    try {
      final progressByLessonId = {
        for (final item in await getAllProgress()) item.lessonId: item,
      }..[progress.lessonId] = progress;
      final encoded = jsonEncode(
        progressByLessonId.values.map((item) => item.toJson()).toList(),
      );
      await _preferences.setString(AppConstants.progressStorageKey, encoded);
    } on AppException {
      rethrow;
    } catch (error) {
      throw LocalStorageException('Could not save lesson progress.', error);
    }
  }
}
