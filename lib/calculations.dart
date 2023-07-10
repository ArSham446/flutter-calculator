import 'package:flutter/material.dart';

class CalculationsProvider extends ChangeNotifier {
  String _firstNumber = '';
  String _secondNumber = '';
  String _operator = '';
  String _result = '';
  String _history = '';

  get firstNumber => _firstNumber;
  get secondNumber => _secondNumber;
  get operator => _operator;
  get result => _result;
  get history => _history;
  get list => _list;

  List<dynamic> _list = [];

  CalculationsProvider() {
    _list = [
      () => clear(),
      () {
        if (_firstNumber.isNotEmpty || _history.isNotEmpty) {
          if (_firstNumber.isNotEmpty) {
            _firstNumber = _firstNumber.substring(0, _result.length - 1);
          } else if (_history.isNotEmpty) {
            _history = _history.substring(0, _history.length - 1);
          }
        }
        notifyListeners();
      },
      () {
        _history += '%';
        _operator = '%';

        notifyListeners();
      },
      () {
        _history += '/';
        _operator = '/';

        notifyListeners();
      },
      () {
        if (_operator.isNotEmpty) {
          _secondNumber += '7';
          calculations();
        } else {
          _firstNumber += '7';
        }
        _history += '7';
        notifyListeners();
      },
      () {
        if (_operator.isNotEmpty) {
          _secondNumber += '8';
          calculations();
        } else {
          _firstNumber += '8';
        }
        _history += '8';
        notifyListeners();
      },
      () {
        if (_operator.isNotEmpty) {
          _secondNumber += '9';
          calculations();
        } else {
          _firstNumber += '9';
        }
        _history += '9';
        notifyListeners();
      },
      () {
        _history += '*';

        _operator = '*';

        notifyListeners();
      },
      () {
        if (_operator.isNotEmpty) {
          _secondNumber += '4';
          calculations();
        } else {
          _firstNumber += '4';
        }
        _history += '4';
        notifyListeners();
      },
      () {
        if (_operator.isNotEmpty) {
          _secondNumber += '5';
          calculations();
        } else {
          _firstNumber += '5';
        }
        _history += '5';
        notifyListeners();
      },
      () {
        if (_operator.isNotEmpty) {
          _secondNumber += '6';
          calculations();
        } else {
          _firstNumber += '6';
        }
        _history += '6';
        notifyListeners();
      },
      () {
        _operator = '-';
        _history += '-';
        notifyListeners();
      },
      () {
        if (_operator.isNotEmpty) {
          _secondNumber += '1';
          calculations();
        } else {
          _firstNumber += '1';
        }
        _history += '1';
        notifyListeners();
      },
      () {
        if (_operator.isNotEmpty) {
          _secondNumber += '2';
          calculations();
        } else {
          _firstNumber += '2';
        }
        _history += '2';
        notifyListeners();
      },
      () {
        if (_operator.isNotEmpty) {
          _secondNumber += '3';
          calculations();
        } else {
          _firstNumber += '3';
        }
        _history += '3';
        notifyListeners();
      },
      () {
        _operator = '+';
        _history += '+';
        notifyListeners();
      },
      () {
        if (_operator.isNotEmpty) {
          _secondNumber += '0';
          calculations();
        } else {
          _firstNumber += '0';
        }
        _history += '0';
        notifyListeners();
      },
      () {
        if (_operator.isNotEmpty) {
          _secondNumber += '.';
          calculations();
        } else {
          _firstNumber += '.';
        }
        _history += '.';
        notifyListeners();
      },
      () {
        calculations();
        _history = _result;

        notifyListeners();
      },
    ];
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
  }

  void clear() {
    _firstNumber = '';
    _secondNumber = '';
    _operator = '';
    _result = '';
    _history = '';

    notifyListeners();
  }
}
