import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/app/di/injection.dart';
import 'package:thaheen_task/app/router/app_router.dart';
import 'package:thaheen_task/app/theme/app_screen_config.dart';
import 'package:thaheen_task/app/theme/app_theme.dart';
import 'package:thaheen_task/features/settings/presentation/cubits/app_settings/app_settings_cubit.dart';
import 'package:thaheen_task/features/settings/presentation/cubits/app_settings/app_settings_state.dart';
import 'package:thaheen_task/l10n/app_localizations.dart';

class ThaheenApp extends StatelessWidget {
  const ThaheenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AppSettingsCubit>()..load(),
      child: ScreenUtilInit(
        designSize: AppScreenConfig.designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) =>
            BlocBuilder<AppSettingsCubit, AppSettingsState>(
          builder: (context, settings) => MaterialApp.router(
            onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: settings.themeMode,
            locale: settings.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routerConfig: AppRouter.router,
          ),
        ),
      ),
    );
  }
}
