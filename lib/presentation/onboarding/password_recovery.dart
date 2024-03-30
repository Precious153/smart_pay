import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_pay/core/size_config.dart';
import 'package:smart_pay/presentation/onboarding/verify_identity.dart';

import '../../core/constants.dart';
import '../../core/reusable_widgets/app_button.dart';
import '../../core/reusable_widgets/app_text.dart';
import '../../core/reusable_widgets/app_textformfield.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(
              left: getProportionateScreenWidth(24),
              right: getProportionateScreenWidth(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenHeight(35.71),),
                Image.asset('assets/images/icon - illustration.png'),
                SizedBox(height: getProportionateScreenHeight(24,)),
                const CreateGeneralText(
                  inputText: 'Password Recovery',
                  fontSize: 24,
                  fontFamily: FontFamily.sfProDisplay,
                  weight: FontWeight.w600,
                  colorName: Palette.primaryColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(12),
                ),
                const CreateGeneralText(
                  inputText: 'Enter your registered email below to receive password instructions',
                  fontSize: 16,
                  fontFamily: FontFamily.sfProDisplay,
                  weight: FontWeight.w400,
                  colorName: Palette.textColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(32),
                ),
                BuildInputField(
                    inputController: _emailController,
                    inputHintText: 'Email',
                    keyboardType: TextInputType.emailAddress),
                SizedBox(
                  height: getProportionateScreenHeight(82),
                ),
                BuildButton(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const VerifyIdentity()));
                  },
                  height: getProportionateScreenHeight(56),
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(16),
                  buttonColor: Palette.primaryColor,
                  child: const Center(
                    child: CreateGeneralText(
                      inputText: 'Send me email',
                      fontSize: 16,
                      fontFamily: FontFamily.sfProDisplay,
                      weight: FontWeight.w700,
                      colorName: Palette.backgroundColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(32),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
