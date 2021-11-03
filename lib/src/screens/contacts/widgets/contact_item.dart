import 'package:bytebank/src/helpers/format.dart';
import 'package:bytebank/src/models/contact_data.dart';
import 'package:bytebank/src/screens/contacts/transfer_by_contact.dart';
import 'package:bytebank/src/themes/fonts.dart';
import 'package:bytebank/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactItem extends StatelessWidget {
  final ContactData data;
  const ContactItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          TransferByContactScreen.routeName,
          arguments: data,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: ThemeColors.color50.withOpacity(0.2),
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  child: Text(data.fullname),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    showAsBinary(data.accountNumber),
                    style: const TextStyle(
                      fontSize: 9,
                      fontFamily: ThemeFonts.robotoMono,
                    ),
                  ),
                  Text(
                    data.accountNumber.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
