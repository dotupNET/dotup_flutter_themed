import 'package:flutter/material.dart';

import 'theme_query.dart';
import 'theme_query_data.dart';

class ThemeBuilder<T extends ThemeQueryData> extends StatelessWidget {
  const ThemeBuilder({
    Key? key,
    required this.builder,
    this.data,
  }) : super(key: key);

  final Widget Function(ThemeData? dark, ThemeData? light, ThemeMode themeMode) builder;
  final T? data;

  @override
  Widget build(BuildContext context) {
    final current = data ?? ThemeQuery.of<T>(context);
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: current,
      builder: (context, value, child) {
        return ThemeQuery<T>(data: current, child: builder(current.dark, current.light, value));
      },
    );
  }
}
