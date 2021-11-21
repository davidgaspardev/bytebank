import 'package:bytebank/src/helpers/abstractions/model.dart';

class DepositData extends Model {
  final double value;
  final DateTime dateTime;

  const DepositData({
    required this.value,
    required this.dateTime,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "value": value,
      "dateTime": dateTime.toIso8601String(),
    };
  }
}