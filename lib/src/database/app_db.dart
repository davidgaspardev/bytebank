import 'package:bytebank/src/models/contact_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  String path = await getDatabasesPath();

  path = join(path, 'bytebank.db');

  return await openDatabase(
    path,
    onCreate: (db, version) {
      switch (version) {
        case 1:
          db.execute('CREATE TABLE contacts('
              'id INTEGER PRIMARY KEY, '
              'fullname TEXT, '
              'account_number INTEGER)');
          break;
      }
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<int> saveContact(ContactData contact) async {
  var db = await createDatabase();

  final contactMap = <String, dynamic>{
    "id": contact.id,
    "fullname": contact.fullname,
    "account_number": contact.accountNumber
  };

  return await db.insert("contacts", contactMap);
}

Future<List<ContactData>> getAllContacts() async {
  var db = await createDatabase();

  var contactsRaw = await db.query("contacts");
  var contacts = <ContactData>[];

  for (Map<String, dynamic> contact in contactsRaw) {
    contacts.add(
      ContactData(
        id: contact["id"],
        fullname: contact["fullname"],
        accountNumber: contact["account_number"],
      ),
    );
  }

  return contacts;
}
