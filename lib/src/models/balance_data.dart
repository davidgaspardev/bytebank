import 'package:bytebank/src/helpers/abstractions/model.dart';

class BalanceData extends Model {
  final double value;

  const BalanceData({
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