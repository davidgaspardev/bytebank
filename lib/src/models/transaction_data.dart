import 'package:bytebank/src/helpers/abstractions/model.dart';
import 'package:bytebank/src/models/contact_data.dart';

class TransactionData extends Model {
  final String? id;
  final double value;
  final ContactData contact;
  final DateTime dateTime;

  const TransactionData({
    this.id,
    required this.value,
    required this.contact,
    required this.dateTime,
  });

  static TransactionData fromMap(Map<String, dynamic> map) {
    try {
      return TransactionData(
        id: map["id"],
        value: map["value"] is int ? map["value"].toDouble() : map["value"],
        contact: ContactData.fromMap(map["contact"]),
        dateTime: DateTime.parse(map["dateTime"]),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "value": value,
      "contact": contact.toMap(),
      "datetime": dateTime.toIso8601String(),
    };

    if(id != null) map["id"] = id;

    return map;
  }
}
