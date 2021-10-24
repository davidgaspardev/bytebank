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
