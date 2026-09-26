import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/core/widgets/app_text.dart';
import 'package:thaheen_task/features/settings/domain/entities/app_settings.dart';
import 'package:thaheen_task/features/settings/presentation/cubits/app_settings/app_settings_cubit.dart';

class AppLanguageTile extends StatelessWidget {
  const AppLanguageTile({
    required this.title,
    required this.language,
    required this.selectedLanguage,
    super.key,
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
          ? Icon(
              Icons.check_rounded,
              color: Theme.of(context).colorScheme.primary,
            )
          : null,
      selected: isSelected,
      onTap: () => context.read<AppSettingsCubit>().setLanguage(language),
    );
  }
}
