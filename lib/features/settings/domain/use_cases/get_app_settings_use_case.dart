import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/settings/domain/entities/app_settings.dart';
import 'package:thaheen_task/features/settings/domain/repositories/settings_repository.dart';

@injectable
final class GetAppSettingsUseCase {
  const GetAppSettingsUseCase(this._repository);

  final SettingsRepository _repository;

  Future<Either<Failure, AppSettings>> call(
    GetAppSettingsUseCaseParam param,
  ) {
    return _repository.getSettings();
  }
}

final class GetAppSettingsUseCaseParam {
  const GetAppSettingsUseCaseParam();
}
