import 'package:bytebank/src/models/transfer_data.dart';
import 'package:bytebank/src/screens/transfers/widgets/edit.dart';
import 'package:flutter/material.dart';

class AddTransferScreen extends StatelessWidget {
  static const routeName = "transfer/add";

  AddTransferScreen({Key? key}) : super(key: key);

  final _accountNumberControl = TextEditingController();
  final _valueControl = TextEditingController();

  void createTransfer(BuildContext context) {
    int? accountNumber = int.tryParse(_accountNumberControl.text);
    double? value = double.tryParse(_valueControl.text);

    if (accountNumber != null && value != null) {
      var transfer = TransferData(accountNumber: accountNumber, value: value);
      debugPrint("Tranfer created: $transfer");
      Navigator.pop(context, transfer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar transferência"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Edit(
                label: "Número da conta",
                hint: "0000",
                controller: _accountNumberControl,
              ),
              Edit(
                label: "Valor",
                hint: "0.00",
                icon: const Icon(Icons.monetization_on),
                controller: _valueControl,
              ),
              ElevatedButton(
                onPressed: () => createTransfer(context),
                child: const Text("Confirmar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
