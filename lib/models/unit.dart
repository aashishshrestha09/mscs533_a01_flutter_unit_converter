import 'measure_category.dart';

/// Model representing a unit of measurement.
///
/// [name] - The name of the unit (e.g., 'meters', 'pounds').
/// [factor] - The conversion factor to the base unit for its category.
class Unit {
  final String name;
  final double factor;

  /// Creates a [Unit] with a name and conversion factor.
  Unit(this.name, this.factor);
}

/// Model representing a category with its units.
///
/// [category] - The measurement category (e.g., length, weight).
/// [units] - The list of units belonging to this category.
class UnitCategory {
  final MeasureCategory category;
  final List<Unit> units;

  /// Creates a [UnitCategory] with a category and its units.
  UnitCategory(this.category, this.units);
}
