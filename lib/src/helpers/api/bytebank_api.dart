import 'dart:convert';
import 'dart:io';

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

  Future<TransactionData> toTransfer(
    TransactionData transaction, {
    required String password,
  }) async {
    configApi ??= jsonDecode(
      await rootBundle.loadString("lib/assets/config/bytebank-api.json"),
    );

    var auth = base64Encode(utf8.encode(
        "${configApi!["auth"]["username"]}:${configApi!["auth"]["password"]}"));

    var uri = Uri(
      scheme: configApi!["scheme"],
      host: configApi!["host"],
      port: configApi!["port"],
      path: "transactions",
    );
    var response = await post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Basic $auth",
        "password": password
      },
      body: transaction.toString(),
    );

    if (response.statusCode != HttpStatus.created) {
      throw HttpException(
        _statusCodeErrorMessage[response.statusCode]!,
        uri: uri,
      );
    }

    return TransactionData.fromMap(jsonDecode(response.body));
  }

  Future<List<TransactionData>> get findAllTransfers async {
    final List<TransactionData> result = [];

    configApi ??= jsonDecode(
      await rootBundle.loadString("lib/assets/config/bytebank-api.json"),
    );

    var uri = Uri(
      scheme: configApi!["scheme"],
      host: configApi!["host"],
      port: configApi!["port"],
      path: "transactions",
    );
    var response = await get(uri);

    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(
        _statusCodeErrorMessage[response.statusCode]!,
        uri: uri,
      );
    }

    for (var map in List<dynamic>.from(jsonDecode(response.body))) {
      result.add(TransactionData.fromMap(map));
    }

    return result;
  }

  final Map<int, String> _statusCodeErrorMessage = {
    400: "there was an error submitting transaction",
    401: "you are unauthorized"
  };
}
