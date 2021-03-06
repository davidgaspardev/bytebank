import 'dart:async';

import 'package:bytebank/src/helpers/routes.dart';
import 'package:bytebank/src/models/balance_data.dart';
import 'package:bytebank/src/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  if (!kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    // Pass all uncaught errors from the framework to Crashlytics.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    FirebaseCrashlytics.instance.setUserIdentifier("user#894783");
  }

  runZonedGuarded<Future<void>>(() async {
    runApp(const ByteBank());
  }, FirebaseCrashlytics.instance.recordError);
}

class ByteBank extends StatelessWidget {
  const ByteBank({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BalanceData(value: 1280.00),
      child: buidApp(),
    );
  }

  Widget buidApp() {
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
