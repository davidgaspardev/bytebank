import 'package:bytebank/src/database/repository/deposit_repo.dart';
import 'package:bytebank/src/helpers/abstractions/repository.dart';
import 'package:bytebank/src/models/deposit_data.dart';
import 'package:bytebank/src/screens/deposit/create_deposit.dart';
import 'package:bytebank/src/themes/widgets/header.dart';
import 'package:flutter/material.dart';

class DepositListScreen extends StatefulWidget {
  static const routeName = "deposits";

  final _deposits = <DepositData>[];

  DepositListScreen({Key? key}) : super(key: key);

  @override
  _DepositListScreen createState() {
    return _DepositListScreen();
  }
}

class _DepositListScreen extends State<DepositListScreen> {
  final Repository<DepositData> repository = DepositRepo();

  List<DepositData> get _deposits => widget._deposits;

  void _createDeposit() async {
    var transfer = await Navigator.pushNamed<DepositData>(
      context,
      CreateDepositScreen.routeName,
    );
    if (transfer != null) {
      await repository.create(transfer);
      setState(() {
        _deposits.add(transfer);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    repository.readAll().then((List<DepositData> data) {
      setState(() {
        _deposits.addAll(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "My deposits",
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset("lib/assets/images/back.png"),
        ),
      ),
      body: ListView.builder(
        itemCount: _deposits.length,
        itemBuilder: (context, index) {
          return Text(_deposits[index].value.toString());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createDeposit,
        child: const Icon(Icons.add),
      ),
    );
  }
}