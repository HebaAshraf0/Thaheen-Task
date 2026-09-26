import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thaheen_task/features/settings/domain/entities/app_settings.dart';

part 'app_settings_state.freezed.dart';

@freezed
abstract class AppSettingsState with _$AppSettingsState {
  const AppSettingsState._();

  const factory AppSettingsState({
    @Default(AppThemePreference.system) AppThemePreference themePreference,
    @Default(AppLanguage.arabic) AppLanguage language,
  }) = _AppSettingsState;

  static AppSettingsState fromEntity(AppSettings settings) {
    return AppSettingsState(
      themePreference: settings.themePreference,
      language: settings.language,
    );
  }

  ThemeMode get themeMode => switch (themePreference) {
    AppThemePreference.system => ThemeMode.system,
    AppThemePreference.light => ThemeMode.light,
    AppThemePreference.dark => ThemeMode.dark,
  };

  Locale get locale => Locale(language.code);
}
