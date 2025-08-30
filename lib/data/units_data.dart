// models/units_data.dart

import 'package:mscs533_a01_flutter_unit_converter/models/measure_category.dart';
import 'package:mscs533_a01_flutter_unit_converter/models/unit.dart';

/// Repository of units grouped by category.
///
/// - Length base: meters
/// - Weight base: kilograms
/// - Temperature handled separately (uses formulas)
class UnitsData {
  // List of all supported unit categories and their units.
  static final List<UnitCategory> allCategories = [
    UnitCategory(MeasureCategory.length, [
      Unit('meters', 1.0),
      Unit('feet', 0.3048),
      Unit('inches', 0.0254),
      Unit('yards', 0.9144),
      Unit('kilometers', 1000.0),
      Unit('miles', 1609.34),
    ]),
    UnitCategory(MeasureCategory.weight, [
      Unit('kilograms', 1.0),
      Unit('pounds', 0.453592),
      Unit('ounces', 0.0283495),
      Unit('grams', 0.001),
    ]),
    UnitCategory(MeasureCategory.temperature, [
      Unit('celsius', 1.0),
      Unit('fahrenheit', 1.0),
      Unit('kelvin', 1.0),
    ]),
  ];

  /// Returns the list of units for a given measurement category.
  ///
  /// [category] - The measurement category (e.g., length, weight, temperature).
  /// Returns a list of [Unit] objects for the category.
  static List<Unit> getUnits(MeasureCategory category) {
    return allCategories.firstWhere((c) => c.category == category).units;
  }
}
