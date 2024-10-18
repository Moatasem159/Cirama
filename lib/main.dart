import 'package:flutter/material.dart';
import 'package:movies_app/app.dart';
import 'package:movies_app/core/di/dependency_injection.dart';
import 'package:movies_app/core/l10n/app_localizations_setup.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/theme/app_theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpGetIt();
  runApp(
    Mo3Tv(
      theme: const AppTheme(),
      appRouter: AppRouter(),
      appLocalizationsSetup: const AppLocalizationsSetup(),
    ),
  );
}