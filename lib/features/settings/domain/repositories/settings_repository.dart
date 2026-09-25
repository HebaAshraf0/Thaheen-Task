import 'package:dartz/dartz.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/settings/domain/entities/app_settings.dart';

abstract interface class SettingsRepository {
  Future<Either<Failure, AppSettings>> getSettings();

  Future<Either<Failure, Unit>> saveThemePreference(
    AppThemePreference preference,
  );

  Future<Either<Failure, Unit>> saveLanguage(AppLanguage language);
}
