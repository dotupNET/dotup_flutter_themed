import 'package:flutter/material.dart';

class ThemeQueryData extends ValueNotifier<ThemeMode> {
  ThemeQueryData({
    required this.dark,
    required this.light,
    ThemeMode themeMode = ThemeMode.dark,
  })  : _themeMode = themeMode,
        super(themeMode);

  final ThemeData dark;

  final ThemeData light;

  ThemeData get themeData => _themeMode == ThemeMode.dark ? dark : light;

  ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  void switchThemeMode(ThemeMode value) {
    _themeMode = value;
    super.value = value;
  }

  void toggleThemeMode() {
    switchThemeMode(themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }
  // ThemeMode get themeMode => null;
}
