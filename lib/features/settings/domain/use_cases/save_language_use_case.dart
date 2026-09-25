import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/core/errors/failure.dart';
import 'package:thaheen_task/features/settings/domain/entities/app_settings.dart';
import 'package:thaheen_task/features/settings/domain/repositories/settings_repository.dart';

@injectable
final class SaveLanguageUseCase {
  const SaveLanguageUseCase(this._repository);

  final SettingsRepository _repository;

  Future<Either<Failure, Unit>> call(SaveLanguageUseCaseParam param) {
    return _repository.saveLanguage(param.language);
  }
}

final class SaveLanguageUseCaseParam {
  const SaveLanguageUseCaseParam({required this.language});

  final AppLanguage language;
}
