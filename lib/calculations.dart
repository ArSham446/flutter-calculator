import 'package:flutter/material.dart';

class CalculationsProvider extends ChangeNotifier {
  String _firstNumber = '';
  String _secondNumber = '';
  String _operator = '';
  String _result = '';
  String _history = '';

  String get firstNumber => _firstNumber;
  String get secondNumber => _secondNumber;
  String get operator => _operator;
  String get result => _result;
  String get history => _history;
  get list => _list;
  List<Function> _list = [];

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
      () => addDigit('.'),
      calculate,
    ];
  }

  void clear() {
    _firstNumber = '';
    _secondNumber = '';
    _operator = '';
    _result = '';
    _history = '';
    notifyListeners();
  }

  void deleteLastDigit() {
    if (_operator.isNotEmpty ||
        _firstNumber.isNotEmpty ||
        _secondNumber.isNotEmpty) {
      if (_secondNumber.isNotEmpty) {
        _secondNumber = _secondNumber.substring(0, _secondNumber.length - 1);
        if (_secondNumber.isNotEmpty) {
          calculations();
        }
        if(_secondNumber.isEmpty){
          _result='';
        }
      } else if (_operator.isNotEmpty) {
        _operator = '';
        
      } else if (_firstNumber.isNotEmpty) {
        _firstNumber = _firstNumber.substring(0, _firstNumber.length - 1);
      }
    }
    notifyListeners();
  }

  void addOperator(String operator) {
    if (_result.isNotEmpty) {
      _firstNumber = _result;
      _result = '';
      _secondNumber = '';
    }
    _operator = operator;
    _history += operator;
    notifyListeners();
  }

  void calculate() {
    calculations();
    _firstNumber = _result;
    notifyListeners();
  }

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

  void calculations() {
    switch (_operator) {
      case '+':
        _result = (double.parse(_firstNumber) + double.parse(_secondNumber))
            .toString();
        break;
      case '-':
        _result = (double.parse(_firstNumber) - double.parse(_secondNumber))
            .toString();
        break;
      case '*':
        _result = (double.parse(_firstNumber) * double.parse(_secondNumber))
            .toString();
        break;
      case '/':
        _result = (double.parse(_firstNumber) / double.parse(_secondNumber))
            .toString();
        break;
      case '%':
        _result = (double.parse(_firstNumber) % double.parse(_secondNumber))
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
