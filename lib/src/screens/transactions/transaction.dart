import 'package:bytebank/src/models/transaction_data.dart';
import 'package:bytebank/src/themes/widgets/header.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  static const routeName = "transaction";
  final TransactionData data;

  const TransactionScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Transaction",
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset("lib/assets/images/back.png"),
        ),
      ),
      body: Column(
        children: [
          Text(data.contact.fullname),
          Text(data.contact.accountNumber.toString()),
          Text(data.value.toString()),
          Text(data.dateTime.toString()),
        ],
      ),
    );
  }
}
