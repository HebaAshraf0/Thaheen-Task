import 'package:flutter/material.dart';

abstract final class AppColors {
  // Light palette: baby blue, cool gray, and white.
  static const lightPrimary = Color(0xFF79C7EE);
  static const lightOnPrimary = Color(0xFF173747);
  static const lightPrimaryContainer = Color(0xFFE4F5FD);
  static const lightOnPrimaryContainer = Color(0xFF244C60);
  static const lightSecondary = Color(0xFF71838D);
  static const lightOnSecondary = Color(0xFFFFFFFF);
  static const lightSecondaryContainer = Color(0xFFEDF2F5);
  static const lightOnSecondaryContainer = Color(0xFF394A53);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightOnSurface = Color(0xFF26343B);
  static const lightOnSurfaceVariant = Color(0xFF65747C);
  static const lightOutline = Color(0xFF97A6AD);
  static const lightOutlineVariant = Color(0xFFDDE7EC);
  static const lightSurfaceDim = Color(0xFFDCE7EC);
  static const lightSurfaceBright = Color(0xFFFFFFFF);
  static const lightSurfaceContainerLowest = Color(0xFFFFFFFF);
  static const lightSurfaceContainerLow = Color(0xFFF8FBFD);
  static const lightSurfaceContainer = Color(0xFFF2F7FA);
  static const lightSurfaceContainerHigh = Color(0xFFEAF2F6);
  static const lightSurfaceContainerHighest = Color(0xFFDFEAEF);
  static const lightInverseSurface = Color(0xFF2D3B42);
  static const lightOnInverseSurface = Color(0xFFF3F8FA);
  static const lightError = Color(0xFFBA1A1A);
  static const lightErrorContainer = Color(0xFFFFDAD6);
  static const lightOnErrorContainer = Color(0xFF410002);

  // Dark palette: deep ocean surfaces with luminous blue and violet accents.
  static const darkPrimary = Color(0xFF80D4FA);
  static const darkOnPrimary = Color(0xFF082A3A);
  static const darkPrimaryContainer = Color(0xFF16445A);
  static const darkOnPrimaryContainer = Color(0xFFC8EDFF);
  static const darkSecondary = Color(0xFFB8AEFF);
  static const darkOnSecondary = Color(0xFF211B4B);
  static const darkSecondaryContainer = Color(0xFF393268);
  static const darkOnSecondaryContainer = Color(0xFFE5E0FF);
  static const darkSurface = Color(0xFF07141D);
  static const darkOnSurface = Color(0xFFEDF7FC);
  static const darkOnSurfaceVariant = Color(0xFFA8BBC5);
  static const darkOutline = Color(0xFF718894);
  static const darkOutlineVariant = Color(0xFF233A46);
  static const darkSurfaceDim = Color(0xFF050E14);
  static const darkSurfaceBright = Color(0xFF2B414D);
  static const darkSurfaceContainerLowest = Color(0xFF040B10);
  static const darkSurfaceContainerLow = Color(0xFF0B1B25);
  static const darkSurfaceContainer = Color(0xFF10232E);
  static const darkSurfaceContainerHigh = Color(0xFF172B36);
  static const darkSurfaceContainerHighest = Color(0xFF203640);
  static const darkInverseSurface = Color(0xFFE6F3F8);
  static const darkOnInverseSurface = Color(0xFF172A34);
  static const darkError = Color(0xFFFFB4AB);
  static const darkErrorContainer = Color(0xFF93000A);
  static const darkOnErrorContainer = Color(0xFFFFDAD6);
}

@immutable
final class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.success,
    required this.successContainer,
    required this.warning,
    required this.warningContainer,
  });

  static const light = AppSemanticColors(
    success: Color(0xFF4A89AD),
    successContainer: Color(0xFFE4F5FD),
    warning: Color(0xFF667A86),
    warningContainer: Color(0xFFEDF2F5),
  );

  static const dark = AppSemanticColors(
    success: Color(0xFF79D3F9),
    successContainer: Color(0xFF123E52),
    warning: Color(0xFFB9C7CE),
    warningContainer: Color(0xFF2A3D47),
  );

  final Color success;
  final Color successContainer;
  final Color warning;
  final Color warningContainer;

  @override
  AppSemanticColors copyWith({
    Color? success,
    Color? successContainer,
    Color? warning,
    Color? warningContainer,
  }) {
    return AppSemanticColors(
      success: success ?? this.success,
      successContainer: successContainer ?? this.successContainer,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
    );
  }

  @override
  AppSemanticColors lerp(
    covariant AppSemanticColors? other,
    double t,
  ) {
    if (other == null) return this;
    return AppSemanticColors(
      success: Color.lerp(success, other.success, t)!,
      successContainer: Color.lerp(
        successContainer,
        other.successContainer,
        t,
      )!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(
        warningContainer,
        other.warningContainer,
        t,
      )!,
    );
  }
}
