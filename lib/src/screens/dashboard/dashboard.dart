import 'package:bytebank/src/models/balance_data.dart';
import 'package:bytebank/src/screens/dashboard/widgets/balance_indicator.dart';
import 'package:bytebank/src/screens/screens.dart';
import 'package:bytebank/src/themes/colors.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "dashboard";
  const DashboardScreen({Key? key}) : super(key: key);

  Widget buildBigLogo() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Image.asset("lib/assets/images/big_logo.png"),
    );
  }

  Widget buidButton({
    required String pathIcon,
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
                Image.asset(pathIcon),
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
            // icon: Icons.people,
            pathIcon: "lib/assets/images/contacts.png",
            name: "Contacts",
            onClick: () => Navigator.of(context).pushNamed(
              ContactListScreen.routeName,
            ),
          ),
          buidButton(
            // icon: Icons.transfer_within_a_station,
            pathIcon: "lib/assets/images/transfers.png",
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
          const BalanceIndicator(data: BalanceData(value: 1290)),
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
