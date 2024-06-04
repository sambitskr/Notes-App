import 'package:flutter/material.dart';
import 'package:piconote/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late SharedPreferences storage;

  //initially theme is light
  ThemeData _themeData = lightMode;

//getter method to access the theme from other parts of the code
  ThemeData get themedata => _themeData;

  // getter method to see if we are in the dark mode or not.
  bool get isDarkMode => _themeData == darkMode;

// setter method to set the new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

// we will use this to toggle in a switch later on..
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
