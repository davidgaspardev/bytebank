import 'package:flutter/material.dart';

class InfoDialog extends AlertDialog {
  InfoDialog({
    Key? key,
    required String title,
    required String message,
    required String buttonText,
    required Function() buttonAction,
    required Icon icon,
  }) : super(
          key: key,
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: icon,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: buttonAction,
              child: Text(buttonText),
            ),
          ],
        );
}

class FailureDialog extends StatelessWidget {
  final String message;
  const FailureDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoDialog(
      title: "Failure",
      message: message,
      buttonText: "OK",
      buttonAction: () => Navigator.pop(context),
      icon: const Icon(
        Icons.sms_failed_rounded,
        color: Colors.red,
        size: 60,
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String message;
  const SuccessDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoDialog(
      title: "Success",
      message: message,
      buttonText: "OK",
      buttonAction: () => Navigator.pop(context),
      icon: const Icon(
        Icons.transfer_within_a_station_rounded,
        color: Colors.green,
        size: 60,
      ),
    );
  }
}
