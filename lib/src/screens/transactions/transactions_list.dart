import 'package:bytebank/src/helpers/api/bytebank_api.dart';
import 'package:bytebank/src/helpers/widgets/centered_message.dart';
import 'package:bytebank/src/models/transaction_data.dart';
import 'package:bytebank/src/screens/transactions/widget/transaction_item.dart';
import 'package:bytebank/src/themes/widgets/header.dart';
import 'package:flutter/material.dart';

class TransactionsListScreen extends StatelessWidget {
  static const routeName = "transactions";

  const TransactionsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Transfers",
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset("lib/assets/images/back.png"),
        ),
      ),
      body: FutureBuilder<List<TransactionData>>(
        future: ByteBankAPI().findAllTransfers,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.active:
            case ConnectionState.done:
            if (!snapshot.hasData) {
              return const CenteredMessage(
                type: MessageType.error,
                message: "Error on communication\nwith server",
              );
            }
              if (snapshot.data!.isEmpty) {
                return const CenteredMessage(
                  message: "No transactions found",
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return TransactionItem(data: snapshot.data![index]);
                },
              );
          }
        },
      ),
    );
  }
}
