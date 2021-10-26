import 'package:bytebank/src/models/models.dart';
import 'package:bytebank/src/screens/contacts/add_contact.dart';
import 'package:bytebank/src/screens/screens.dart';
import 'package:bytebank/src/screens/transfers/add_transfer.dart';
import 'package:bytebank/src/screens/transfers/transfer_list.dart';
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
      initialRoute: DashboardScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
          case TransferListScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => TransferListScreen(),
            );
          case AddTransferScreen.routeName:
            return MaterialPageRoute<TransferData>(
              builder: (context) => AddTransferScreen(),
            );
          case DashboardScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
            );
          case ContactListScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => ContactListScreen(),
            );
          case AddContactScreen.routeName:
            return MaterialPageRoute<ContactData>(
              builder: (context) => AddContactScreen(),
            );
          default:
            throw Exception("Invalid route name: ${settings.name}");
        }
      },
    );
  }
}
