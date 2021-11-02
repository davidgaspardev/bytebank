import 'package:bytebank/src/helpers/abstractions/model.dart';

class ContactData extends Model {
  final int id;
  final String fullname;
  final int accountNumber;

  ContactData({
    int? id,
    required this.fullname,
    required this.accountNumber,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch;

  static ContactData fromMap(Map<String, dynamic> map) {
    try {
      return ContactData(
        fullname: map["fullname"],
        accountNumber: map["accountNumber"],
      );
    } catch(e) {
      rethrow;
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "fullname": fullname,
      "accountNumber": accountNumber,
    };
  }
}
