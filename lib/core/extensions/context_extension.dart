import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';
extension SizeExtension on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
}
extension ThemesExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isDark=>theme.brightness==Brightness.dark;
  Color get scaffoldBackgroundColor=>theme.scaffoldBackgroundColor;
  Color get secondaryBackgroundColor=>theme.colorScheme.secondary;
  Color get primaryColor=>theme.primaryColor;
}
extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle get displayLarge => textTheme.displayLarge!;
  TextStyle get displayMedium => textTheme.displayMedium!;
  TextStyle get displaySmall => textTheme.displaySmall!;
  TextStyle get headlineLarge => textTheme.headlineLarge!;
  TextStyle get headlineMedium => textTheme.headlineMedium!;
  TextStyle get headlineSmall => textTheme.headlineSmall!;
  TextStyle get titleLarge => textTheme.titleLarge!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleSmall => textTheme.titleSmall!;
  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodySmall => textTheme.bodySmall!;
  TextStyle get labelLarge => textTheme.labelLarge!;
  TextStyle get labelMedium => textTheme.labelMedium!;
  TextStyle get labelSmall => textTheme.labelSmall!;
}
extension LocalizationExtentions on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
  bool get isEnglish => AppLocalizations.of(this)!.localeName=='en';
}
extension FunctionsExtension on BuildContext {
  showSnackBar(SnackBar snackBar)=>ScaffoldMessenger.of(this).showSnackBar(snackBar);
}

extension SkeletonizerExtension on BuildContext {
  bool get enabled => Skeletonizer.of(this).enabled;
}