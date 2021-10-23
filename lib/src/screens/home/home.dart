import 'package:bytebank/src/models/transfer_data.dart';
import 'package:bytebank/src/screens/home/widgets/transfer_item.dart';
import 'package:bytebank/src/screens/transfer/transfer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final _transfers = <TransferData>[];

  HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {

  List<TransferData> get _transfers => widget._transfers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferencias"),
      ),
      body: ListView.builder(
        itemCount: _transfers.length,
        itemBuilder: (context, index) {
          return TransferItem(data: _transfers[index]);
        }, 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var result = Navigator.push<TransferData>(
            context, 
            MaterialPageRoute(builder: (context) {
              return TransferScreen();
            })
          );
          result.then((value) {
            if(value != null) {
              debugPrint("Value received: $value");
              setState(() {
                _transfers.add(value);
              });
            }
          });
        },
        child: const Icon(Icons.add)
      ),
    );
  }
}