import 'package:flutter/material.dart';


abstract class Calculation {
  void numberPressed(int num);
  void operatorPressed(String op);
  void calculateResult();
  void clear();
}

class CalculationImpl extends ChangeNotifier implements Calculation {
  num _result = 0;
  num _firstOperand = 0;
  num _secondOperand = 0;
  String? _operator;

  num get result => _result;
  num get firstOperand => _firstOperand;
  num get secondOperand => _secondOperand;
  String? get operator => _operator;

  @override
  void numberPressed(int num) {
    if (_result != 0) {
      _result = 0;
      _firstOperand = num;
      notifyListeners();
    } else if (_firstOperand == 0) {
      _firstOperand = num;
      notifyListeners();
    } else if (_operator == null) {
      //concatenae firstOperand and clicked numbe when use has not clicked on any operator.
      _firstOperand = int.parse('$_firstOperand$num');
      notifyListeners();
    } else if (_secondOperand == 0) {
      _secondOperand = num;
      notifyListeners();
    } else if (_operator != null) {
      ///If the operato is not null we assume user is typing second operand
      ///concatenae secondOperand and clicked number.
      _secondOperand = int.parse('$_secondOperand$num');
      notifyListeners();
    }
  }

  @override
  void operatorPressed(String op) {
    _operator = op;
    notifyListeners();
  }

  @override
  void calculateResult() {
    if (_operator == null || _secondOperand == 0) {
      return;
    }

    //Supported operations
    switch (_operator) {
      case '+':
        _result = _firstOperand + _secondOperand;
        notifyListeners();
        break;
      case '-':
        _result = _firstOperand - _secondOperand;
        notifyListeners();
        break;
      case 'x':
        _result = _firstOperand * _secondOperand;
        notifyListeners();
        break;
      case '/':
        if (_secondOperand == 0) {
          return;
        }
      _result = _firstOperand / _secondOperand;
      
        notifyListeners();
        break;
    }
  }

  @override
  void clear() {
    _operator = null;
    _firstOperand = 0;
    _secondOperand = 0;
    _result = 0;
    notifyListeners();
  }
}
