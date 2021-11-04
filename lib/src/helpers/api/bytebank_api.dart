import 'dart:convert';

import 'package:bytebank/src/models/transaction_data.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class ByteBankAPI {
  ByteBankAPI._internal();
  Map<String, dynamic>? configApi;

  static final ByteBankAPI _singleton = ByteBankAPI._internal();

  factory ByteBankAPI() {
    return _singleton;
  }

  Future<TransactionData> toTransfer(TransactionData transaction) async {
    configApi ??= jsonDecode(
      await rootBundle.loadString("lib/assets/config/bytebank-api.json"),
    );

    var auth = base64Encode(utf8.encode(
        "${configApi!["auth"]["username"]}:${configApi!["auth"]["password"]}"));

    var response = await post(
      Uri(
        scheme: configApi!["scheme"],
        host: configApi!["host"],
        port: configApi!["port"],
        path: "transactions",
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Basic $auth"
      },
      body: transaction.toString(),
    );

    if (response.statusCode != 200) {
      throw Exception([
        "Status code: ${response.statusCode}",
        "Response: ${response.body}"
      ]);
    }

    return TransactionData.fromMap(jsonDecode(response.body));
  }

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

    for (var map in List<dynamic>.from(jsonDecode(response.body))) {
      result.add(TransactionData.fromMap(map));
    }

    return result;
  }
}
