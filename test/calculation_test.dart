import 'package:calculator/calculations.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('CalculationsProvider', () {
    test('Addition', () {
      final provider = CalculationsProvider();
      provider.firstNumber = '2';
      provider.secondNumber = '3';
      provider.operator = '+';
      provider.calculations();
      expect(provider.result, '5');
    });

    test('Subtraction', () {
      final provider = CalculationsProvider();
      provider.firstNumber = '5';
      provider.secondNumber = '3';
      provider.operator = '-';
      provider.calculations();
      expect(provider.result, '2');
    });

    test('Multiplication', () {
      final provider = CalculationsProvider();
      provider.firstNumber = '2';
      provider.secondNumber = '3';
      provider.operator = '*';
      provider.calculations();
      expect(provider.result, '6');
    });

    test('Division', () {
      final provider = CalculationsProvider();
      provider.firstNumber = '6';
      provider.secondNumber = '3';
      provider.operator = '/';
      provider.calculations();
      expect(provider.result, '2');
    });

    test('Modulus', () {
      final provider = CalculationsProvider();
      provider.firstNumber = '5';
      provider.secondNumber = '3';
      provider.operator = '%';
      provider.calculations();
      expect(provider.result, '2');
    });

    test('Clear', () {
      final provider = CalculationsProvider();
      provider.firstNumber = '5';
      provider.secondNumber = '3';
      provider.operator = '+';
      provider.calculations();
      provider.clear();
      expect(provider.firstNumber, '');
      expect(provider.secondNumber, '');
      expect(provider.operator, '');
      expect(provider.result, '');
      expect(provider.history, '');
    });
  });
}