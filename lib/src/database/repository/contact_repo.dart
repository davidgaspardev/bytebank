import 'package:bytebank/src/models/contact_data.dart';
import 'package:bytebank/src/database/database.dart';

class ContactRepo {

  static const tableSql = 'CREATE TABLE $_tableName('
              '$_id INTEGER PRIMARY KEY, '
              '$_fullname TEXT, '
              '$_accountNumber INTEGER)';
  static const _tableName = 'contacts';
  static const _id = 'id';
  static const _fullname = 'fullname';
  static const _accountNumber = 'account_number';

  Future<int> create(ContactData contact) async {
    var db = await createDatabase();

    final contactMap = <String, dynamic>{
      _id: contact.id,
      _fullname: contact.fullname,
      _accountNumber: contact.accountNumber
    };

    return await db.insert(_tableName, contactMap);
  }

  Future<List<ContactData>> readAll() async {
    var db = await createDatabase();

    var contacts = <ContactData>[];

    for (Map<String, dynamic> row in await db.query(_tableName)) {
      contacts.add(
        ContactData(
          id: row[_id],
          fullname: row[_fullname],
          accountNumber: row[_accountNumber],
        ),
      );
    }

    return contacts;
  }
}
