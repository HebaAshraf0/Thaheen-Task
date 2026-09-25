import 'package:thaheen_task/features/settings/data/models/app_settings_model.dart';
import 'package:thaheen_task/features/settings/domain/entities/app_settings.dart';

extension AppSettingsMapper on AppSettingsModel {
  AppSettings toEntity() {
    return AppSettings(
      themePreference: AppThemePreference.values.firstWhere(
        (preference) => preference.name == themePreferenceName,
        orElse: () => AppThemePreference.system,
      ),
      language: AppLanguage.values.firstWhere(
        (language) => language.code == languageCode,
        orElse: () => AppLanguage.arabic,
      ),
    );
  }
}
