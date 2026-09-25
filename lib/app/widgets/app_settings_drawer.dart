import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/core/widgets/app_text.dart';
import 'package:thaheen_task/features/settings/domain/entities/app_settings.dart';
import 'package:thaheen_task/features/settings/presentation/cubits/app_settings/app_settings_cubit.dart';
import 'package:thaheen_task/features/settings/presentation/cubits/app_settings/app_settings_state.dart';

class AppSettingsDrawer extends StatelessWidget {
  const AppSettingsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
          builder: (context, state) {
            final isDarkMode = switch (state.themeMode) {
              ThemeMode.dark => true,
              ThemeMode.light => false,
              ThemeMode.system =>
                Theme.of(context).brightness == Brightness.dark,
            };

            return ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.school_rounded,
                        size: 36.sp,
                        color: Theme.of(context).colorScheme.primary,
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
                  value: isDarkMode,
                  onChanged: (value) => context
                      .read<AppSettingsCubit>()
                      .setDarkMode(isDark: value),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.language_rounded),
                  title: AppText.primary(context.l10n.language),
                ),
                _LanguageTile(
                  title: context.l10n.arabic,
                  language: AppLanguage.arabic,
                  selectedLanguage: state.language,
                ),
                _LanguageTile(
                  title: context.l10n.english,
                  language: AppLanguage.english,
                  selectedLanguage: state.language,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.title,
    required this.language,
    required this.selectedLanguage,
  });

  final String title;
  final AppLanguage language;
  final AppLanguage selectedLanguage;

  @override
  Widget build(BuildContext context) {
    final isSelected = language == selectedLanguage;

    return ListTile(
      contentPadding: EdgeInsetsDirectional.only(start: 56.w, end: 16.w),
      title: AppText.primary(title),
      trailing: isSelected
          ? Icon(Icons.check_rounded,
              color: Theme.of(context).colorScheme.primary)
          : null,
      selected: isSelected,
      onTap: () => context.read<AppSettingsCubit>().setLanguage(language),
    );
  }
}
