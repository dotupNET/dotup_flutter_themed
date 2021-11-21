import 'package:flutter/material.dart';

import 'theme_query_data.dart';

class CustomThemeQueryData<T> extends ThemeQueryData {
  CustomThemeQueryData({
    required ThemeData dark,
    required ThemeData light,
    required this.darkCustom,
    required this.lightCustom,
    ThemeMode themeMode = ThemeMode.dark,
  }) : super(darkTheme: dark, lightTheme: light, themeMode: themeMode);

  final T darkCustom;
  final T lightCustom;

  T get custom => themeMode == ThemeMode.dark ? darkCustom : lightCustom;
}
