import 'package:dotup_flutter_themed/dotup_flutter_themed.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ThemedApp());
}

class ThemedApp extends StatelessWidget {
  const ThemedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      data: ThemeQueryData(
        dark: ThemeData.dark(),
        light: ThemeData.light(),
      ),
      builder: (dark, light, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: dark,
          theme: light,
          themeMode: themeMode,
          home: const ThemedHome(),
        );
      },
    );
  }
}

class ThemedHome extends StatelessWidget {
  const ThemedHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final x = ThemeQuery.of<ThemeQueryData>(context);
                x.toggleThemeMode();
              },
              icon: const Icon(Icons.dark_mode)),
        ],
      ),
      body: Center(
        child: Column(
          children: const [
            Text('Nice!'),
            Text('https://flutter-apps.ml'),
          ],
        ),
      ),
    );
  }
}
