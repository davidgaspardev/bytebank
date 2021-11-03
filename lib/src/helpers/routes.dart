import 'package:bytebank/src/models/models.dart';
import 'package:bytebank/src/models/transaction_data.dart';
import 'package:bytebank/src/screens/contacts/transfer_by_contact.dart';
import 'package:bytebank/src/screens/screens.dart';
import 'package:bytebank/src/screens/transactions/transaction.dart';
import 'package:bytebank/src/screens/transactions/transactions_list.dart';
import 'package:flutter/material.dart';

class Routes {
  static const initialRoute = DashboardScreen.routeName;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case TransferListScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const TransactionsListScreen(),
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
      case TransferByContactScreen.routeName:
        if (arguments is ContactData) {
          return MaterialPageRoute<ContactData>(
            builder: (context) => TransferByContactScreen(contact: arguments),
          );
        }
        throw Exception("Invalid route arguments: $arguments");
      case TransactionScreen.routeName:
        if (arguments is TransactionData) {
          return MaterialPageRoute<TransactionData>(
            builder: (context) => TransactionScreen(data: arguments),
          );
        }
        throw Exception("Invalid route arguments: $arguments");
      default:
        throw Exception("Invalid route name: ${settings.name}");
    }
  }
}
