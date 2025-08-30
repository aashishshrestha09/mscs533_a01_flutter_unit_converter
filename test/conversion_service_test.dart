import 'package:flutter_test/flutter_test.dart';
import 'package:mscs533_a01_flutter_unit_converter/services/measure_conversion_service.dart';
import 'package:mscs533_a01_flutter_unit_converter/models/unit.dart';
import 'package:mscs533_a01_flutter_unit_converter/models/measure_category.dart';

void main() {
  group('ConversionService', () {
    // Test length conversion: meters to miles
    test('converts length units correctly', () {
      final meters = Unit('meters', 1.0);
      final miles = Unit('miles', 1609.34);
      // 1609.34 meters = 1 mile
      final result = ConversionService.convert(
        1609.34,
        meters,
        miles,
        MeasureCategory.length,
      );
      expect(result, closeTo(1.0, 0.0001));
    });

    // Test weight conversion: kilograms to pounds
    test('converts weight units correctly', () {
      final kilograms = Unit('kilograms', 1.0);
      final pounds = Unit('pounds', 0.453592);
      // 0.453592 kg = 1 pound
      final result = ConversionService.convert(
        0.453592,
        kilograms,
        pounds,
        MeasureCategory.weight,
      );
      expect(result, closeTo(1.0, 0.0001));
    });

    // Test temperature conversion: Celsius to Fahrenheit
    test('converts temperature units correctly (Celsius to Fahrenheit)', () {
      final celsius = Unit('celsius', 1.0);
      final fahrenheit = Unit('fahrenheit', 1.0);
      final result = ConversionService.convert(
        100,
        celsius,
        fahrenheit,
        MeasureCategory.temperature,
      );
      expect(result, closeTo(212.0, 0.0001));
    });

    // Test temperature conversion: Fahrenheit to Celsius
    test('converts temperature units correctly (Fahrenheit to Celsius)', () {
      final celsius = Unit('celsius', 1.0);
      final fahrenheit = Unit('fahrenheit', 1.0);
      final result = ConversionService.convert(
        32,
        fahrenheit,
        celsius,
        MeasureCategory.temperature,
      );
      expect(result, closeTo(0.0, 0.0001));
    });

    // Test temperature conversion: negative Celsius to Fahrenheit
    test('converts negative Celsius to Fahrenheit', () {
      final celsius = Unit('celsius', 1.0);
      final fahrenheit = Unit('fahrenheit', 1.0);
      final result = ConversionService.convert(
        -40,
        celsius,
        fahrenheit,
        MeasureCategory.temperature,
      );
      expect(result, closeTo(-40.0, 0.0001));
    });

    // Test zero value conversion
    test('converts zero value correctly', () {
      final meters = Unit('meters', 1.0);
      final miles = Unit('miles', 1609.34);
      final result = ConversionService.convert(
        0,
        meters,
        miles,
        MeasureCategory.length,
      );
      expect(result, 0);
    });

    // Test very large value conversion
    test('converts very large value correctly', () {
      final meters = Unit('meters', 1.0);
      final miles = Unit('miles', 1609.34);
      // 10 miles = 16093.4 meters
      final result = ConversionService.convert(
        16093.4,
        meters,
        miles,
        MeasureCategory.length,
      );
      expect(result, closeTo(10.0, 0.0001));
    });

    // Test formatResult utility
    test('formats result string correctly', () {
      final formatted = ConversionService.formatResult(
        input: 1.0,
        output: 1.60934,
        fromUnit: 'mile',
        toUnit: 'kilometer',
        precision: 2,
      );
      expect(formatted, '1 mile ≈ 1.61 kilometer');
    });

    // Test input validation
    test('validates input correctly', () {
      expect(
        ConversionService.validateInput(''),
        isNotNull,
        reason: 'Empty string should be invalid',
      );
      expect(
        ConversionService.validateInput('abc'),
        isNotNull,
        reason: 'Non-numeric string should be invalid',
      );
      expect(
        ConversionService.validateInput('123'),
        isNull,
        reason: 'Valid number should be accepted',
      );
      expect(
        ConversionService.validateInput('-45.6'),
        isNull,
        reason: 'Negative number should be accepted',
      );
    });
  });
}
