import 'package:bytebank/src/models/transfer_data.dart';
import 'package:flutter/material.dart';

class TransferItem extends StatelessWidget {

  final TransferData data;

  const TransferItem({
    Key? key,
    required this.data
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset("lib/assets/images/transfer.png"),
        title: Text(data.accountNumber.toString()),
        subtitle: Text(data.value.toString()),
      ),
    );
  }
}