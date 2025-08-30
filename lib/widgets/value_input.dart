import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Callback type for when the value input changes.
typedef ValueChangedString = void Function(String value);

/// Widget for entering a numeric value to convert.
///
/// Displays a labeled [TextField] with validation and custom styling.
/// Notifies parent when the value changes.
class ValueInput extends StatelessWidget {
  /// Controller for the text field.
  final TextEditingController controller;

  /// Error message to display below the input, or null if no error.
  final String? errorText;

  /// Callback when the value changes.
  final ValueChangedString onChanged;

  /// Creates a [ValueInput] widget.
  const ValueInput({
    super.key,
    required this.controller,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label for the input field
        const Text(
          'Value',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
        // ...existing code...
        const SizedBox(height: 8),
        // Numeric input field
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: true,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[-0-9.]')),
          ],
          decoration: InputDecoration(
            errorText: errorText,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF2196F3)),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF2196F3)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF2196F3), width: 2),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: Color(0xFF2196F3),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
