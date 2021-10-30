import 'package:bytebank/src/database/repository/contact_repo.dart';
import 'package:bytebank/src/helpers/abstractions/repository.dart';
import 'package:bytebank/src/screens/contacts/widgets/contact_item.dart';
import 'package:bytebank/src/screens/screens.dart';
import 'package:bytebank/src/themes/widgets/header.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  static const routeName = "contacts";
  final repository = ContactRepo();

  ContactListScreen({Key? key}) : super(key: key);

  @override
  _ContactListScreen createState() => _ContactListScreen();
}

class _ContactListScreen extends State<ContactListScreen> {
  Repository get repository => widget.repository;
  final List<ContactData> _contacts = [];

  void _addContact(BuildContext context) async {
    var contact = await Navigator.of(context).pushNamed<ContactData>(
      AddContactScreen.routeName,
    );

    if (contact != null) {
      debugPrint("New contact: $contact");
      await repository.create(contact);
      // debugPrint("[Sqflite] Result: $result");
      // var results = await repository.readAll();
      // debugPrint("[Sqflite] All data: $results");
      setState(() {
        _contacts.add(contact);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    repository.readAll().then((contacts) {
      setState(() {
        _contacts.addAll(contacts as Iterable<ContactData>);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Contacts",
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset("lib/assets/images/back.png"),
        ),
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          return ContactItem(
            data: _contacts[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addContact(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
