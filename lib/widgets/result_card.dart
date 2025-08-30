import 'package:flutter/material.dart';

/// Widget for displaying the conversion result in a styled card.
///
/// Shows the result text centered in a decorated container.
class ResultCard extends StatelessWidget {
  /// The result text to display.
  final String text;

  /// Creates a [ResultCard] widget.
  const ResultCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA), // Light gray background
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 0.5),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
