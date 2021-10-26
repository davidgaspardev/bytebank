import 'package:flutter/material.dart';

class InputData extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final EdgeInsets? margin;
  final TextInputType? ketboardType;
  final bool autofocus;

  const InputData({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.controller,
    this.ketboardType,
    this.margin,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextField(
        controller: controller,
        keyboardType: ketboardType,
        autofocus: autofocus,
        style: const TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          // isCollapsed: true,
          labelText: label,
          hintText: placeholder,
        ),
      ),
    );
  }
}
