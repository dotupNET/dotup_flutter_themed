import 'package:dotup_flutter_themed/dotup_flutter_themed.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ThemedApp());
}

class MyThemeExtensions {
  late Color brandColor;

  MyThemeExtensions({
    Color? brandColor,
  }) : brandColor = brandColor ?? Colors.green.shade400;
}

class MyTheme extends CustomThemeQueryData<MyThemeExtensions> {
  MyTheme({
    required ThemeData dark,
    required ThemeData light,
    ThemeMode themeMode = ThemeMode.dark,
  }) : super(
          dark: dark,
          light: light,
          themeMode: themeMode,
          darkCustom: MyThemeExtensions(brandColor: Colors.blue.shade400),
          lightCustom: MyThemeExtensions(brandColor: Colors.white70),
        );

  static MyTheme of(BuildContext context) {
    return ThemeQuery.of<MyTheme>(context);
  }
}

class ThemedApp extends StatelessWidget {
  const ThemedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder<MyTheme>(
      data: MyTheme(
        dark: ThemeData.dark(),
        light: ThemeData.light(),
      ),
      builder: (dark, light, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: dark, // ThemeQuery.of(context).dark,
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
                final x = MyTheme.of(context);
                x.toggleThemeMode();
              },
              icon: Icon(
                Icons.language,
                color: MyTheme.of(context).custom.brandColor,
              )),
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
