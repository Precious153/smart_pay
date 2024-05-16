import 'package:flutter/material.dart';
import 'package:smart_pay/core/constants.dart';
import 'package:smart_pay/core/size_config.dart';
import 'package:smart_pay/presentation/onboarding/sign_in.dart';
import 'package:smart_pay/presentation/onboarding/verify_email.dart';

import '../../core/reusable_widgets/app_button.dart';
import '../../core/reusable_widgets/app_text.dart';
import '../../core/reusable_widgets/app_textformfield.dart';
import '../../data/services/get_email_token.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isActive = false;


  getEmailToken()async {
    if (_key.currentState?.validate() ?? false) {
      _key.currentState?.save();

      CXLoader.show(context);
      final result = await GetEmailTokenService.getEmailToken(
        email: _emailController.text.trim(),
      );
      if (result!.status == true) {
        CXLoader.hide();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  VerifyEmail(token: result.data!.token!, email:_emailController.text.trim(),)));
      } else {
        CXLoader.hide();
        kToastMsgPopUp(context, message: result.message!);
      }
      CXLoader.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(
              left: getProportionateScreenWidth(24),
              right: getProportionateScreenWidth(24),
            ),
            child:  Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getProportionateScreenHeight(8),),
                  const ArrowBack(),
                  SizedBox(height: getProportionateScreenHeight(22),),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Create a ',
                          style: TextStyle(
                            color: Palette.primaryColor,
                            fontSize: 24,
                            fontFamily: FontFamily.sfProDisplay,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Smartpay',
                          style: TextStyle(
                            color: Palette.textColor1,
                            fontSize: 24,
                            fontFamily: FontFamily.sfProDisplay,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '\naccount',
                          style: TextStyle(color: Palette.primaryColor,
                            fontSize: 24,
                            fontFamily: FontFamily.sfProDisplay,
                            fontWeight: FontWeight.w600,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(32),
                  ),
                  BuildEmailInputField(
                      inputController: _emailController,
                      inputHintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    onChanged: (text) {

                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(24),
                  ),
                BuildButton(
                    onTap: () {
                      if (_emailController.text.isEmpty) {
                        kToastMsgPopUp(context, message: 'Email field is empty');
                      }else {
                        getEmailToken();
                      }
                    },
                    height: getProportionateScreenHeight(56),
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(16),
                    buttonColor: Palette.primaryColor,
                    child: const Center(
                      child: CreateGeneralText(
                        inputText: 'Sign Up',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: getProportionateScreenWidth(142),
                          height: getProportionateScreenHeight(1),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Palette.dividerColor,
                                Palette.dividerColor.withOpacity(1.0),
                              ], // Add your desired colors here
                            ),
                          )),
                      const CreateGeneralText(
                        inputText: 'OR',
                        fontSize: 14,
                        fontFamily: FontFamily.sfProDisplay,
                        weight: FontWeight.w400,
                        colorName: Palette.textColor,
                      ),
                      Container(
                          width: getProportionateScreenWidth(142),
                          height: getProportionateScreenHeight(1),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Palette.dividerColor,
                                Palette.dividerColor.withOpacity(1.0),
                              ], // Add your desired colors here
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(24),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerIcon(image: 'assets/images/search 1.png',),
                      ContainerIcon(image: 'assets/images/path4.png',),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(138),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>
                          const SignIn()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CreateGeneralText(
                          inputText: 'Don’t have an account?',
                          fontSize: 16,
                          fontFamily: FontFamily.sfProDisplay,
                          weight: FontWeight.w400,
                          colorName: Palette.textColor,
                        ),
                        CreateGeneralText(
                          inputText: ' Sign In',
                          fontSize: 16,
                          fontFamily: FontFamily.sfProDisplay,
                          weight: FontWeight.w600,
                          colorName: Palette.textColor1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
