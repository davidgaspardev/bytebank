import 'package:bytebank/src/helpers/api/bytebank_api.dart';
import 'package:bytebank/src/helpers/format.dart';
import 'package:bytebank/src/helpers/widgets/auth_dialog.dart';
import 'package:bytebank/src/models/contact_data.dart';
import 'package:bytebank/src/models/transaction_data.dart';
import 'package:bytebank/src/screens/contacts/widgets/input_data.dart';
import 'package:bytebank/src/themes/widgets/header.dart';
import 'package:flutter/material.dart';

class TransferByContactScreen extends StatelessWidget {
  static const routeName = "transfer_by_contact";
  final TextEditingController _value = TextEditingController();
  var _transferInProgress = false;

  final ContactData contact;

  TransferByContactScreen({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "New transfer",
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset("lib/assets/images/back.png"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(contact.fullname),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      showAsBinary(contact.accountNumber),
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      contact.accountNumber.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            InputData(
              label: "Value to transfer",
              placeholder: "50.00",
              controller: _value,
              autofocus: true,
              ketboardType: TextInputType.number,
              margin: const EdgeInsets.symmetric(vertical: 16),
            ),
            OutlinedButton(
              onPressed: () async {
                if (!_transferInProgress) {
                  _transferInProgress = true;
                  final value = double.tryParse(_value.text);

                  if (value != null) {
                    String? password = await showDialog<String>(
                      context: context,
                      builder: (context) => const AuthDialog(),
                    );

                    if (password == "9089") {
                      final transaction = TransactionData(
                        value: value,
                        contact: contact,
                        dateTime: DateTime.now(),
                      );

                      try {
                        await ByteBankAPI().toTransfer(transaction);
                        return Navigator.pop(context);
                      } catch (e) {
                        rethrow;
                      }
                    }
                  }
                  _transferInProgress = false;
                }
              },
              child: const Text("tranfer"),
            ),
          ],
        ),
      ),
    );
  }
}
