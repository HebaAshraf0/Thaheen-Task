// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:flutter/services.dart' as _i281;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/learning/data/datasources/course_asset_data_source.dart'
    as _i477;
import '../../features/learning/data/datasources/course_asset_data_source_impl.dart'
    as _i1061;
import '../../features/learning/data/datasources/progress_local_data_source.dart'
    as _i668;
import '../../features/learning/data/datasources/progress_local_data_source_impl.dart'
    as _i487;
import '../../features/learning/data/repositories/course_repository_impl.dart'
    as _i658;
import '../../features/learning/data/repositories/progress_repository_impl.dart'
    as _i997;
import '../../features/learning/domain/repositories/course_repository.dart'
    as _i166;
import '../../features/learning/domain/repositories/progress_repository.dart'
    as _i888;
import '../../features/learning/domain/use_cases/calculate_course_progress_use_case.dart'
    as _i420;
import '../../features/learning/domain/use_cases/get_continue_watching_use_case.dart'
    as _i232;
import '../../features/learning/domain/use_cases/get_course_use_case.dart'
    as _i915;
import '../../features/learning/domain/use_cases/get_courses_use_case.dart'
    as _i14;
import '../../features/learning/domain/use_cases/get_next_lesson_use_case.dart'
    as _i169;
import '../../features/learning/domain/use_cases/is_lesson_unlocked_use_case.dart'
    as _i497;
import '../../features/learning/domain/use_cases/save_lesson_progress_use_case.dart'
    as _i610;
import '../../features/learning/presentation/cubits/course_details/course_details_cubit.dart'
    as _i334;
import '../../features/learning/presentation/cubits/courses/courses_cubit.dart'
    as _i1065;
import '../../features/learning/presentation/cubits/lesson_player/lesson_player_cubit.dart'
    as _i273;
import '../../features/settings/data/datasources/settings_local_data_source.dart'
    as _i599;
import '../../features/settings/data/datasources/settings_local_data_source_impl.dart'
    as _i162;
import '../../features/settings/data/repositories/settings_repository_impl.dart'
    as _i955;
import '../../features/settings/domain/repositories/settings_repository.dart'
    as _i674;
import '../../features/settings/domain/use_cases/get_app_settings_use_case.dart'
    as _i599;
import '../../features/settings/domain/use_cases/save_language_use_case.dart'
    as _i993;
import '../../features/settings/domain/use_cases/save_theme_preference_use_case.dart'
    as _i700;
import '../../features/settings/presentation/cubits/app_settings/app_settings_cubit.dart'
    as _i684;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i420.CalculateCourseProgressUseCase>(
      () => const _i420.CalculateCourseProgressUseCase(),
    );
    gh.factory<_i169.GetNextLessonUseCase>(
      () => const _i169.GetNextLessonUseCase(),
    );
    gh.factory<_i497.IsLessonUnlockedUseCase>(
      () => const _i497.IsLessonUnlockedUseCase(),
    );
    gh.lazySingleton<_i281.AssetBundle>(() => registerModule.assetBundle);
    gh.lazySingleton<_i460.SharedPreferencesAsync>(
      () => registerModule.sharedPreferences,
    );
    gh.lazySingleton<_i477.CourseAssetDataSource>(
      () => _i1061.CourseAssetDataSourceImpl(gh<_i281.AssetBundle>()),
    );
    gh.lazySingleton<_i668.ProgressLocalDataSource>(
      () =>
          _i487.ProgressLocalDataSourceImpl(gh<_i460.SharedPreferencesAsync>()),
    );
    gh.lazySingleton<_i599.SettingsLocalDataSource>(
      () =>
          _i162.SettingsLocalDataSourceImpl(gh<_i460.SharedPreferencesAsync>()),
    );
    gh.lazySingleton<_i674.SettingsRepository>(
      () => _i955.SettingsRepositoryImpl(gh<_i599.SettingsLocalDataSource>()),
    );
    gh.factory<_i599.GetAppSettingsUseCase>(
      () => _i599.GetAppSettingsUseCase(gh<_i674.SettingsRepository>()),
    );
    gh.factory<_i993.SaveLanguageUseCase>(
      () => _i993.SaveLanguageUseCase(gh<_i674.SettingsRepository>()),
    );
    gh.factory<_i700.SaveThemePreferenceUseCase>(
      () => _i700.SaveThemePreferenceUseCase(gh<_i674.SettingsRepository>()),
    );
    gh.lazySingleton<_i888.ProgressRepository>(
      () => _i997.ProgressRepositoryImpl(gh<_i668.ProgressLocalDataSource>()),
    );
    gh.factory<_i232.GetContinueWatchingUseCase>(
      () => _i232.GetContinueWatchingUseCase(gh<_i888.ProgressRepository>()),
    );
    gh.factory<_i610.SaveLessonProgressUseCase>(
      () => _i610.SaveLessonProgressUseCase(gh<_i888.ProgressRepository>()),
    );
    gh.lazySingleton<_i166.CourseRepository>(
      () => _i658.CourseRepositoryImpl(gh<_i477.CourseAssetDataSource>()),
    );
    gh.factory<_i915.GetCourseUseCase>(
      () => _i915.GetCourseUseCase(gh<_i166.CourseRepository>()),
    );
    gh.factory<_i14.GetCoursesUseCase>(
      () => _i14.GetCoursesUseCase(gh<_i166.CourseRepository>()),
    );
    gh.factory<_i1065.CoursesCubit>(
      () => _i1065.CoursesCubit(gh<_i14.GetCoursesUseCase>()),
    );
    gh.factory<_i334.CourseDetailsCubit>(
      () => _i334.CourseDetailsCubit(
        gh<_i915.GetCourseUseCase>(),
        gh<_i169.GetNextLessonUseCase>(),
        gh<_i497.IsLessonUnlockedUseCase>(),
      ),
    );
    gh.factory<_i684.AppSettingsCubit>(
      () => _i684.AppSettingsCubit(
        gh<_i599.GetAppSettingsUseCase>(),
        gh<_i700.SaveThemePreferenceUseCase>(),
        gh<_i993.SaveLanguageUseCase>(),
      ),
    );
    gh.factory<_i273.LessonPlayerCubit>(
      () => _i273.LessonPlayerCubit(gh<_i610.SaveLessonProgressUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
