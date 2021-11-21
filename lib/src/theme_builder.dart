import 'package:flutter/material.dart';

import 'theme_query.dart';
import 'theme_query_data.dart';

class ThemeBuilder<T extends ThemeQueryData> extends StatelessWidget {
  const ThemeBuilder({
    Key? key,
    required this.builder,
    this.data,
    this.onCreate,
  }) : super(key: key);

  final Widget Function(ThemeQueryData data) builder;
  // final Widget Function(ThemeData? dark, ThemeData? light, ThemeMode themeMode) builder;
  final T? data;
  final ValueGetter<T>? onCreate;

  @override
  Widget build(BuildContext context) {
    final current = data ?? ThemeQuery.maybeOf<T>(context) ?? onCreate!();
    return AnimatedBuilder(
      animation: current,
      builder: (context, child) {
        return ThemeQuery<T>(data: current, child: builder(current));
        // return ThemeQuery<T>(data: current, child: builder(current.darkTheme, current.lightTheme, value));
      },
    );
  }
}
