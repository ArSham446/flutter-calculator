import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';

class CalculationsProvider extends ChangeNotifier {
  // bool decimal = false;
  String _firstNumber = '';
  String _secondNumber = '';
  String _operator = '';
  String _result = '';
  String _history = '';
  List<Function> _list = [];
  List<Function> _lisT = [];

  // Constructor to initialize the list of button functions
  CalculationsProvider() {
    _list = [
      clear,
      deleteLastDigit,
      () => addOperator('%'),
      () => addOperator('/'),
      () => addDigit('7'),
      () => addDigit('8'),
      () => addDigit('9'),
      () => addOperator('*'),
      () => addDigit('4'),
      () => addDigit('5'),
      () => addDigit('6'),
      () => addOperator('-'),
      () => addDigit('1'),
      () => addDigit('2'),
      () => addDigit('3'),
      () => addOperator('+'),
      () => addDigit('0'),
      () => addDesimal('.'),
      calculate,
    ];
    _lisT = [
      clear,
      () => addDigit('1'),
      () => addDigit('2'),
      () => addDigit('3'),
      () => addOperator('*'),
      () => addOperator('/'),
      () => addDigit('4'),
      () => addDigit('5'),
      () => addDigit('6'),
      () => addDigit('7'),
      () => addOperator('+'),
      () => addOperator('-'),
      () => addDigit('8'),
      () => addDigit('9'),
      () => addDigit('0'),
      () => addDesimal('.'),
      () => addOperator('%'),
      deleteLastDigit,
      calculate,
    ];
  }

  // Getters for the private variables
  String get firstNumber => _firstNumber;
  String get secondNumber => _secondNumber;
  String get operator => _operator;
  String get result => _result;
  String get history => _history;
  get list => _list;
  get lisT => _lisT;

  // Function to clear all variables and notify listeners
  void clear() {
    _firstNumber = '';
    _secondNumber = '';
    _operator = '';
    _result = '';
    _history = '';
    //decimal = false;
    notifyListeners();
  }

  // Function to delete the last digit entered and notify listeners
  void deleteLastDigit() {
    if (_operator.isNotEmpty ||
        _firstNumber.isNotEmpty ||
        _secondNumber.isNotEmpty) {
      if (_secondNumber.isNotEmpty) {
        _secondNumber = _secondNumber.substring(0, _secondNumber.length - 1);
        if (_secondNumber.isNotEmpty) {
          calculations();
        }
        if (_secondNumber.isEmpty) {
          _result = '';
        }
      } else if (_operator.isNotEmpty) {
        _operator = '';
      } else if (_firstNumber.isNotEmpty) {
        _firstNumber = _firstNumber.substring(0, _firstNumber.length - 1);
      }
    }
    notifyListeners();
  }

  // Function to add an operator and notify listeners
  void addOperator(String operator) {
    if (_result.isNotEmpty) {
      _firstNumber = _result;
      _result = '';
      _secondNumber = '';
    }
    _operator = operator;
    _history += operator;
    //  decimal = false;
    notifyListeners();
  }

  // Function to perform the calculation and notify listeners
  void calculate() {
    calculations();
    _firstNumber = _result;
    notifyListeners();
  }

  // Function to add a digit and notify listeners
  void addDigit(String digit) {
    if (_operator.isNotEmpty) {
      _secondNumber += digit;
      calculations();
    } else {
      _firstNumber += digit;
    }
    _history += digit;
    notifyListeners();
  }

  void addDesimal(String digit) {
    // if (decimal) {
    //   return;
    // }
    if (_operator.isNotEmpty) {
      _secondNumber += digit;
      //decimal = true;
    } else {
      _firstNumber += digit;
      //decimal = true;
    }

    notifyListeners();
  }

  // Function to perform the calculation based on the operator
  void calculations() {
    switch (_operator) {
      case '+':
        _result = (Decimal.parse(_firstNumber) + Decimal.parse(_secondNumber))
            .toString();
        break;
      case '-':
        _result = (Decimal.parse(_firstNumber) - Decimal.parse(_secondNumber))
            .toString();
        break;
      case '*':
        _result = (Decimal.parse(_firstNumber) * Decimal.parse(_secondNumber))
            .toString();
        break;
      case '/':
        Decimal result =
            (Decimal.parse(_firstNumber) / Decimal.parse(_secondNumber))
                .toDecimal();
        _result = result.toString();

        break;
      case '%':
        _result = (Decimal.parse(_firstNumber) % Decimal.parse(_secondNumber))
            .toString();
        break;
      default:
        _result = '0';
    }
    if (_result.endsWith('.0')) {
      _result = _result.substring(0, _result.length - 2);
    }
  }
}
