import 'package:flutter/material.dart';

class SettingsViewmodel extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }
}
