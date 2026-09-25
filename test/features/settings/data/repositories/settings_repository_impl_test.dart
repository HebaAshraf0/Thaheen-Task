import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thaheen_task/features/settings/data/datasources/settings_local_data_source.dart';
import 'package:thaheen_task/features/settings/data/models/app_settings_model.dart';
import 'package:thaheen_task/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:thaheen_task/features/settings/domain/entities/app_settings.dart';

final class _MockSettingsLocalDataSource extends Mock
    implements SettingsLocalDataSource {}

void main() {
  late SettingsLocalDataSource dataSource;
  late SettingsRepositoryImpl repository;

  setUp(() {
    dataSource = _MockSettingsLocalDataSource();
    repository = SettingsRepositoryImpl(dataSource);
  });

  test('maps stored preference values to domain settings', () async {
    when(() => dataSource.getSettings()).thenAnswer(
      (_) async => const AppSettingsModel(
        themePreferenceName: 'dark',
        languageCode: 'en',
      ),
    );

    final result = await repository.getSettings();

    expect(
      result.getOrElse(() => const AppSettings.defaults()),
      const AppSettings(
        themePreference: AppThemePreference.dark,
        language: AppLanguage.english,
      ),
    );
  });

  test('saves the domain theme preference as a string', () async {
    when(
      () => dataSource.saveThemePreference('dark'),
    ).thenAnswer((_) async {});

    final result = await repository.saveThemePreference(
      AppThemePreference.dark,
    );

    expect(result.isRight(), isTrue);
    verify(() => dataSource.saveThemePreference('dark')).called(1);
  });

  test('saves the domain language as its locale code', () async {
    when(
      () => dataSource.saveLanguageCode('en'),
    ).thenAnswer((_) async {});

    final result = await repository.saveLanguage(AppLanguage.english);

    expect(result.isRight(), isTrue);
    verify(() => dataSource.saveLanguageCode('en')).called(1);
  });
}
