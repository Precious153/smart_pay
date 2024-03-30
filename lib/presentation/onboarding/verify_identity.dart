import 'package:flutter/material.dart';
import 'package:smart_pay/core/size_config.dart';

import '../../core/constants.dart';
import '../../core/reusable_widgets/app_button.dart';
import '../../core/reusable_widgets/app_text.dart';
import 'create_password.dart';

class VerifyIdentity extends StatefulWidget {
  const VerifyIdentity({super.key});

  @override
  State<VerifyIdentity> createState() => _VerifyIdentityState();
}

class _VerifyIdentityState extends State<VerifyIdentity> {
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
                  inputText: 'Verify your identity',
                  fontSize: 24,
                  fontFamily: FontFamily.sfProDisplay,
                  weight: FontWeight.w600,
                  colorName: Palette.primaryColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(12),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Where would you like ',
                        style: TextStyle(
                          color: Palette.textColor,
                          fontSize: 16,
                          fontFamily: FontFamily.sfProDisplay,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Smartpay',
                        style: TextStyle(
                          color: Palette.textColor1,
                          fontSize: 16,
                          fontFamily: FontFamily.sfProDisplay,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: ' to send your security code?',
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

                BuildButton(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const VerifyIdentity()));
                  },
                  height: getProportionateScreenHeight(88),
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(16),
                  buttonColor: Palette.fillColor,
                  child: Padding(
                    padding:  EdgeInsets.only(
                      left: getProportionateScreenWidth(16),
                      right: getProportionateScreenWidth(16),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle,color: Palette.textColor1,size: 24,),
                        SizedBox(width: getProportionateScreenWidth(18),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CreateGeneralText(
                              inputText: 'Email',
                              fontSize: 16,
                              fontFamily: FontFamily.sfProDisplay,
                              weight: FontWeight.w600,
                              colorName: Palette.primaryColor,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(4),
                            ),
                            const CreateGeneralText(
                              inputText: 'A*******@mail.com',
                              fontSize: 12,
                              fontFamily: FontFamily.sfProDisplay,
                              weight: FontWeight.w500,
                              colorName: Palette.textColor,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.email_outlined,color: Palette.hintColor,size: 24,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(315),),
                BuildButton(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreatePassword()));
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
