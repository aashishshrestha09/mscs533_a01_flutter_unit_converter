import 'dart:math';

/// Lightweight conversion helpers. Used by ConversionService.
/// Keep formulas clear and documented.
class ConversionUtils {
  // Length / weight: multiply by factor to get base unit, then divide by target factor.

  /// Round to given precision
  static double roundTo(double value, int digits) {
    final factor = pow(10, digits);
    return (value * factor).round() / factor;
  }
}
