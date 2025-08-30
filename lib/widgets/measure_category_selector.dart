import 'package:flutter/material.dart';
import '../models/measure_category.dart';

/// Callback type for when a category is selected.
typedef CategoryChanged = void Function(MeasureCategory category);

/// Widget for selecting a measurement category using horizontal chips.
///
/// Displays a row of [ChoiceChip]s for each [MeasureCategory].
/// Highlights the selected category and notifies parent on change.
class CategorySelector extends StatelessWidget {
  /// The currently selected category.
  final MeasureCategory selected;

  /// Callback when a new category is selected.
  final CategoryChanged onChanged;

  /// Creates a [CategorySelector] widget.
  const CategorySelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: MeasureCategory.values.map((category) {
        final isSelected = category == selected;
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
            label: Text(category.displayName.toUpperCase()),
            selected: isSelected,
            onSelected: (_) => onChanged(category),
          ),
        );
      }).toList(),
    );
  }
}
