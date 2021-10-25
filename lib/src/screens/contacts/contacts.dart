import 'package:bytebank/src/database/repository/contact_repo.dart';
import 'package:bytebank/src/screens/contacts/widgets/contact_item.dart';
import 'package:bytebank/src/screens/screens.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  static const routeName = "/contacts";
  // final _contacts = <ContactData>[];
  final repository = ContactRepo();

  ContactsScreen({Key? key}) : super(key: key);

  void _addContact(BuildContext context) async {
    var contact = await Navigator.of(context).pushNamed<ContactData>(
      AddContactScreen.routeName,
    );

    if (contact != null) {
      debugPrint("New contact: $contact");
      var result = await repository.create(contact);
      debugPrint("[Sqflite] Result: $result");
      var results = await repository.readAll();
      debugPrint("[Sqflite] All data: $results");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My contacts"),
      ),
      body: FutureBuilder<List<ContactData>>(
          future: repository.readAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text("Loading")
                    ],
                  ),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                final List<ContactData> _contacts = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: _contacts.length,
                  itemBuilder: (context, index) {
                    return ContactItem(
                      data: _contacts[index],
                    );
                  },
                );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addContact(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
