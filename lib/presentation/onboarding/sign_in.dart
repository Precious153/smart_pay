import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_pay/core/constants.dart';
import 'package:smart_pay/core/size_config.dart';
import 'package:smart_pay/presentation/onboarding/password_recovery.dart';
import 'package:smart_pay/presentation/onboarding/set_pin.dart';
import 'package:smart_pay/presentation/onboarding/sign_up.dart';

import '../../core/reusable_widgets/app_button.dart';
import '../../core/reusable_widgets/app_text.dart';
import '../../core/reusable_widgets/app_textformfield.dart';
import '../../data/services/sign_in.dart';
import '../../data/storage/storage.dart';
import '../home_page/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isObscured = true;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  login() async {
    if (_key.currentState?.validate() ?? false) {
      _key.currentState?.save();

      CXLoader.show(context);
      final result = await LoginService.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        deviceName: 'Mobile',
      );
      if (result!.status == true) {
        CXLoader.hide();
        var data = result.data!.user;
        ProgressStorage.store(true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
         HomePage(name: data!.fullName!,
           userName: data.username!,
           email: data.email!,
           country: data.country!,)));
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(24),
            right: getProportionateScreenWidth(24),
          ),
          child: SafeArea(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                   Container(
                    height: getProportionateScreenHeight(40),
                    width: getProportionateScreenWidth(40),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Palette.dividerColor
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,color: Palette.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(32),
                  ),
                  const CreateGeneralText(
                    inputText: 'Hi There! 👋',
                    fontSize: 24,
                    fontFamily: FontFamily.sfProDisplay,
                    weight: FontWeight.w600,
                    colorName: Palette.primaryColor,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                  const CreateGeneralText(
                    inputText: 'Welcome back, Sign in to your account',
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
                    height: getProportionateScreenHeight(16),
                  ),
                  BuildPasswordInputFieldWithoutValidation(
                    inputController: _passwordController,
                    inputHintText: 'Password',
                    isObscured: _isObscured,
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(24),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const PasswordRecovery()));
                    },
                    child: const CreateGeneralText(
                        inputText: 'Forgot Password?',
                        fontSize: 16,
                        fontFamily: FontFamily.sfProDisplay,
                        weight: FontWeight.w600,
                        colorName: Palette.textColor1),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(24),
                  ),
                  BuildButton(
                    onTap: () {
                      login();
                    },
                    height: getProportionateScreenHeight(56),
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(16),
                    buttonColor: Palette.primaryColor,
                    child: const Center(
                      child: CreateGeneralText(
                        inputText: 'Sign In',
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
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
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
                          inputText: ' Sign Up',
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

