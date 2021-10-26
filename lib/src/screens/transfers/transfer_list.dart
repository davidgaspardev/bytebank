import 'package:bytebank/src/database/repository/transfer_repo.dart';
import 'package:bytebank/src/helpers/abstractions/repository.dart';
import 'package:bytebank/src/models/transfer_data.dart';
import 'package:bytebank/src/screens/transfers/widgets/transfer_item.dart';
import 'package:bytebank/src/screens/transfers/add_transfer.dart';
import 'package:flutter/material.dart';

class TransferListScreen extends StatefulWidget {
  static const routeName = "/home";

  final _transfers = <TransferData>[];

  TransferListScreen({Key? key}) : super(key: key);

  @override
  _TransferListScreen createState() {
    return _TransferListScreen();
  }
}

class _TransferListScreen extends State<TransferListScreen> {
  final Repository<TransferData> repository = TransferRepo();

  List<TransferData> get _transfers => widget._transfers;

  void _addTransfer() async {
    var transfer = await Navigator.pushNamed<TransferData>(
      context,
      AddTransferScreen.routeName,
    );
    if (transfer != null) {
      debugPrint("Value received: $transfer");
      await repository.create(transfer);
      setState(() {
        _transfers.add(transfer);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    repository.readAll().then((List<TransferData> data) {
      setState(() {
        _transfers.addAll(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ByteBank"),
        leading: Image.asset("lib/assets/images/logo.png"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: _transfers.length,
        itemBuilder: (context, index) {
          return TransferItem(data: _transfers[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTransfer,
        child: const Icon(Icons.add),
      ),
    );
  }
}