import 'package:flutter/material.dart';

/// Defines the main theme for the Measures Converter app.
///
/// Sets the default font, color scheme, and other visual properties for a consistent look.
class AppTheme {
  /// The main light theme for the app, using Material 3 and Open Sans font.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    fontFamily: 'OpenSans', // Set OpenSans as the default font
    appBarTheme: const AppBarTheme(centerTitle: true),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
