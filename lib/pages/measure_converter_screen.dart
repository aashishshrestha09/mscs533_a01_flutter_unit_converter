/// The main page for the Measures Converter app.
///
/// Allows users to select a category, input a value, choose units, and perform conversions.
/// Handles all UI and state management for the conversion process.
import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../data/units_data.dart';
import '../models/measure_category.dart';
import '../models/unit.dart';
import '../services/measure_conversion_service.dart';
import '../widgets/measure_category_selector.dart';
import '../widgets/value_input.dart';
import '../widgets/unit_dropdown.dart';
import '../widgets/result_card.dart';

/// The main page widget for the Measures Converter app.
class MeasureConverterPage extends StatefulWidget {
  /// Constructor for MeasureConverterPage.
  const MeasureConverterPage({super.key});

  @override
  State<MeasureConverterPage> createState() => _ConverterPageState();
}

/// State class for MeasureConverterPage.
/// Manages user input, selected units, and conversion results.
class _ConverterPageState extends State<MeasureConverterPage> {
  final TextEditingController _controller = TextEditingController(text: '100');

  MeasureCategory _category = MeasureCategory.length;
  late List<Unit> _units;
  late Unit _fromUnit;
  late Unit _toUnit;

  String _result = '';
  String? _error;

  @override
  void initState() {
    super.initState();
    // Initialize units and default selections for the starting category.
    _units = UnitsData.getUnits(_category);
    _fromUnit = _units[0];
    _toUnit = _units.length > 1 ? _units[1] : _units[0];
    _convert();
  }

  @override
  void dispose() {
    // Dispose the controller to free resources.
    _controller.dispose();
    super.dispose();
  }

  /// Called when the user selects a new measure category.
  /// Updates the available units and resets selections.
  void _onCategoryChanged(MeasureCategory category) {
    setState(() {
      _category = category;
      _units = UnitsData.getUnits(category);
      _fromUnit = _units[0];
      _toUnit = _units.length > 1 ? _units[1] : _units[0];
      _convert();
    });
  }

  /// Performs the conversion using the current input and selected units.
  /// Validates input and updates the result or error message.
  void _convert() {
    final validation = ConversionService.validateInput(_controller.text);
    setState(() {
      _error = validation;
      if (_error == null) {
        final input = double.parse(_controller.text);
        final output = ConversionService.convert(
          input,
          _fromUnit,
          _toUnit,
          _category,
        );
        _result = ConversionService.formatResult(
          input: input,
          output: output,
          fromUnit: _fromUnit.name,
          toUnit: _toUnit.name,
          precision: AppConstants.resultPrecision,
        );
      } else {
        _result = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          AppConstants.appTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            const Text(
              'Category',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            CategorySelector(
              selected: _category,
              onChanged: _onCategoryChanged,
            ),
            const SizedBox(height: 24),
            ValueInput(
              controller: _controller,
              errorText: _error,
              onChanged: (_) {}, // No auto-convert
            ),
            const SizedBox(height: 24),
            UnitDropdown(
              label: 'From',
              selected: _fromUnit,
              units: _units,
              onChanged: (u) => setState(() {
                _fromUnit = u!;
                // No auto-convert
              }),
            ),
            const SizedBox(height: 16),
            UnitDropdown(
              label: 'To',
              selected: _toUnit,
              units: _units,
              onChanged: (u) => setState(() {
                _toUnit = u!;
                // No auto-convert
              }),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _convert,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE3F2FD), // Light blue
                foregroundColor: const Color(0xFF2196F3), // Blue text
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Convert',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty) ResultCard(text: _result),
          ],
        ),
      ),
    );
  }
}
