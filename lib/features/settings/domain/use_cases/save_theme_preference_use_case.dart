import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/settings/domain/entities/app_settings.dart';
import 'package:thaheen_task/features/settings/domain/repositories/settings_repository.dart';

@injectable
final class SaveThemePreferenceUseCase {
  const SaveThemePreferenceUseCase(this._repository);

  final SettingsRepository _repository;

  Future<Either<Failure, Unit>> call(
    SaveThemePreferenceUseCaseParam param,
  ) {
    return _repository.saveThemePreference(param.preference);
  }
}

final class SaveThemePreferenceUseCaseParam {
  const SaveThemePreferenceUseCaseParam({required this.preference});

  final AppThemePreference preference;
}
