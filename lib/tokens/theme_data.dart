import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';

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
              : AppColor.dr_primary_light,
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