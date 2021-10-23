import 'package:flutter/material.dart';

class Edit extends StatelessWidget {

  final TextEditingController? _controller;
  final String? label;
  final String? hint;
  final Icon? icon;

  const Edit({
    Key? key,
    TextEditingController? controller,
    this.label,
    this.hint,
    this.icon
  }): _controller = controller, super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: const TextStyle(
        fontSize: 20
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        icon: icon
      ),
    );
  }
}