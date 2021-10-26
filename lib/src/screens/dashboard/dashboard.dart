import 'package:bytebank/src/screens/screens.dart';
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

  Widget buidButton({
    required IconData icon,
    required String name,
    required Function() onClick,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 10,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        color: ThemeColors.theme[50]!.withOpacity(.1),
        child: InkWell(
          onTap: onClick,
          child: Container(
            width: 180,
            height: 130,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: ThemeColors.theme[50]!,
                ),
                Material(
                  color: Colors.transparent,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.theme[50]!.withOpacity(.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSlidingMenu(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          buidButton(
            icon: Icons.people,
            name: "Contacts",
            onClick: () => Navigator.of(context).pushNamed(
              ContactListScreen.routeName,
            ),
          ),
          buidButton(
            icon: Icons.transfer_within_a_station,
            name: "Transfers",
            onClick: () => Navigator.of(context).pushNamed(
              TransferListScreen.routeName,
            ),
          ),
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
          buildSlidingMenu(context),
        ],
      ),
    );
  }
}
