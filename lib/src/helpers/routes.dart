import 'package:bytebank/src/models/models.dart';
import 'package:bytebank/src/screens/screens.dart';
import 'package:flutter/material.dart';

class Routes {
  static const initialRoute = DashboardScreen.routeName;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
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
  }
}
