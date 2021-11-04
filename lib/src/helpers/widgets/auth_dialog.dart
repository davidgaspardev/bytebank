import 'package:flutter/material.dart';

class AuthDialog extends StatefulWidget {
  const AuthDialog({Key? key}) : super(key: key);

  @override
  State<AuthDialog> createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {
  final TextEditingController _passwordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Authenticate"),
      content: SingleChildScrollView(
        child: TextField(
          obscureText: true,
          maxLength: 4,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          autofocus: true,
          showCursor: false,
          controller: _passwordControl,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "1010",
            counterText: "",
            isDense: true,
          ),
          style: const TextStyle(
            fontSize: 40,
            letterSpacing: 32,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _passwordControl.text),
          child: const Text("Confirm"),
        ),
      ],
    );
  }
}
