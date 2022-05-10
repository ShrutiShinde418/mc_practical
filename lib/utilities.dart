import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

class Calculator {
  double roundDouble(double value, int places) {
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  String evaluateExpression(String expression) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    eval = roundDouble(eval, 6);
    String answer = eval.toString();
    return answer;
  }

  String findOperator(IconData data) {
    String operator;
    if (data == FontAwesomeIcons.divide) {
      operator = ' / ';
    } else if (data == FontAwesomeIcons.times) {
      operator = ' * ';
    } else if (data == FontAwesomeIcons.solidWindowMinimize) {
      operator = ' - ';
    } else if (data == FontAwesomeIcons.plus) {
      operator = ' + ';
    }
    return operator;
  }
}
