import 'package:thaheen_task/features/settings/data/models/app_settings_model.dart';

abstract interface class SettingsLocalDataSource {
  Future<AppSettingsModel> getSettings();

  Future<void> saveThemePreference(String preferenceName);

  Future<void> saveLanguageCode(String languageCode);
}
