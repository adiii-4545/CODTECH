import 'package:flutter/material.dart';
import 'package:media_player_app/themes/dark_mode.dart';
import 'package:media_player_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = LightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == DarkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;

    notifyListeners();

    // ignore: unused_element
    void toggleTheme() {
      if (_themeData == LightMode) {
        themeData = DarkMode;
      } else {
        themeData = LightMode;
      }
    }
  }

  void toggleTheme() {}
}
