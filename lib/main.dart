import 'package:bytebank/src/screens/home/home.dart';
import 'package:bytebank/src/themes/colors.dart';
import 'package:bytebank/src/themes/fonts.dart';
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: ThemeFonts.poppins,
        primarySwatch: MaterialColor(ThemeColors.theme[500]!.value, ThemeColors.theme),
      ),
      home: HomeScreen(),
    );
  }
}