import 'package:flutter/material.dart';
import 'package:thaheen_task/l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
