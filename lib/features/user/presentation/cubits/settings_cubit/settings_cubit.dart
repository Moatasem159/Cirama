import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/utils/app_constant.dart';
import 'package:restart_app/restart_app.dart';

part 'settings_cubit.g.dart';
part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState(locale: "en", themeMode: ThemeMode.system));

  toArabic() {
    if (state.locale !="ar") {
      _changeLocale("ar");
    }
  }

  toEnglish() {
    if (state.locale != "en") {
      _changeLocale("en");
    }
  }

  toSystemTheme() {
    if (state.themeMode != ThemeMode.system) {
      _changeTheme(ThemeMode.system);
    }
  }

  toLightTheme() {
    if (state.themeMode != ThemeMode.light) {
      _changeTheme(ThemeMode.light);
    }
  }

  toDarkTheme() {
    if (state.themeMode != ThemeMode.dark) {
      _changeTheme(ThemeMode.dark);
    }
  }
  getLocalName(BuildContext context) => state.locale == "en" ? _englishLocale(context) : _arabicLocale(context);
  _arabicLocale(BuildContext context) =>context.locale.arabic;
  _englishLocale(BuildContext context) =>context.locale.english;
  isArabic() => state.locale == "ar";
  isEnglish() => state.locale == "en";

  isSystemTheme() => state.themeMode == ThemeMode.system;

  getThemeModeName(BuildContext context) {
    switch (state.themeMode) {
      case ThemeMode.system:
        return _systemTheme(context);
      case ThemeMode.light:
        return _lightTheme(context);
      case ThemeMode.dark:
        return _darkTheme(context);
    }
  }

  _systemTheme(BuildContext context) => context.locale.systemDefault;

  _darkTheme(BuildContext context) => context.locale.dark;

  _lightTheme(BuildContext context) => context.locale.light;

  isDarkTheme() => state.themeMode == ThemeMode.dark;

  isLightTheme() => state.themeMode == ThemeMode.light;

  _changeLocale(String locale) {
    AppConstants.appLanguage = locale;
    emit(state.copyWith(locale:locale));
    Restart.restartApp();
  }

  _changeTheme(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json){
    AppConstants.appLanguage = json['locale'];
    return SettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) => state.toJson();
}