import 'package:bytebank/src/screens/transfer/widgets/edit.dart';
import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  
  TransferScreen({ Key? key }): super(key: key);

  final _accountNumberControl = TextEditingController();
  final _valueControl = TextEditingController();

  void createTransfer(BuildContext context) {
    int? accountNumber = int.tryParse(_accountNumberControl.text);
    double? value = double.tryParse(_valueControl.text);

    if(accountNumber != null && value != null) {
        var transfer = Transfer(accountNumber: accountNumber, value: value);
        debugPrint("tranfer: $transfer");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(transfer.toString())
          )
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar transferência"),
      ),
      body: Container(
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
              child: const Text("Confirmar")
            ),
          ],
        ),
      ),
    );
  }
}

class Transfer {
  final int accountNumber;
  final double value;

  const Transfer({
    required this.accountNumber,
    required this.value
  });

  @override
  String toString() {
    return "Transfer $value dollars to account number: $accountNumber";
  }
}