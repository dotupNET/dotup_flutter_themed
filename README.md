# dotup_flutter_themed

Dart package that generates a header for each dart file.

## Easy usage

```dart
// Powered by https://dotup.de
// Copyright (c) 2021, dotup IT solutions - Peter Ullrich


class ThemedApp extends StatelessWidget {
  const ThemedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      // Provide your theme data
      data: ThemeQueryData(
        dark: ThemeData.dark(),
        light: ThemeData.light(),
      ),
      builder: (dark, light, themeMode) {
        // Get your theme from builder
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
                // Toggle theme mode
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
```
## Advanced usage

> Extend your themes with custom theme data

```dart
// Powered by https://dotup.de
// Copyright (c) 2021, dotup IT solutions - Peter Ullrich


// Define what you want additionally in dark and light theme
class MyThemeExtensions {
  late Color brandColor;

  MyThemeExtensions({
    Color? brandColor,
  }) : brandColor = brandColor ?? Colors.green.shade400;
}

// Define your own theme query data for easy access
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
      // Provide your theme data
      data: MyTheme(
        dark: ThemeData.dark(),
        light: ThemeData.light(),
      ),
      builder: (dark, light, themeMode) {
        // Get your theme from builder
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
                // Toggle theme mode
                final x = MyTheme.of(context);
                x.toggleThemeMode();
              },
              icon: Icon(
                Icons.language,
                // Get your custom value for the current theme mode
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

```

## Install
`flutter pub add dotup_flutter_themed`

## Links

> ### dotup_flutter_themed on [pub.dev](https://pub.dev/packages/dotup_flutter_themed)
>
> ### Other widgets on [pub.dev](https://pub.dev/packages?q=dotup)
> 
> ### Other open source flutter projects on [Github](https://github.com/search?q=dotup_flutter)
> 
> ### Other open source dart projects on [Github](https://github.com/search?q=dotup_dart)

# Flutter simulator | DFFP3
> Go to [https://flutter-apps.ml](https://flutter-apps.ml) and check out the awesome flutter simulator !

![Flutter simulator](https://flutter-apps.ml/wp-content/uploads/2021/10/Bildschirmfoto-2021-10-31-um-11.34.42-2048x1335.png)

> ## [dotup IT solutions](https://dotup.de)