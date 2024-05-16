import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smart_pay/core/size_config.dart';

import '../../core/constants.dart';
import '../../core/reusable_widgets/app_button.dart';
import '../../core/reusable_widgets/app_text.dart';
import 'congrats_screen.dart';

class SetPin extends StatefulWidget {
  const SetPin({super.key, required this.firstName});

  final String firstName;

  @override
  State<SetPin> createState() => _SetPinState();
}

class _SetPinState extends State<SetPin> {
  final GlobalKey<FormState> _pinPinKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
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
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                const ArrowBack(),
                SizedBox(
                  height: getProportionateScreenHeight(24),
                ),
                const CreateGeneralText(
                  inputText: 'Set your PIN code',
                  fontSize: 24,
                  fontFamily: FontFamily.sfProDisplay,
                  weight: FontWeight.w600,
                  colorName: Palette.primaryColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                const CreateGeneralText(
                  inputText: 'We use state-of-the-art security measures to protect your information at all times',
                  fontSize: 16,
                  fontFamily: FontFamily.sfProDisplay,
                  weight: FontWeight.w400,
                  colorName: Palette.textColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(32),
                ),
                Form(
                  key: _pinPinKey,
                  child: Padding(
                    padding:  EdgeInsets.only(
                      left: getProportionateScreenWidth(8),
                    ),
                    child: PinCodeTextField(
                      autovalidateMode: AutovalidateMode.disabled,
                      controller: _pinController,
                      keyboardType: TextInputType.number,
                      appContext: context,
                      length: 5,
                      obscureText: true,
                      obscuringCharacter: '⚫',
                      textStyle: const TextStyle(
                          color: Palette.textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: FontFamily.sfProDisplay
                      ),
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        activeColor: Palette.primaryColor,
                        inactiveColor: Palette.primaryColor,
                        shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(12),
                        fieldHeight: 56,
                        fieldWidth: 56,
                      ),
                      cursorColor: Palette.blackColor,
                      // enableActiveFill: true,
                      animationDuration: const Duration(milliseconds: 300),
                      validator: (v) {
                        if (v!.length < 5) {
                          return "Enter the 5 digit PIN sent to your mail";
                        } else {
                          return null;
                        }
                      },
                      onCompleted: (v) {
                      },
                      onChanged: (value) {
                        setState(() {
                        });
                      },
                      beforeTextPaste: (text) {

                        return true;
                      },
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(123),),
                BuildButton(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> CongratsScreen(name: widget.firstName,)));
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
                SizedBox(height: getProportionateScreenHeight(20),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
