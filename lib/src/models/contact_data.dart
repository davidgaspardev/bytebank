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

  @override
  Map<String, dynamic> toMap() {
    return {
      "fullname": fullname,
      "accountNumber": accountNumber,
    };
  }
}
