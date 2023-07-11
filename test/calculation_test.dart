import 'package:calculator/calculations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalculationsProvider', () {
    test('addition', () {
      final provider = CalculationsProvider();
      provider.addDigit('3');
      provider.addOperator('+');
      provider.addDigit('3');
      provider.addOperator('+');
      provider.addDigit('3');
      provider.addOperator('+');
      provider.addDigit('3');
      provider.calculate();
      expect(provider.result, '12');
    });

    test('subtraction', () {
      final provider = CalculationsProvider();
      provider.addDigit('5');
      provider.addOperator('-');
      provider.addDigit('3');
      provider.calculate();
      expect(provider.result, '2');
    });

    test('multiplication', () {
      final provider = CalculationsProvider();
      provider.addDigit('2');
      provider.addOperator('*');
      provider.addDigit('3');
      provider.calculate();
      expect(provider.result, '6');
    });

    test('division', () {
      final provider = CalculationsProvider();
      provider.addDigit('6');
      provider.addOperator('/');
      provider.addDigit('2');
      provider.calculate();
      expect(provider.result, '3');
    });

    test('modulus', () {
      final provider = CalculationsProvider();
      provider.addDigit('5');
      provider.addOperator('%');
      provider.addDigit('3');
      provider.calculate();
      expect(provider.result, '2');
    });

    test('clear', () {
      final provider = CalculationsProvider();
      provider.addDigit('5');
      provider.addOperator('+');
      provider.addDigit('3');
      provider.clear();
      expect(provider.firstNumber, '');
      expect(provider.secondNumber, '');
      expect(provider.operator, '');
      expect(provider.result, '');
      expect(provider.history, '');
    });

    test('deleteLastDigit', () {
      final provider = CalculationsProvider();
      provider.addDigit('5');
      provider.addOperator('+');
      provider.addDigit('3');
      provider.addDigit('5');
      provider.deleteLastDigit();
      expect(provider.secondNumber, '3');
      provider.deleteLastDigit();
      expect(provider.operator, '+');
      provider.deleteLastDigit();
      expect(provider.firstNumber, '5');
      provider.deleteLastDigit();
      expect(provider.firstNumber, '');
      provider.deleteLastDigit();
      expect(provider.operator, '');
      provider.deleteLastDigit();
      expect(provider.secondNumber, '');
    });

    // Add more tests here...

  });
}