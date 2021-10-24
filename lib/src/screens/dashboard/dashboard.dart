import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "/dashboard";
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container()
        ],
      ),
    );
  }
}