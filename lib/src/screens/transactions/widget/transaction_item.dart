import 'package:bytebank/src/helpers/format.dart';
import 'package:bytebank/src/models/transaction_data.dart';
import 'package:bytebank/src/themes/themes.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final TransactionData data;

  const TransactionItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: ThemeColors.theme[50]!.withOpacity(.1),
          ),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Image.asset("lib/assets/images/transfer.png"),
            ),
            Expanded(
              // color: Colors.red,
              // height: double.maxFinite,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(data.value.toString()),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    showAsBinary(data.contact.accountNumber),
                    style: const TextStyle(
                      fontFamily: ThemeFonts.robotoMono,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    data.contact.accountNumber.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
