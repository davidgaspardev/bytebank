import 'package:bytebank/src/models/transfer_data.dart';
import 'package:bytebank/src/screens/transfer/transfer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferencias"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var result = Navigator.push<TransferData>(context, MaterialPageRoute(builder: (context) {
            return TransferScreen();
          }));
          result.then((value) {
            if(value != null) debugPrint("Value received: $value");
          });
        },
        child: const Icon(Icons.add)
      ),
    );
  }
}