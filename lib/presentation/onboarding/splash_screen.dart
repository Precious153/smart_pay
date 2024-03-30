import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_pay/core/constants.dart';
import 'package:smart_pay/core/size_config.dart';
import 'package:smart_pay/presentation/onboarding/sign_in.dart';

import '../../data/storage/storage.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>ProgressStorage.retrieve()
                ? const SignIn() : const OnBoarding(),
        ),
    ),
      );
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
          ],
        ),
      ),
    );
  }
}
