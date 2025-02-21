import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/core/l10n/gen_l10n/app_localizations.dart';
class AppLocalizationsSetup {
  const AppLocalizationsSetup();
   Iterable<Locale> get supportedLocales => [
    Locale('en'),
    Locale('ar'),
  ];
  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates =>[
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate
  ];
   Locale? localeResolutionCallback(Locale? locale, Iterable<Locale>? supportedLocales) {
    for (Locale supportedLocale in supportedLocales!) {
      if (supportedLocale.languageCode == locale!.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}