import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  
  TransferScreen({ Key? key }): super(key: key);

  final accountNumberControl = TextEditingController();
  final valueControl = TextEditingController();

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
            TextField(
              controller: accountNumberControl,
              style: const TextStyle(
                fontSize: 20
              ),
              decoration: const InputDecoration(
                label: Text("Número da conta"),
                hintText: "0000",
              ),
            ),
            TextField(
              controller: valueControl,
              style: const TextStyle(
                fontSize: 20
              ),
              decoration: const InputDecoration(
                label: Text("Valor"),
                hintText: "0.00",
                icon: Icon(Icons.monetization_on)
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int? accountNumber = int.tryParse(accountNumberControl.text);
                double? value = double.tryParse(valueControl.text);

                if(accountNumber != null && value != null) {
                  var transfer = Transfer(accountNumber: accountNumber, value: value);
                  debugPrint("tranfer: $transfer");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(transfer.toString())
                    )
                  );
                }
              },
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