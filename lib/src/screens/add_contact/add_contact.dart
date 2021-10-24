import 'package:bytebank/src/screens/add_contact/widgets/input_data.dart';
import 'package:flutter/material.dart';

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

  void getOnlyNumber() {
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

  @override
  void initState() {
    super.initState();

    accountNumberControl.addListener(getOnlyNumber);
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
                label: "Account name",
                placeholder: "0000",
                controller: accountNumberControl,
                ketboardType: TextInputType.number,
              ),
              OutlinedButton(
                onPressed: () {},
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
    accountNumberControl.removeListener(getOnlyNumber);
    accountNumberControl.dispose();
    fullnameControl.dispose();
    super.dispose();
  }
}
