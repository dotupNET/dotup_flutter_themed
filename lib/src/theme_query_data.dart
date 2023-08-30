import 'package:flutter/material.dart';

MaterialColor _toMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: Color.fromRGBO(color.red, color.green, color.blue, .1),
    100: Color.fromRGBO(color.red, color.green, color.blue, .2),
    200: Color.fromRGBO(color.red, color.green, color.blue, .3),
    300: Color.fromRGBO(color.red, color.green, color.blue, .4),
    400: Color.fromRGBO(color.red, color.green, color.blue, .5),
    500: Color.fromRGBO(color.red, color.green, color.blue, .6),
    600: Color.fromRGBO(color.red, color.green, color.blue, .7),
    700: Color.fromRGBO(color.red, color.green, color.blue, .8),
    800: Color.fromRGBO(color.red, color.green, color.blue, .9),
    900: Color.fromRGBO(color.red, color.green, color.blue, 1),
  });
}

class ThemeQueryData extends ChangeNotifier {
  ThemeQueryData({
    required ThemeData darkTheme,
    required ThemeData lightTheme,
    required ThemeMode themeMode,
  })  : _darkTheme = darkTheme,
        _lightTheme = lightTheme,
        _themeMode = themeMode;

  factory ThemeQueryData.standard() {
    return ThemeQueryData(
      darkTheme: ThemeData.dark(),
      lightTheme: ThemeData.light(),
      themeMode: ThemeMode.dark,
    );
  }

  ThemeData _darkTheme;
  ThemeData get darkTheme => _darkTheme;

  ThemeData _lightTheme;
  ThemeData get lightTheme => _lightTheme;

  ThemeData get themeData => _themeMode == ThemeMode.dark ? _darkTheme : _lightTheme;

  ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  void switchThemeMode(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }

  void toggleThemeMode() {
    switchThemeMode(themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }

  void changePrimarySwatch(Color color) {
    final newDarkTheme = _darkTheme.copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: _toMaterialColor(color),
      ),
    );
    final newLightTheme = _lightTheme.copyWith(primaryColor: color);
    _darkTheme = newDarkTheme;
    _lightTheme = newLightTheme;
    notifyListeners();
  }

  void changePrimaryColor(Color? color) {
    final newDarkTheme = _darkTheme.copyWith(primaryColor: color);
    final newLightTheme = _lightTheme.copyWith(primaryColor: color);
    _darkTheme = newDarkTheme;
    _lightTheme = newLightTheme;
    notifyListeners();
  }

  void changeSecondaryColor(Color? color) {
    final newDarkTheme = _darkTheme.copyWith(colorScheme: _darkTheme.colorScheme.copyWith(secondary: color));
    final newLightTheme = _lightTheme.copyWith(colorScheme: _lightTheme.colorScheme.copyWith(secondary: color));
    _darkTheme = newDarkTheme;
    _lightTheme = newLightTheme;
    notifyListeners();
  }
  // ThemeMode get themeMode => null;
}
