part of 'settings_cubit.dart';
@JsonSerializable()
final class SettingsState {
  final String locale;
  final ThemeMode themeMode;
  const SettingsState({required this.locale, required this.themeMode});
  SettingsState copyWith({String? locale, ThemeMode? themeMode}) {
    return SettingsState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode
    );
  }
  factory SettingsState.fromJson(Map<String, dynamic> json) => _$SettingsStateFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsStateToJson(this);
}