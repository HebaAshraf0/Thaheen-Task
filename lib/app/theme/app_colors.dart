import 'package:flutter/material.dart';

abstract final class AppColors {
  // Thaheen light palette from thaheensa.com.
  static const lightPrimary = Color(0xFF42766C);
  static const lightOnPrimary = Color(0xFFFFFFFF);
  static const lightPrimaryContainer = Color(0xFFE6EAE9);
  static const lightOnPrimaryContainer = Color(0xFF1D3430);
  static const lightSecondary = Color(0xFFF0B00F);
  static const lightOnSecondary = Color(0xFF4D3805);
  static const lightSecondaryContainer = Color(0xFFF9E2C3);
  static const lightOnSecondaryContainer = Color(0xFF694D07);
  static const lightSurface = Color(0xFFFAFAFA);
  static const lightOnSurface = Color(0xFF2E2E2E);
  static const lightOnSurfaceVariant = Color(0xFF5C5C5C);
  static const lightOutline = Color(0xFF8A8A8A);
  static const lightOutlineVariant = Color(0xFFE6E6E6);
  static const lightError = Color(0xFFC13D2F);
  static const lightErrorContainer = Color(0xFFF4E6E6);
  static const lightOnErrorContainer = Color(0xFF561B15);

  // Dark surfaces use the website's charcoal and deep-green scale.
  static const darkPrimary = Color(0xFFA8B8B5);
  static const darkOnPrimary = Color(0xFF1D3430);
  static const darkPrimaryContainer = Color(0xFF1B372D);
  static const darkOnPrimaryContainer = Color(0xFFE6EAE9);
  static const darkSecondary = Color(0xFFF3C472);
  static const darkOnSecondary = Color(0xFF4D3805);
  static const darkSecondaryContainer = Color(0xFF65521B);
  static const darkOnSecondaryContainer = Color(0xFFFDF8F2);
  static const darkSurface = Color(0xFF171717);
  static const darkOnSurface = Color(0xFFF7F7F7);
  static const darkOnSurfaceVariant = Color(0xFFC9C9C9);
  static const darkOutline = Color(0xFF999999);
  static const darkOutlineVariant = Color(0xFF424242);
  static const darkError = Color(0xFFFFB8B8);
  static const darkErrorContainer = Color(0xFF7D2B2B);
  static const darkOnErrorContainer = Color(0xFFFFD1D1);
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
    success: Color(0xFF297F57),
    successContainer: Color(0xFFE6EFEA),
    warning: Color(0xFF73592B),
    warningContainer: Color(0xFFFFF4E5),
  );

  static const dark = AppSemanticColors(
    success: Color(0xFFE6EFEA),
    successContainer: Color(0xFF12260D),
    warning: Color(0xFFFCE7BA),
    warningContainer: Color(0xFF753F00),
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
