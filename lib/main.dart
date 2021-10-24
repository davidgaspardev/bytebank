import 'package:bytebank/src/screens/screens.dart';
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
        fontFamily: ThemeFonts.poppins,
        primarySwatch:
            MaterialColor(ThemeColors.theme[500]!.value, ThemeColors.theme),
      ),
      initialRoute: DashboardScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
          case HomeScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => HomeScreen(),
            );
          case TransferScreen.routeName:
            return MaterialPageRoute<TransferData>(
              builder: (context) => TransferScreen(),
            );
          case DashboardScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
            );
          case ContactsScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => const ContactsScreen(),
            );
          default:
            throw Exception("Invalid route name: ${settings.name}");
        }
      },
    );
  }
}
