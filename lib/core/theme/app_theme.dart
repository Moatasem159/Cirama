import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/core/extensions/context_extension.dart';

part 'app_colors.dart';

class AppTheme {
  const AppTheme();

  ThemeData get lightTheme => ThemeData(
        fontFamily: "poppins",
        fontFamilyFallback: const ["poppins", "cairo"],
        brightness: Brightness.light,
        colorScheme: ColorScheme.light().copyWith(
          secondary: AppColor.lightSecondaryBackground,
        ),
        primaryColor: AppColor.primaryColor,
        scaffoldBackgroundColor: AppColor.lightScaffoldBackground,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppColor.primaryColor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.zero,
            textStyle: _buttonTextStyle,
            fixedSize: const Size(200, 40),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: AppColor.primaryColor,
          ),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColor.primaryColor,
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.horizontal,
          elevation: 10,
        ),
        listTileTheme: ListTileThemeData(
          dense: true,
          horizontalTitleGap: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
        checkboxTheme: CheckboxThemeData(
          shape: CircleBorder(),
          fillColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return AppColor.primaryColor;
              }
              return null;
            },
          ),
        ),
        dialogTheme: DialogTheme(
          elevation: 5,
          insetPadding: const EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      );

  ThemeData get dartTheme => ThemeData(
        fontFamily: "poppins",
        fontFamilyFallback: const ["poppins", "cairo"],
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark().copyWith(
          secondary: AppColor.darkSecondaryBackground,
        ),
        primaryColor: AppColor.primaryColor,
        scaffoldBackgroundColor: AppColor.darkScaffoldBackground,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppColor.primaryColor,
            foregroundColor: Colors.black,
            padding: EdgeInsets.zero,
            textStyle: _buttonTextStyle,
            fixedSize: const Size(200, 40),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: AppColor.primaryColor,
          ),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColor.primaryColor,
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.horizontal,
          elevation: 10,
        ),
        listTileTheme: ListTileThemeData(
          dense: true,
          horizontalTitleGap: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
        checkboxTheme: CheckboxThemeData(
          shape: CircleBorder(),
          fillColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return AppColor.primaryColor;
              }
              return null;
            },
          ),
        ),
        dialogTheme: DialogTheme(
          elevation: 5,
          insetPadding: const EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      );

  ///Function to change system navigation bar and status bar color
  ///in light and dark themes.
  static SystemUiOverlayStyle systemUiOverlayStyle(BuildContext context) =>
      context.theme.brightness == Brightness.light
          ? _whiteSystemUiOverlayStyle
          : _darkSystemUiOverlayStyle;
  static final SystemUiOverlayStyle _whiteSystemUiOverlayStyle =
      SystemUiOverlayStyle.light.copyWith(
    statusBarColor: AppColor.lightScaffoldBackground,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColor.lightScaffoldBackground,
  );
  static final SystemUiOverlayStyle _darkSystemUiOverlayStyle = SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: AppColor.darkScaffoldBackground,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColor.darkScaffoldBackground,
  );

  final TextStyle _buttonTextStyle = const TextStyle(
      fontFamily: "poppins", fontFamilyFallback: ["poppins", "cairo"], fontSize: 16);
}