import 'package:bytebank/src/helpers/format.dart';
import 'package:bytebank/src/models/transfer_data.dart';
import 'package:bytebank/src/themes/colors.dart';
import 'package:bytebank/src/themes/fonts.dart';
import 'package:flutter/material.dart';

class TransferItem extends StatelessWidget {
  final TransferData data;

  const TransferItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ThemeColors.theme[50]!.withOpacity(.1),
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
                    showAsBinary(data.accountNumber),
                    style: const TextStyle(
                      fontFamily: ThemeFonts.robotoMono,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    data.accountNumber.toString(),
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
