import 'package:flutter/cupertino.dart';

//import 'package:flutter/material.dart';

import 'dr_colors.dart';
// Not used in the new material 3 setup (issue/Branch #26)

// TODO: Later / Investigate Material you support
// https://fivedottwelve.com/blog/themes-in-flutter-and-how-to-use-material-you-dynamic-colors/

// Material Design Setup
/*const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColor.myPrimaryColorLight,
  onPrimary: AppColor.myOnPrimaryColorLight,
  primaryContainer: AppColor.myPrimaryContainerColorLight,
  onPrimaryContainer: AppColor.myOnPrimaryContainerColorLight,
  secondary: AppColor.mySecondaryColorLight,
  onSecondary: AppColor.myOnSecondaryColorLight,
  secondaryContainer: AppColor.mySecondaryContainerColorLight,
  onSecondaryContainer: AppColor.myOnSecondaryContainerColorLight,
  tertiary: AppColor.myTertiaryColorLight,
  onTertiary: AppColor.myOnTertiaryColorLight,
  tertiaryContainer: AppColor.myTertiaryContainerColorLight,
  onTertiaryContainer: AppColor.myOnTertiaryContainerColorLight,
  error: AppColor.myErrorColorLight,
  errorContainer: AppColor.myErrorContainerColorLight,
  onError: AppColor.myOnErrorColorLight,
  onErrorContainer: AppColor.myOnErrorContainerColorLight,
  background: AppColor.myBackgroundColorLight,
  onBackground: AppColor.myOnBackgroundColorLight,
  surface: AppColor.mySurfaceColorLight,
  onSurface: AppColor.myOnSurfaceColorLight,
  // surfaceVariant: Color(0xFFDFE3EB),
  // onSurfaceVariant: Color(0xFF42474E),
  // outline: Color(0xFF73777F),
  // onInverseSurface: Color(0xFFD6F6FF),
  // inverseSurface: Color(0xFF00363F),
  // inversePrimary: Color(0xFF9CCAFF),
  // shadow: Color(0xFF000000),
  // surfaceTint: Color(0xFF0062A0),
  // outlineVariant: Color(0xFFC2C7CF),
  // scrim: Color(0xFF000000),
);*/

/*const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColor.myPrimaryColorDark,
  onPrimary: AppColor.myOnPrimaryColorDark,
  primaryContainer: AppColor.myPrimaryContainerColorDark,
  onPrimaryContainer: AppColor.myOnPrimaryContainerColorDark,
  secondary: AppColor.mySecondaryColorDark,
  onSecondary: AppColor.myOnSecondaryColorDark,
  secondaryContainer: AppColor.mySecondaryContainerColorDark,
  onSecondaryContainer: AppColor.myOnSecondaryContainerColorDark,
  tertiary: AppColor.myTertiaryColorDark,
  onTertiary: AppColor.myOnTertiaryColorDark,
  tertiaryContainer: AppColor.myTertiaryContainerColorDark,
  onTertiaryContainer: AppColor.myOnTertiaryContainerColorDark,
  error: AppColor.myErrorColorDark,
  errorContainer: AppColor.myErrorContainerColorDark,
  onError: AppColor.myOnErrorColorDark,
  onErrorContainer: AppColor.myOnErrorContainerColorDark,
  background: AppColor.myBackgroundColorDark,
  onBackground: AppColor.myOnBackgroundColorDark,
  surface: AppColor.mySurfaceColorDark,
  onSurface: AppColor.myOnSurfaceColorDark,
  // surfaceVariant: Color(0xFF42474E),
  // onSurfaceVariant: Color(0xFFC2C7CF),
  // outline: Color(0xFF8C9199),
  // onInverseSurface: Color(0xFF001F25),
  // inverseSurface: Color(0xFFA6EEFF),
  // inversePrimary: Color(0xFF0062A0),
  // shadow: Color(0xFF000000),
  // surfaceTint: Color(0xFF9CCAFF),
  // outlineVariant: Color(0xFF42474E),
  // scrim: Color(0xFF000000),
);*/

// Cupertino theme setup
// Model used from https://www.youtube.com/watch?v=JkZnP1H0E6E
class Styles {
  static CupertinoThemeData themeData(bool isDarkTheme) {
    return CupertinoThemeData(
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      primaryColor: isDarkTheme
          ? AppColor.myPrimaryColorDark
          : AppColor.myPrimaryColorLight,
      // textTheme: isDarkTheme ? AppColor.myOnBackgroundColorDark : AppColor.myOnBackgroundColorLight,

      //textTheme: const TextTheme(
      //displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //displayMedium:,
      //displaySmall:,
      //headlineLarge:,
      //headlineMedium:,
      //headlineSmall:,
      //titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, height: 2),
      //titleMedium:,
      //titleSmall:,
      //bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind')
      //bodyLarge:,
      //bodyMedium:,
      //bodySmall:,
      //labelLarge:,
      //labelMedium:,
      //labelSmall:,
      //),
    );
  }
}
