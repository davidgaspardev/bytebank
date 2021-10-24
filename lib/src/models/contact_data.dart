import 'package:bytebank/src/helpers/abstractions/model.dart';

class ContactData extends Model {
  final String fullname;
  final int accountNumber;

  ContactData({
    required this.fullname,
    required this.accountNumber,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "fullname": fullname,
      "accountNumber": accountNumber,
    };
  }
}
