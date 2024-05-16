import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smart_pay/core/constants.dart';
import 'package:smart_pay/core/size_config.dart';
import 'package:smart_pay/presentation/onboarding/register_user.dart';

import '../../core/reusable_widgets/app_button.dart';
import '../../core/reusable_widgets/app_text.dart';
import '../../data/services/verify_email.dart';
// verify email class
class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key, required this.token, required this.email});

  final String token;
  final String email;

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}
class _VerifyEmailState extends State<VerifyEmail> {
  final GlobalKey<FormState> _emailOtpPinKey = GlobalKey<FormState>();
  final _emailOtpController = TextEditingController();
  String email ='';
  bool _isActive = false;


  verifyEmail()async {
    if (_emailOtpPinKey.currentState?.validate() ?? false) {
      _emailOtpPinKey.currentState?.save();

      CXLoader.show(context);
      final result = await VerifyEmailService.verifyEmail(
        email: widget.email, token: _emailOtpController.text,
      );
      if (result!.status == true) {
        CXLoader.hide();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  RegisterUser(email: widget.email,)));
      } else {
        CXLoader.hide();
        kToastMsgPopUp(context, message: result.message!);
      }
      CXLoader.hide();
    }
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    List<String> parts = widget.email.split('@');
    if (parts.length == 2) {
      String userEmail = parts[0];
      String domain = parts[1];
      String maskedUserEmail = '*' * userEmail.length;
      String maskedEmail = '$maskedUserEmail@$domain';
      setState(() {
        email = maskedEmail;
      });
    } else {
      print('Invalid email address');
    }
    return  Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(
              left: getProportionateScreenWidth(24),
              right: getProportionateScreenWidth(24),
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenHeight(8),),
                const ArrowBack(),
                SizedBox(height: getProportionateScreenHeight(32),),
                const CreateGeneralText(
                  inputText: 'Verify it’s you',
                  fontSize: 24,
                  fontFamily: FontFamily.sfProDisplay,
                  weight: FontWeight.w600,
                  colorName: Palette.primaryColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                RichText(
                  text:  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'We send a code to ',
                        style: TextStyle(
                          color: Palette.textColor,
                          fontSize: 16,
                          fontFamily: FontFamily.sfProDisplay,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: email ,
                        style: const TextStyle(
                          color: Palette.primaryColor,
                          fontSize: 16,
                          fontFamily: FontFamily.sfProDisplay,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(
                        text: ' Enter it here to verify your identity',
                        style: TextStyle(color: Palette.textColor,
                          fontSize: 16,
                          fontFamily: FontFamily.sfProDisplay,
                          fontWeight: FontWeight.w400,),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(32),
                ),
                CreateGeneralText(
                  inputText: widget.token,
                  fontSize: 24,
                  fontFamily: FontFamily.sfProDisplay,
                  weight: FontWeight.w600,
                  colorName: Palette.primaryColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(32),
                ),

                Form(
                  key: _emailOtpPinKey,
                  child: Padding(
                    padding:  EdgeInsets.only(
                      left: getProportionateScreenWidth(8),
                    ),
                    child: PinCodeTextField(

                      autovalidateMode: AutovalidateMode.disabled,
                      controller: _emailOtpController,
                      keyboardType: TextInputType.number,
                      appContext: context,
                      length: 5,

                      textStyle: const TextStyle(
                          color: Palette.primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          fontFamily: FontFamily.sfProDisplay
                      ),
                       animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        activeColor: Palette.fillColor,
                         inactiveColor:Palette.fillColor,
                        shape: PinCodeFieldShape.box,

                        borderRadius: BorderRadius.circular(12),
                        fieldHeight: 56,
                        fieldWidth: 56,
                        // activeFillColor: Palette.fillColor,
                      ),
                      cursorColor: Palette.blackColor,
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
                SizedBox(
                  height: getProportionateScreenHeight(32),
                ),
                const Center(
                  child: CreateGeneralText(
                    textAlign: TextAlign.center,
                    inputText: 'Resend Code 30 secs',
                    fontSize: 16,
                    fontFamily: FontFamily.sfProDisplay,
                    weight: FontWeight.w700,
                    colorName: Palette.resendTextColor,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(67),
                ),
                BuildButton(
                  onTap: () {
                    if (_emailOtpController.text.isEmpty) {
                      kToastMsgPopUp(context, message: 'Otp field is empty');
                    }else {
                      verifyEmail();
                    }
                  },
                  height: getProportionateScreenHeight(56),
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(16),
                  buttonColor: Palette.primaryColor,
                  child: const Center(
                    child: CreateGeneralText(
                      inputText: 'Confirm',
                      fontSize: 16,
                      fontFamily: FontFamily.sfProDisplay,
                      weight: FontWeight.w700,
                      colorName: Palette.backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
