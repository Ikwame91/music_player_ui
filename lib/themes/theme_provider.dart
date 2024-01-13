import 'package:flutter/material.dart';
import 'package:music_player_ui/themes/dark_mode.dart';
import 'package:music_player_ui/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //initial theme is light
  ThemeData _themeData = lightMode;

  //getter to access theme across app
  ThemeData get themeData => _themeData;

  //is darkmode
  bool get isDarkMode => _themeData == darkMode;

  //set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    //update Ui
    notifyListeners();
  }

  //Toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
  }
}
