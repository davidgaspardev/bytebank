import 'package:bytebank/src/helpers/abstractions/model.dart';
import 'package:flutter/material.dart';

class BalanceData extends ChangeNotifier implements Model {
  double _value;

  BalanceData({
    required double value,
  }): _value = value;

  void increment(double value) {
    _value += value;
    notifyListeners();
  }

  void decrement(double value) {
    _value -= value;
    notifyListeners();
  }

  @override
  Map<String, double> toMap() {
    return {
      "value": _value
    };
  }

  @override
  String toString() {
    return "R\$ ${_value.toStringAsFixed(2)}";
  }
}