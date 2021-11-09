import 'package:bytebank/src/models/balance_data.dart';
import 'package:bytebank/src/themes/themes.dart';
import 'package:flutter/material.dart';

class BalanceIndicator extends StatefulWidget {
  final BalanceData data;

  const BalanceIndicator({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  BalanceIndicatorState createState() => BalanceIndicatorState();
}

class BalanceIndicatorState extends State<BalanceIndicator> {
  bool _visible = true;

  BalanceData get _data => widget.data;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 2.5),
            child: _visible
                ? Text(
                    _data.toString(),
                    style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        color: ThemeColors.color50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  )
                : Container(
                    height: 24,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5)),
                  ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              _visible = !_visible;
            }),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(
                    _visible ? Icons.visibility : Icons.visibility_off,
                    size: 18,
                    color: ThemeColors.color50.withOpacity(0.5),
                  ),
                ),
                Text(
                  "Current balance",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 10,
                    color: ThemeColors.color50.withOpacity(0.5),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
