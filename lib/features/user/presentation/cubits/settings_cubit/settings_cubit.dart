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

  void toArabic() {
    if (state.locale !="ar") {
      _changeLocale("ar");
    }
  }

  void toEnglish() {
    if (state.locale != "en") {
      _changeLocale("en");
    }
  }

  void toSystemTheme() {
    if (state.themeMode != ThemeMode.system) {
      _changeTheme(ThemeMode.system);
    }
  }

  void toLightTheme() {
    if (state.themeMode != ThemeMode.light) {
      _changeTheme(ThemeMode.light);
    }
  }

  void toDarkTheme() {
    if (state.themeMode != ThemeMode.dark) {
      _changeTheme(ThemeMode.dark);
    }
  }
  dynamic getLocalName(BuildContext context) => state.locale == "en" ? _englishLocale(context) : _arabicLocale(context);
  String _arabicLocale(BuildContext context) =>context.locale.arabic;
  String _englishLocale(BuildContext context) =>context.locale.english;
  bool isArabic() => state.locale == "ar";
  bool isEnglish() => state.locale == "en";

  bool isSystemTheme() => state.themeMode == ThemeMode.system;

  dynamic getThemeModeName(BuildContext context) {
    switch (state.themeMode) {
      case ThemeMode.system:
        return _systemTheme(context);
      case ThemeMode.light:
        return _lightTheme(context);
      case ThemeMode.dark:
        return _darkTheme(context);
    }
  }

  String _systemTheme(BuildContext context) => context.locale.systemDefault;

  String _darkTheme(BuildContext context) => context.locale.dark;

  String _lightTheme(BuildContext context) => context.locale.light;

  bool isDarkTheme() => state.themeMode == ThemeMode.dark;

  bool isLightTheme() => state.themeMode == ThemeMode.light;

  void _changeLocale(String locale) {
    AppConstants.appLanguage = locale;
    emit(state.copyWith(locale:locale));
    Restart.restartApp();
  }

  void _changeTheme(ThemeMode themeMode) {
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