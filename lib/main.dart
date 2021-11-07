import 'package:bytebank/src/helpers/routes.dart';
import 'package:bytebank/src/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(const ByteBank());
}

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
      initialRoute: Routes.initialRoute,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
