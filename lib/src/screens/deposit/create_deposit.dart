import 'package:bytebank/src/models/deposit_data.dart';
import 'package:bytebank/src/screens/contacts/widgets/input_data.dart';
import 'package:bytebank/src/themes/widgets/header.dart';
import 'package:flutter/material.dart';

class CreateDepositScreen extends StatelessWidget {
  static const routeName = "deposit/create";

  CreateDepositScreen({Key? key}) : super(key: key);

  final _valueControl = TextEditingController();

  void createDeposit(BuildContext context) {
    double? value = double.tryParse(_valueControl.text);

    if (value != null) {
      var deposit = DepositData(
        value: value,
        dateTime: DateTime.now(),
      );
      Navigator.pop(context, deposit);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "To deposit",
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset("lib/assets/images/back.png"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              InputData(
                label: "Valor",
                placeholder: "0.00",
                autofocus: true,
                controller: _valueControl,
              ),
              ElevatedButton(
                onPressed: () => createDeposit(context),
                child: const Text("Confirmar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
