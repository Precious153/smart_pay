import 'package:flutter/material.dart';
import 'package:smart_pay/core/size_config.dart';
import 'package:smart_pay/presentation/onboarding/sign_in.dart';

import '../../core/constants.dart';
import '../../core/reusable_widgets/app_button.dart';
import '../../core/reusable_widgets/app_text.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key, required this.name});

  final String name;


  @override
  Widget build(BuildContext context) {
    List<String> nameParts = name.split(" ");
    String firstName = nameParts.first;
    SizeConfig.init(context);
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(
          left: getProportionateScreenWidth(24),
          right: getProportionateScreenWidth(24),
        ),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Image.asset('assets/images/Group 162902.png'),
             SizedBox(
               height: getProportionateScreenHeight(22),
             ),
              CreateGeneralText(
               inputText: 'Congratulations, $firstName',
               fontSize: 24,
               fontFamily: FontFamily.sfProDisplay,
               weight: FontWeight.w600,
               colorName: Palette.primaryColor,
             ),
             SizedBox(
               height: getProportionateScreenHeight(12),
             ),
             const CreateGeneralText(
               inputText: 'You’ve completed the onboarding,\nyou can start using',
               fontSize: 14,
               textAlign: TextAlign.center,
               fontFamily: FontFamily.sfProDisplay,
               weight: FontWeight.w400,
               colorName: Palette.textColor,
             ),
             SizedBox(
               height: getProportionateScreenHeight(32),
             ),
             BuildButton(
               onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignIn()));
               },
               height: getProportionateScreenHeight(56),
               width: double.infinity,
               borderRadius: BorderRadius.circular(16),
               buttonColor: Palette.primaryColor,
               child: const Center(
                 child: CreateGeneralText(
                   inputText: 'Continue',
                   fontSize: 16,
                   fontFamily: FontFamily.sfProDisplay,
                   weight: FontWeight.w700,
                   colorName: Palette.backgroundColor,
                 ),
               ),
             ),
             SizedBox(height: getProportionateScreenHeight(20),)
           ],
        ),
      ),
    );
  }
}
