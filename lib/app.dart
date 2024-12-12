import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/l10n/app_localizations_setup.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/features/user/presentation/cubits/settings_cubit/settings_cubit.dart';

class Cirama extends StatelessWidget {
  final AppTheme theme;
  final AppRouter appRouter;
  final AppLocalizationsSetup appLocalizationsSetup;

  const Cirama({
    super.key,
    required this.appRouter,
    required this.theme,
    required this.appLocalizationsSetup,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (BuildContext context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: Locale(state.locale),
            themeMode: state.themeMode,
            theme: theme.lightTheme,
            darkTheme: theme.dartTheme,
            routerConfig: appRouter.router,
            supportedLocales: appLocalizationsSetup.supportedLocales,
            localizationsDelegates: appLocalizationsSetup.localizationsDelegates,
            localeResolutionCallback: appLocalizationsSetup.localeResolutionCallback,
          );
        },
      ),
    );
  }
}