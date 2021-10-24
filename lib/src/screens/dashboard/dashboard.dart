import 'package:bytebank/src/themes/colors.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "/dashboard";
  const DashboardScreen({Key? key}) : super(key: key);

  Widget buildBigLogo() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Image.asset("lib/assets/images/big_logo.png"),
    );
  }

  Widget buidButton() {
    return Container(
      width: 180,
      height: 130,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ThemeColors.theme[50]!.withOpacity(.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.people,
            size: 40,
            color: ThemeColors.theme[50]!,
          ),
          Material(
            color: Colors.transparent,
            child: Text(
              "Contacts",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColors.theme[50]!.withOpacity(.5),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: buildBigLogo(),
            ),
          ),
          Row(
            children: [buidButton()],
          ),
        ],
      ),
    );
  }
}
