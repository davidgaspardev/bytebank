import 'package:bytebank/src/themes/themes.dart';
import 'package:flutter/material.dart';

enum MessageType { warning, error }

class CenteredMessage extends StatelessWidget {
  final MessageType type;
  final String message;

  const CenteredMessage({
    Key? key,
    required this.message,
    this.type = MessageType.warning,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          () {
            switch (type) {
              case MessageType.warning:
                return const Icon(
                  Icons.warning,
                  color: ThemeColors.color50,
                  size: 80,
                );
              case MessageType.error:
                return const Icon(
                  Icons.error,
                  color: ThemeColors.color50,
                  size: 80,
                );
            }
          }(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
