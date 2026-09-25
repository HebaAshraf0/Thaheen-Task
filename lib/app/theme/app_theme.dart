import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/app/theme/app_colors.dart';

abstract final class AppTheme {
  static const _lightColorScheme = ColorScheme.light(
    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightOnPrimary,
    primaryContainer: AppColors.lightPrimaryContainer,
    onPrimaryContainer: AppColors.lightOnPrimaryContainer,
    secondary: AppColors.lightSecondary,
    onSecondary: AppColors.lightOnSecondary,
    secondaryContainer: AppColors.lightSecondaryContainer,
    onSecondaryContainer: AppColors.lightOnSecondaryContainer,
    error: AppColors.lightError,
    onError: Colors.white,
    errorContainer: AppColors.lightErrorContainer,
    onErrorContainer: AppColors.lightOnErrorContainer,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightOnSurface,
    onSurfaceVariant: AppColors.lightOnSurfaceVariant,
    outline: AppColors.lightOutline,
    outlineVariant: AppColors.lightOutlineVariant,
    surfaceDim: AppColors.lightSurfaceDim,
    surfaceBright: AppColors.lightSurfaceBright,
    surfaceContainerLowest: AppColors.lightSurfaceContainerLowest,
    surfaceContainerLow: AppColors.lightSurfaceContainerLow,
    surfaceContainer: AppColors.lightSurfaceContainer,
    surfaceContainerHigh: AppColors.lightSurfaceContainerHigh,
    surfaceContainerHighest: AppColors.lightSurfaceContainerHighest,
    inverseSurface: AppColors.lightInverseSurface,
    onInverseSurface: AppColors.lightOnInverseSurface,
    inversePrimary: AppColors.darkPrimary,
    shadow: Colors.black,
    scrim: Colors.black,
    surfaceTint: AppColors.lightPrimary,
  );

  static const _darkColorScheme = ColorScheme.dark(
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,
    primaryContainer: AppColors.darkPrimaryContainer,
    onPrimaryContainer: AppColors.darkOnPrimaryContainer,
    secondary: AppColors.darkSecondary,
    onSecondary: AppColors.darkOnSecondary,
    secondaryContainer: AppColors.darkSecondaryContainer,
    onSecondaryContainer: AppColors.darkOnSecondaryContainer,
    error: AppColors.darkError,
    onError: Colors.white,
    errorContainer: AppColors.darkErrorContainer,
    onErrorContainer: AppColors.darkOnErrorContainer,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkOnSurface,
    onSurfaceVariant: AppColors.darkOnSurfaceVariant,
    outline: AppColors.darkOutline,
    outlineVariant: AppColors.darkOutlineVariant,
    surfaceDim: AppColors.darkSurfaceDim,
    surfaceBright: AppColors.darkSurfaceBright,
    surfaceContainerLowest: AppColors.darkSurfaceContainerLowest,
    surfaceContainerLow: AppColors.darkSurfaceContainerLow,
    surfaceContainer: AppColors.darkSurfaceContainer,
    surfaceContainerHigh: AppColors.darkSurfaceContainerHigh,
    surfaceContainerHighest: AppColors.darkSurfaceContainerHighest,
    inverseSurface: AppColors.darkInverseSurface,
    onInverseSurface: AppColors.darkOnInverseSurface,
    inversePrimary: AppColors.lightPrimary,
    shadow: Colors.black,
    scrim: Colors.black,
    surfaceTint: AppColors.darkPrimary,
  );

  static ThemeData get light => _buildTheme(
        colorScheme: _lightColorScheme,
        semanticColors: AppSemanticColors.light,
      );

  static ThemeData get dark => _buildTheme(
        colorScheme: _darkColorScheme,
        semanticColors: AppSemanticColors.dark,
      );

  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required AppSemanticColors semanticColors,
  }) {
    final border = BorderSide(
      color: colorScheme.outlineVariant,
      width: 1.w,
    );

    final theme = ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      extensions: [semanticColors],
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 56.h,
        titleSpacing: 16.w,
        iconTheme: IconThemeData(size: 24.r, color: colorScheme.onSurface),
      ),
      cardTheme: CardThemeData(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: colorScheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        shadowColor: colorScheme.shadow.withValues(alpha: 0.08),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: border,
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: colorScheme.primary,
        textColor: colorScheme.onSurface,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        minLeadingWidth: 24.w,
        horizontalTitleGap: 12.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.surfaceContainerHighest,
      ),
      iconTheme: IconThemeData(size: 24.r, color: colorScheme.onSurface),
    );

    return theme.copyWith(
      textTheme: _scaleTextTheme(theme.textTheme),
      primaryTextTheme: _scaleTextTheme(theme.primaryTextTheme),
    );
  }

  static TextTheme _scaleTextTheme(TextTheme textTheme) {
    TextStyle? scale(TextStyle? style) {
      final fontSize = style?.fontSize;
      return fontSize == null ? style : style?.copyWith(fontSize: fontSize.sp);
    }

    return textTheme.copyWith(
      displayLarge: scale(textTheme.displayLarge),
      displayMedium: scale(textTheme.displayMedium),
      displaySmall: scale(textTheme.displaySmall),
      headlineLarge: scale(textTheme.headlineLarge),
      headlineMedium: scale(textTheme.headlineMedium),
      headlineSmall: scale(textTheme.headlineSmall),
      titleLarge: scale(textTheme.titleLarge),
      titleMedium: scale(textTheme.titleMedium),
      titleSmall: scale(textTheme.titleSmall),
      bodyLarge: scale(textTheme.bodyLarge),
      bodyMedium: scale(textTheme.bodyMedium),
      bodySmall: scale(textTheme.bodySmall),
      labelLarge: scale(textTheme.labelLarge),
      labelMedium: scale(textTheme.labelMedium),
      labelSmall: scale(textTheme.labelSmall),
    );
  }
}
