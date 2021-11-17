import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Establishes a subtree in which Theme queries resolve to the given data.
///
/// For example, to learn the size of the current Theme (e.g., the window
/// containing your app), you can read the [ThemeQueryData.size] property from
/// the [ThemeQueryData] returned by [ThemeQuery.of]:
/// `ThemeQuery.of(context).size`.
///
/// Querying the current Theme using [ThemeQuery.of] will cause your widget to
/// rebuild automatically whenever the [ThemeQueryData] changes (e.g., if the
/// user rotates their Theme).
///
/// If no [ThemeQuery] is in scope then the [ThemeQuery.of] method will throw an
/// exception. Alternatively, [ThemeQuery.maybeOf] may be used, which returns
/// null instead of throwing if no [ThemeQuery] is in scope.
///
/// See also:
///
///  * [ThemeQueryData], the data structure that represents the metrics.
class ThemeQuery<T> extends InheritedWidget {
  /// Creates a widget that provides [ThemeQueryData] to its descendants.
  ///
  /// The [data] and [child] arguments must not be null.
  const ThemeQuery({
    Key? key,
    required this.data,
    BuildContext? context,
    MediaQueryData? mediaQueryData,
    required Widget child,
  }) : super(key: key, child: child);

  // /// Creates a new [ThemeQuery] as tablet.
  // ///
  // /// The [child] argument is required and must not be null.
  // factory ThemeQuery.tablet({
  //   Key? key,
  //   required Widget child,
  // }) {
  //   return ThemeQuery(
  //     key: key,
  //     data: const ThemeQueryData(ThemeType: ThemeType.tablet),
  //     child: child,
  //   );
  // }

  /// Contains information about the current Theme.
  ///
  /// For example, the [ThemeQueryData.size] property contains the width and
  /// height of the current window.
  final T data;

  /// The data from the closest instance of this class that encloses the given
  /// context.
  ///
  /// You can use this function to query the size and orientation of the screen,
  /// as well as other Theme parameters (see [ThemeQueryData] for more
  /// examples). When that information changes, your widget will be scheduled to
  /// be rebuilt, keeping your widget up-to-date.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ThemeQueryData Theme = ThemeQuery.of(context);
  /// ```
  ///
  /// If there is no [ThemeQuery] in scope, this will throw a [TypeError]
  /// exception in release builds, and throw a descriptive [FlutterError] in
  /// debug builds.
  ///
  /// See also:
  ///
  ///  * [maybeOf], which doesn't throw or assert if it doesn't find a
  ///    [ThemeQuery] ancestor, it returns null instead.
  static T of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeQuery<T>>()!.data;
  }

  /// The data from the closest instance of this class that encloses the given
  /// context, if any.
  ///
  /// Use this function if you want to allow situations where no [ThemeQuery] is
  /// in scope. Prefer using [ThemeQuery.of] in situations where a Theme query
  /// is always expected to exist.
  ///
  /// If there is no [ThemeQuery] in scope, then this function will return null.
  ///
  /// You can use this function to query the size and orientation of the screen,
  /// as well as other Theme parameters (see [ThemeQueryData] for more
  /// examples). When that information changes, your widget will be scheduled to
  /// be rebuilt, keeping your widget up-to-date.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ThemeQueryData? ThemeQuery = ThemeQuery.maybeOf(context);
  /// if (ThemeQuery == null) {
  ///   // Do something else instead.
  /// }
  /// ```
  ///
  /// See also:
  ///
  ///  * [of], which will throw if it doesn't find a [ThemeQuery] ancestor,
  ///    instead of returning null.
  static T? maybeOf<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeQuery<T>>()?.data;
  }

  /// Returns isDesktop for the nearest ThemeQuery ancestor or [ThemeType.unknown], if
  /// no such ancestor exists.
  static ThemeData? dark<T>(BuildContext context) {
    return ThemeQuery.maybeOf(context)?.dark;
  }

  /// Returns isDesktop for the nearest ThemeQuery ancestor or [ThemeType.unknown], if
  /// no such ancestor exists.
  static ThemeData? light<T>(BuildContext context) {
    return ThemeQuery.maybeOf(context)?.light;
  }

  // static T current<T>(BuildContext context) {
  //   final data =  ThemeQuery.of(context);
  //   return data.current
  // }

  @override
  bool updateShouldNotify(ThemeQuery oldWidget) => data != oldWidget.data;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>('data', data, showName: false));
  }
}
