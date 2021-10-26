import 'package:bytebank/src/models/contact_data.dart';
import 'package:bytebank/src/screens/contacts/widgets/input_data.dart';
import 'package:flutter/material.dart';

export 'package:bytebank/src/models/contact_data.dart';

class AddContactScreen extends StatefulWidget {
  static const routeName = "add_contact";

  final TextEditingController fullnameControl = TextEditingController();
  final TextEditingController accountNumberControl = TextEditingController();

  AddContactScreen({Key? key}) : super(key: key);

  @override
  _AddContactScreen createState() => _AddContactScreen();
}

class _AddContactScreen extends State<AddContactScreen> {
  TextEditingController get fullnameControl => widget.fullnameControl;
  TextEditingController get accountNumberControl => widget.accountNumberControl;

  void _getOnlyNumber() {
    String text = accountNumberControl.text;
    text = text.replaceAll(RegExp(r'[^0-9]'), '');

    debugPrint("text: ${accountNumberControl.text}");
    debugPrint("new text: $text");

    if (text != accountNumberControl.text) {
      accountNumberControl.text = text;
      accountNumberControl.selection = TextSelection.fromPosition(
        TextPosition(
          offset: accountNumberControl.text.length,
        ),
      );
    }
  }

  void _createContact() async {
    String fullname = fullnameControl.text;
    int? accountNumber = int.tryParse(accountNumberControl.text);

    if(accountNumber != null && fullname.length > 4) {
      ContactData newContact = ContactData(
        fullname: fullname, 
        accountNumber: accountNumber,
      );

      Navigator.of(context).pop<ContactData>(newContact);
    }
  }

  @override
  void initState() {
    super.initState();

    accountNumberControl.addListener(_getOnlyNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add contact"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InputData(
                label: "Full name",
                placeholder: "David Corrêa Gaspar",
                controller: fullnameControl,
                autofocus: true,
              ),
              InputData(
                label: "Account number",
                placeholder: "0000",
                controller: accountNumberControl,
                ketboardType: TextInputType.number,
              ),
              OutlinedButton(
                onPressed: _createContact,
                child: const Text("ADD"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    accountNumberControl.removeListener(_getOnlyNumber);
    accountNumberControl.dispose();
    fullnameControl.dispose();
    super.dispose();
  }
}
