import '../models/unit.dart';
import '../models/measure_category.dart';

/// ConversionService holds the business logic for converting between units.
///
/// - For temperature, uses specific formulas for each scale.
/// - For other categories, uses a base-unit factor approach.
class ConversionService {
  /// Converts a value from one unit to another within a given category.
  ///
  /// [value] - The numeric value to convert.
  /// [from] - The unit to convert from.
  /// [to] - The unit to convert to.
  /// [category] - The measurement category (e.g., length, weight, temperature).
  ///
  /// Returns the converted value as a double.
  /// Throws FormatException for non-numeric input (caller should validate).
  static double convert(
    double value,
    Unit from,
    Unit to,
    MeasureCategory category,
  ) {
    if (category == MeasureCategory.temperature) {
      return _convertTemperature(value, from.name, to.name);
    }

    // Standard conversion: value -> base unit -> target unit
    final baseValue = value * from.factor; // value in base unit
    final targetValue = baseValue / to.factor;
    return targetValue;
  }

  /// Converts temperature values between Celsius, Fahrenheit, and Kelvin.
  ///
  /// [value] - The temperature value to convert.
  /// [from] - The source unit name.
  /// [to] - The target unit name.
  ///
  /// Returns the converted temperature as a double.
  static double _convertTemperature(double value, String from, String to) {
    // normalize names to lower-case
    final f = from.toLowerCase();
    final t = to.toLowerCase();

    // convert from source to celsius
    double celsius;
    if (f == 'fahrenheit') {
      celsius = (value - 32) * 5 / 9;
    } else if (f == 'kelvin') {
      celsius = value - 273.15;
    } else {
      celsius = value; // celsius
    }

    // convert celsius to target
    if (t == 'fahrenheit') {
      return celsius * 9 / 5 + 32;
    } else if (t == 'kelvin') {
      return celsius + 273.15;
    } else {
      return celsius; // target is celsius
    }
  }

  /// Validates the raw input string from the user.
  ///
  /// Returns null if the input is valid, or an error message string if invalid.
  static String? validateInput(String input) {
    if (input.trim().isEmpty) return 'Please enter a value';
    if (double.tryParse(input) == null) return 'Please enter a valid number';
    return null;
  }

  /// Formats the conversion result for display in the UI.
  ///
  /// [input] - The original input value.
  /// [output] - The converted value.
  /// [fromUnit] - The name of the source unit.
  /// [toUnit] - The name of the target unit.
  /// [precision] - Number of decimal places to show.
  ///
  /// Returns a formatted string like "1 mile ≈ 1.609 km".
  static String formatResult({
    required double input,
    required double output,
    required String fromUnit,
    required String toUnit,
    required int precision,
  }) {
    final inputStr = input == input.toInt()
        ? input.toInt().toString()
        : input.toString();
    final outputStr = output
        .toStringAsFixed(precision)
        .replaceAll(RegExp(r'\.?0+$'), '');
    return '$inputStr $fromUnit ≈ $outputStr $toUnit';
  }
}
