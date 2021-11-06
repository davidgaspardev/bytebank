import 'dart:async';
import 'dart:io';

import 'package:bytebank/src/helpers/api/bytebank_api.dart';
import 'package:bytebank/src/helpers/format.dart';
import 'package:bytebank/src/helpers/widgets/auth_dialog.dart';
import 'package:bytebank/src/helpers/widgets/info_dialog.dart';
import 'package:bytebank/src/models/contact_data.dart';
import 'package:bytebank/src/models/transaction_data.dart';
import 'package:bytebank/src/screens/contacts/widgets/input_data.dart';
import 'package:bytebank/src/themes/widgets/header.dart';
import 'package:flutter/material.dart';

class TransferByContactScreen extends StatefulWidget {
  static const routeName = "transfer_by_contact";
  final ContactData contact;

  const TransferByContactScreen({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  _TransferByContactScreenState createState() {
    return _TransferByContactScreenState();
  }
}

class _TransferByContactScreenState extends State<TransferByContactScreen> {
  final TextEditingController _value = TextEditingController();

  var _transferInProgress = false;
  var _isLoading = false;

  Widget _buildLoading() {
    return Visibility(
      visible: _isLoading,
      child: Container(
        alignment: Alignment.center,
        color: Colors.black.withOpacity(0.4),
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: Header(
            title: "New transfer",
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Image.asset("lib/assets/images/back.png"),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.contact.fullname),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          showAsBinary(widget.contact.accountNumber),
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          widget.contact.accountNumber.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                InputData(
                  label: "Value to transfer",
                  placeholder: "50.00",
                  controller: _value,
                  autofocus: true,
                  ketboardType: TextInputType.number,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                ),
                OutlinedButton(
                  onPressed: () async {
                    if (!_transferInProgress) {
                      _transferInProgress = true;
                      final value = double.tryParse(_value.text);

                      if (value != null) {
                        String? password = await showDialog<String>(
                          context: context,
                          builder: (context) => const AuthDialog(),
                        );

                        try {
                          if (password == null || password.isEmpty) {
                            throw const FormatException(
                              "it is necessary to inform the password",
                            );
                          }

                          setState(() {
                            _isLoading = true;
                          });

                          await ByteBankAPI().toTransfer(
                            TransactionData(
                              value: value,
                              contact: widget.contact,
                              dateTime: DateTime.now(),
                            ),
                            password: password,
                          );

                          await _showSuccessfulMessage(context);
                          return Navigator.pop(context);
                        }

                        /** Handling error */
                        on Exception catch (e) {
                          String? message;
                          if (e is FormatException) {
                            message = e.message;
                          } else if (e is HttpException) {
                            message = e.message;
                          } else if (e is TimeoutException) {
                            message = 'timeout submitting the transaction';
                          }
                          await _showFailureMessage(context, message: message);
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      }
                      _transferInProgress = false;
                    }
                  },
                  child: const Text("tranfer"),
                ),
              ],
            ),
          ),
        ),
        _buildLoading()
      ],
    );
  }

  Future<void> _showSuccessfulMessage(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => const SuccessDialog(
        message: "successful transaction",
      ),
    );
  }

  Future<void> _showFailureMessage(
    BuildContext context, {
    String? message,
  }) async {
    message ??= 'unknown error';
    await showDialog(
      context: context,
      builder: (context) => FailureDialog(
        message: message!,
      ),
    );
  }
}
