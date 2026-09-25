import 'package:equatable/equatable.dart';

enum AppThemePreference { system, light, dark }

enum AppLanguage {
  arabic('ar'),
  english('en');

  const AppLanguage(this.code);

  final String code;
}

final class AppSettings extends Equatable {
  const AppSettings({
    required this.themePreference,
    required this.language,
  });

  const AppSettings.defaults()
      : themePreference = AppThemePreference.system,
        language = AppLanguage.arabic;

  final AppThemePreference themePreference;
  final AppLanguage language;

  @override
  List<Object> get props => [themePreference, language];
}
