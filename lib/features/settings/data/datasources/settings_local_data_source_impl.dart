import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thaheen_task/core/constants/app_constants.dart';
import 'package:thaheen_task/core/errors/app_exception.dart';
import 'package:thaheen_task/features/settings/data/datasources/settings_local_data_source.dart';
import 'package:thaheen_task/features/settings/data/models/app_settings_model.dart';

@LazySingleton(as: SettingsLocalDataSource)
final class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  const SettingsLocalDataSourceImpl(this._preferences);

  final SharedPreferencesAsync _preferences;

  @override
  Future<AppSettingsModel> getSettings() async {
    try {
      return AppSettingsModel(
        themePreferenceName: await _preferences.getString(
          AppConstants.themePreferenceStorageKey,
        ),
        languageCode: await _preferences.getString(
          AppConstants.languageCodeStorageKey,
        ),
      );
    } catch (error) {
      throw LocalStorageException('Could not read app settings.', error);
    }
  }

  @override
  Future<void> saveThemePreference(String preferenceName) async {
    try {
      await _preferences.setString(
        AppConstants.themePreferenceStorageKey,
        preferenceName,
      );
    } catch (error) {
      throw LocalStorageException('Could not save the theme mode.', error);
    }
  }

  @override
  Future<void> saveLanguageCode(String languageCode) async {
    try {
      await _preferences.setString(
        AppConstants.languageCodeStorageKey,
        languageCode,
      );
    } catch (error) {
      throw LocalStorageException('Could not save the language.', error);
    }
  }
}
