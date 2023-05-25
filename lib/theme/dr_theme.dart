import 'package:flutter/material.dart';

import 'dr_color_scheme.dart';
import 'dr_colors.dart';
import 'dr_typography.dart';

const double _disabledOpacity = 0.38;
const double _switchTrackOpacity = 0.54;

class DrTheme {
  DrTheme._();

  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: true,
    splashFactory: NoSplash.splashFactory,
    typography: drTypography,
    scaffoldBackgroundColor: AppColor.myBackgroundColorLight,
    appBarTheme:
        const AppBarTheme(backgroundColor: AppColor.myBackgroundColorLight),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColor.myBackgroundColorLight),
    checkboxTheme: const CheckboxThemeData(fillColor: LightControlFillColor()),
    radioTheme: const RadioThemeData(fillColor: LightControlFillColor()),
    switchTheme: SwitchThemeData(
        thumbColor: const LightControlFillColor(),
        trackColor: MaterialStateColor.resolveWith((states) {
          return const LightControlFillColor()
              .resolve(states)
              .withOpacity(_switchTrackOpacity);
        })),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: true,
    splashFactory: NoSplash.splashFactory,
    typography: drTypography,
    scaffoldBackgroundColor: AppColor.myBackgroundColorDark,
    appBarTheme:
        const AppBarTheme(backgroundColor: AppColor.myBackgroundColorDark),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColor.myBackgroundColorDark),
    checkboxTheme: const CheckboxThemeData(
        fillColor: DarkControlFillColor(),
        checkColor: MaterialStatePropertyAll(AppColor.myBackgroundColorDark)),
    radioTheme: const RadioThemeData(fillColor: DarkControlFillColor()),
    switchTheme: SwitchThemeData(
        thumbColor: const DarkControlFillColor(),
        trackColor: MaterialStateColor.resolveWith((states) {
          return const DarkControlFillColor()
              .resolve(states)
              .withOpacity(_switchTrackOpacity);
        })),
  );
}

/// Light theme fill color used by selection controls: Checkboxes, Radio Buttons
class LightControlFillColor extends MaterialStateColor {
  const LightControlFillColor() : super(_defaultColor);

  static const int _defaultColor = 0xff000000;

  @override
  Color resolve(Set states) {
    if (states.contains(MaterialState.disabled)) {
      return lightColorScheme.onSurface.withOpacity(_disabledOpacity);
    } else if (states.contains(MaterialState.selected)) {
      return lightColorScheme.primary;
    }
    return AppColor.drColorDeselectedLight;
  }
}

/// Dark theme fill color used by selection controls: Checkboxes, Radio Buttons
class DarkControlFillColor extends MaterialStateColor {
  const DarkControlFillColor() : super(_defaultColor);

  static const int _defaultColor = 0xffffffff;

  @override
  Color resolve(Set states) {
    if (states.contains(MaterialState.disabled)) {
      return darkColorScheme.onSurface.withOpacity(_disabledOpacity);
    } else if (states.contains(MaterialState.selected)) {
      return darkColorScheme.primary;
    }
    return AppColor.drColorDeselectedDark;
  }
}
