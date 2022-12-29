import 'package:flutter/cupertino.dart';

import 'colors.dart';

// Model used from https://www.youtube.com/watch?v=JkZnP1H0E6E

class Styles {
  static CupertinoThemeData themeData(bool isDarkTheme) {
    return CupertinoThemeData(
          brightness: isDarkTheme
              ? Brightness.dark
              : Brightness.light,
          primaryColor: isDarkTheme
              ? AppColor.dr_primary_dark
              : AppColor.dr_primary_light
    );

  }
}