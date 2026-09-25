import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/errors/app_exception.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/settings/data/datasources/settings_local_data_source.dart';
import 'package:thaheen_task/features/settings/data/mappers/app_settings_mapper.dart';
import 'package:thaheen_task/features/settings/domain/entities/app_settings.dart';
import 'package:thaheen_task/features/settings/domain/repositories/settings_repository.dart';

@LazySingleton(as: SettingsRepository)
final class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl(this._dataSource);

  final SettingsLocalDataSource _dataSource;

  @override
  Future<Either<Failure, AppSettings>> getSettings() async {
    try {
      final model = await _dataSource.getSettings();
      return Right(model.toEntity());
    } on LocalStorageException catch (error) {
      return Left(StorageFailure(error.message));
    } catch (error) {
      return Left(UnexpectedFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveThemePreference(
    AppThemePreference preference,
  ) async {
    try {
      await _dataSource.saveThemePreference(preference.name);
      return const Right(unit);
    } on LocalStorageException catch (error) {
      return Left(StorageFailure(error.message));
    } catch (error) {
      return Left(UnexpectedFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveLanguage(AppLanguage language) async {
    try {
      await _dataSource.saveLanguageCode(language.code);
      return const Right(unit);
    } on LocalStorageException catch (error) {
      return Left(StorageFailure(error.message));
    } catch (error) {
      return Left(UnexpectedFailure(error.toString()));
    }
  }
}
