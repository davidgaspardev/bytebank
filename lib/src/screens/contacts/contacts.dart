import 'package:bytebank/src/database/app_db.dart';
import 'package:bytebank/src/screens/screens.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  static const routeName = "/contacts";

  const ContactsScreen({Key? key}) : super(key: key);

  void _addContact(BuildContext context) async {
    var contact = await Navigator.of(context).pushNamed<ContactData>(
      AddContactScreen.routeName,
    );

    if(contact != null) {
      debugPrint("New contact: $contact");
      var result = await saveContact(contact);
      debugPrint("[Sqflite] Result: $result");
      var results = await getAllContacts();
      debugPrint("[Sqflite] All data: $results");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My contacts"),
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text("Renan Sousa Silveira"),
              subtitle: Text("3476374"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addContact(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
