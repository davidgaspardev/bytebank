import 'package:bytebank/src/helpers/routes.dart';
import 'package:bytebank/src/themes/themes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ByteBank());

class ByteBank extends StatelessWidget {
  const ByteBank({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteBank',
      theme: ThemeData(
        fontFamily: ThemeFonts.poppins,
        primarySwatch: ThemeColors.primarySwatch,
      ),
      initialRoute: Routes.initialRoute,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
