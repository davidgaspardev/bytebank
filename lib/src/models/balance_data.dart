import 'package:bytebank/src/helpers/abstractions/model.dart';
import 'package:flutter/material.dart';

class BalanceData extends ChangeNotifier implements Model {
  final double value;

  BalanceData({
    required this.value,
  });

  @override
  Map<String, double> toMap() {
    return {
      "value": value
    };
  }

  @override
  String toString() {
    return "R\$ ${value.toStringAsFixed(2)}";
  }
}