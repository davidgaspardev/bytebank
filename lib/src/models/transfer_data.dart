import 'package:bytebank/src/helpers/abstractions/model.dart';

/// Transfer data model
class TransferData extends Model {

  final int accountNumber;
  final double value;

  const TransferData({
    required this.accountNumber,
    required this.value
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "accountNumber": accountNumber,
      "value": value
    };
  }
}