import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/features/settings/domain/entities/app_settings.dart';
import 'package:thaheen_task/features/settings/domain/use_cases/get_app_settings_use_case.dart';
import 'package:thaheen_task/features/settings/domain/use_cases/save_language_use_case.dart';
import 'package:thaheen_task/features/settings/domain/use_cases/save_theme_preference_use_case.dart';
import 'package:thaheen_task/features/settings/presentation/cubits/app_settings/app_settings_state.dart';

@injectable
final class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit(
    this._getAppSettings,
    this._saveThemePreference,
    this._saveLanguage,
  ) : super(const AppSettingsState());

  final GetAppSettingsUseCase _getAppSettings;
  final SaveThemePreferenceUseCase _saveThemePreference;
  final SaveLanguageUseCase _saveLanguage;

  Future<void> load() async {
    final result = await _getAppSettings(const GetAppSettingsUseCaseParam());
    result.fold(
      (_) {},
      (settings) => emit(AppSettingsState.fromEntity(settings)),
    );
  }

  Future<void> setDarkMode({required bool isDark}) async {
    final preference = isDark
        ? AppThemePreference.dark
        : AppThemePreference.light;
    final result = await _saveThemePreference(
      SaveThemePreferenceUseCaseParam(preference: preference),
    );
    result.fold(
      (_) {},
      (_) => emit(state.copyWith(themePreference: preference)),
    );
  }

  Future<void> setLanguage(AppLanguage language) async {
    if (language == state.language) return;

    final result = await _saveLanguage(
      SaveLanguageUseCaseParam(language: language),
    );
    result.fold((_) {}, (_) => emit(state.copyWith(language: language)));
  }
}
