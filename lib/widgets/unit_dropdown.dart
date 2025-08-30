import 'package:flutter/material.dart';
import '../models/unit.dart';

/// Callback type for when a unit is selected.
typedef UnitChanged = void Function(Unit? unit);

/// Widget for selecting a unit from a dropdown menu.
///
/// Displays a label and a [DropdownButton] for the list of [Unit]s.
/// Notifies parent when a new unit is selected.
class UnitDropdown extends StatelessWidget {
  /// The label to display above the dropdown.
  final String label;

  /// The currently selected unit.
  final Unit selected;

  /// The list of available units.
  final List<Unit> units;

  /// Callback when a new unit is selected.
  final UnitChanged onChanged;

  /// Creates a [UnitDropdown] widget.
  const UnitDropdown({
    super.key,
    required this.label,
    required this.selected,
    required this.units,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label for the dropdown
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        // Dropdown container with underline
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFF2196F3), width: 1),
            ),
          ),
          child: DropdownButton<Unit>(
            value: selected,
            isExpanded: true,
            underline: const SizedBox.shrink(),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFF2196F3),
            ),
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF2196F3),
              fontWeight: FontWeight.normal,
            ),
            onChanged: onChanged,
            items: units
                .map(
                  (u) => DropdownMenuItem(
                    value: u,
                    child: Text(
                      u.name,
                      style: const TextStyle(
                        color: Color(0xFF2196F3),
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
