import 'package:bytebank/src/screens/home/widgets/transfer_item.dart';
import 'package:bytebank/src/screens/transfer/transfer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  final _transfers = <TransferData>[];

  HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<TransferData> get _transfers => widget._transfers;

  void _addTransfer() async {
    var transfer = await Navigator.pushNamed<TransferData>(
      context,
      TransferScreen.routeName,
    );
    if (transfer != null) {
      debugPrint("Value received: $transfer");
      setState(() {
        _transfers.add(transfer);
      });
    }
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
