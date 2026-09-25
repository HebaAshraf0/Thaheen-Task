import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:thaheen_task/features/settings/domain/entities/app_settings.dart';

final class AppSettingsState extends Equatable {
  const AppSettingsState({
    required this.themePreference,
    required this.language,
  });

  const AppSettingsState.initial()
      : themePreference = AppThemePreference.system,
        language = AppLanguage.arabic;

  factory AppSettingsState.fromEntity(AppSettings settings) {
    return AppSettingsState(
      themePreference: settings.themePreference,
      language: settings.language,
    );
  }

  final AppThemePreference themePreference;
  final AppLanguage language;

  ThemeMode get themeMode => switch (themePreference) {
        AppThemePreference.system => ThemeMode.system,
        AppThemePreference.light => ThemeMode.light,
        AppThemePreference.dark => ThemeMode.dark,
      };

  Locale get locale => Locale(language.code);

  AppSettingsState copyWith({
    AppThemePreference? themePreference,
    AppLanguage? language,
  }) {
    return AppSettingsState(
      themePreference: themePreference ?? this.themePreference,
      language: language ?? this.language,
    );
  }

  @override
  List<Object> get props => [themePreference, language];
}
