/// Enum representing supported measurement categories.
///
/// Used to distinguish between types of units (e.g., length, weight, temperature).
enum MeasureCategory { length, weight, temperature }

/// Extension to provide display names for each MeasureCategory value.
extension CategoryX on MeasureCategory {
  /// Returns a user-friendly display name for the category.
  String get displayName {
    switch (this) {
      case MeasureCategory.length:
        return 'Length';
      case MeasureCategory.weight:
        return 'Weight';
      case MeasureCategory.temperature:
        return 'Temperature';
    }
  }
}
