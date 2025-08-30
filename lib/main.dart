import 'package:flutter/material.dart';
import 'pages/measure_converter_screen.dart';
import 'core/constants/app_constants.dart';
import 'theme/app_theme.dart';

/// Entry point of the application.
/// This function initializes and runs the MeasuresConverterApp widget.
void main() {
  runApp(const MeasuresConverterApp());
}

/// The root widget for the Measures Converter application.
///
/// Sets up the MaterialApp with theming, title, and the home page.
class MeasuresConverterApp extends StatelessWidget {
  /// Constructor for MeasuresConverterApp.
  const MeasuresConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // The title of the app, shown in the app switcher.
      title: AppConstants.appTitle,
      // Hides the debug banner in release and debug modes.
      debugShowCheckedModeBanner: false,
      // Applies the custom light theme defined in app_theme.dart.
      theme: AppTheme.lightTheme,
      // Sets the main page of the app.
      home: const MeasureConverterPage(),
    );
  }
}
