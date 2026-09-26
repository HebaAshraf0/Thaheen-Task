import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thaheen_task/app/widgets/app_settings_drawer_content.dart';
import 'package:thaheen_task/features/settings/presentation/cubits/app_settings/app_settings_cubit.dart';
import 'package:thaheen_task/features/settings/presentation/cubits/app_settings/app_settings_state.dart';

class AppSettingsDrawer extends StatelessWidget {
  const AppSettingsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
          builder: (context, state) =>
              AppSettingsDrawerContent(selectedLanguage: state.language),
        ),
      ),
    );
  }
}
