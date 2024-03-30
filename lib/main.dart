import 'package:flutter/material.dart';
import 'package:smart_pay/core/constants.dart';
import 'package:smart_pay/presentation/onboarding/splash_screen.dart';

import 'data/storage/storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ProgressStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
