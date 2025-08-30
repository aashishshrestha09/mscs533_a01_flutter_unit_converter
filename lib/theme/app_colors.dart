import 'package:flutter/material.dart';

/// Defines the color palette and theming for the Measures Converter app.
///
/// This file centralizes all color and theme settings for easy maintenance and consistency.
class AppTheme {
  /// The main light theme for the app, using Material 3 and custom colors.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF2196F3), // Primary blue
      onPrimary: Colors.white, // Text/icons on primary
      surface: Colors.white, // Card and background surfaces
      onSurface: Colors.black87, // Text/icons on surfaces
      surfaceContainerHighest: Color(0xFFF5F5F5), // Light gray for containers
      outline: Color(0xFFE0E0E0), // Outline/border color
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFF2196F3),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF2196F3)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF2196F3)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF2196F3), width: 2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE3F2FD), // Light blue background
        foregroundColor: const Color(0xFF2196F3), // Blue text
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
