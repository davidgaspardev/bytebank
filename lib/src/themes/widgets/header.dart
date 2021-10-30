import 'package:bytebank/src/themes/themes.dart';
import 'package:flutter/material.dart';

class Header extends AppBar {
  Header({
    Key? key,
    Widget? leading,
    required String title,
  }) : super(
          key: key,
          leading: leading,
          title: Text(
            title,
            style: const TextStyle(
              color: ThemeColors.color50,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          shape: const Border(
            bottom: BorderSide(
              width: 1,
              color: Color(0xFFD9D9D9),
            ),
          ),
        );
}
