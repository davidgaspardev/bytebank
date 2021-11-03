import 'dart:convert';

import 'package:bytebank/src/models/transaction_data.dart';
import 'package:bytebank/src/models/transfer_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class ByteBankAPI {
  ByteBankAPI._internal();
  Map<String, dynamic>? configApi;

  static final ByteBankAPI _singleton = ByteBankAPI._internal();

  factory ByteBankAPI() {
    return _singleton;
  }

  Future<void> toTransfer(TransferData transfer) async {}

  Future<List<TransactionData>> get findAllTransfers async {
    final List<TransactionData> result = [];

    configApi ??= jsonDecode(
      await rootBundle.loadString("lib/assets/config/bytebank-api.json"),
    );

    var response = await get(
      Uri(
        scheme: configApi!["scheme"],
        host: configApi!["host"],
        port: configApi!["port"],
        path: "transactions",
      ),
    );

    // debugPrint("response: $body");
    for (var map in List<dynamic>.from(jsonDecode(response.body))) {
      result.add(TransactionData.fromMap(map));
    }

    for (var item in result) {
      debugPrint(item.toString());
    }

    return result;
  }
}
