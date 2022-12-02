import 'package:flutter/material.dart';

enum SelectedTheme { Light, Dark }

class ThemeModel with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeModel({ThemeMode mode = ThemeMode.system}) : _mode = mode;


  void toggleMode(SelectedTheme selectedTheme) {
    _mode = selectedTheme == SelectedTheme.Light ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
