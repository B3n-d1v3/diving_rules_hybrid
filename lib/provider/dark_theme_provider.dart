
import 'package:flutter/material.dart';
import '../models/dark_theme_preferences.dart';
// import 'package:flutter/cupertino.dart';

// Model used from https://www.youtube.com/watch?v=JkZnP1H0E6E

class DarkThemeProvider with ChangeNotifier{
  DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  bool _darkTheme = false ;
  bool get darkTheme => _darkTheme;

  set darkTheme (bool value){
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}