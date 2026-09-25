import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thaheen_task/app/theme/app_colors.dart';
import 'package:thaheen_task/app/theme/app_screen_config.dart';
import 'package:thaheen_task/app/theme/app_theme.dart';

void main() {
  testWidgets('light theme uses the Thaheen website palette', (tester) async {
    final theme = await _pumpTheme(tester, () => AppTheme.light);

    expect(theme.brightness, Brightness.light);
    expect(theme.colorScheme.primary, AppColors.lightPrimary);
    expect(theme.colorScheme.secondary, AppColors.lightSecondary);
    expect(theme.scaffoldBackgroundColor, AppColors.lightSurface);
    expect(
      theme.extension<AppSemanticColors>(),
      AppSemanticColors.light,
    );
  });

  testWidgets('dark theme uses the Thaheen dark palette', (tester) async {
    final theme = await _pumpTheme(tester, () => AppTheme.dark);

    expect(theme.brightness, Brightness.dark);
    expect(theme.colorScheme.primary, AppColors.darkPrimary);
    expect(theme.colorScheme.secondary, AppColors.darkSecondary);
    expect(theme.scaffoldBackgroundColor, AppColors.darkSurface);
    expect(
      theme.extension<AppSemanticColors>(),
      AppSemanticColors.dark,
    );
  });
}

Future<ThemeData> _pumpTheme(
  WidgetTester tester,
  ThemeData Function() createTheme,
) async {
  late ThemeData theme;

  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: AppScreenConfig.designSize,
      minTextAdapt: true,
      builder: (_, _) {
        theme = createTheme();
        return MaterialApp(
          theme: theme,
          home: const SizedBox.shrink(),
        );
      },
    ),
  );
  await tester.pumpAndSettle();

  return theme;
}
