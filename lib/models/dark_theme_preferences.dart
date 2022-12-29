import 'package:shared_preferences/shared_preferences.dart';

// Model used from https://www.youtube.com/watch?v=JkZnP1H0E6E

class DarkThemePreferences {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme (bool value ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }
  Future <bool> getTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS, ) ?? false;
  }
}