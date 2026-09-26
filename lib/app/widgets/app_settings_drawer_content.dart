import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/app/widgets/app_language_tile.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/core/widgets/app_text.dart';
import 'package:thaheen_task/features/settings/domain/entities/app_settings.dart';
import 'package:thaheen_task/features/settings/presentation/cubits/app_settings/app_settings_cubit.dart';

class AppSettingsDrawerContent extends StatelessWidget {
  const AppSettingsDrawerContent({required this.selectedLanguage, super.key});

  final AppLanguage selectedLanguage;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                colorScheme.primaryContainer,
                colorScheme.surfaceContainerLow,
              ],
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 52.r,
                height: 52.r,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.school_rounded,
                  size: 28.r,
                  color: colorScheme.onPrimary,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: AppText.primary(
                  context.l10n.appTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.w, 8.h, 16.w, 4.h),
          child: AppText.secondary(context.l10n.settings),
        ),
        SwitchListTile.adaptive(
          secondary: const Icon(Icons.dark_mode_outlined),
          title: AppText.primary(context.l10n.darkMode),
          value: context.isDarkMode,
          onChanged: (value) =>
              context.read<AppSettingsCubit>().setDarkMode(isDark: value),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.language_rounded),
          title: AppText.primary(context.l10n.language),
        ),
        AppLanguageTile(
          title: context.l10n.arabic,
          language: AppLanguage.arabic,
          selectedLanguage: selectedLanguage,
        ),
        AppLanguageTile(
          title: context.l10n.english,
          language: AppLanguage.english,
          selectedLanguage: selectedLanguage,
        ),
      ],
    );
  }
}
