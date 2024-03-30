import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay/core/size_config.dart';

import '../../core/constants.dart';
import '../../core/reusable_widgets/app_text.dart';
import '../onboarding/sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.name, required this.userName, required this.email, required this.country});
  final String name;
  final String userName;
  final String email;
  final String country;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    List<String> nameParts = name.split(" ");
    String firstName = nameParts.first;
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(
            left: getProportionateScreenWidth(24),
            right: getProportionateScreenWidth(24),
            top: getProportionateScreenHeight(24),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    CreateGeneralText(
                      inputText: 'Hello $firstName',
                          fontSize: 14,
                          weight: FontWeight.w600,
                          colorName: Palette.primaryColor,
                          fontFamily:
                          FontFamily.sfProDisplay,
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child:CircleAvatar(
                        radius: 30,
                        backgroundColor:Palette.primaryColor,
                        child:  Center(
                          child: CreateGeneralText(
                            inputText: firstName[0].toUpperCase(),
                                fontSize: 24,
                                weight: FontWeight.w600,
                                colorName: Palette.backgroundColor,
                                fontFamily:
                                FontFamily.sfProDisplay),

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20),),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Palette.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(
                      left: getProportionateScreenWidth(20),
                      right: getProportionateScreenWidth(20),
                      top: getProportionateScreenHeight(20),
                      bottom: getProportionateScreenHeight(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        CreateGeneralText(
                            inputText: 'Fullname : $name',
                            fontSize: 16,
                            weight: FontWeight.w400,
                            colorName: Palette.backgroundColor,
                            fontFamily:
                            FontFamily.sfProDisplay),
                        SizedBox(height: getProportionateScreenHeight(10),),
                        CreateGeneralText(
                            inputText: 'Username : $userName',
                            fontSize: 16,
                            weight: FontWeight.w400,
                            colorName: Palette.backgroundColor,
                            fontFamily:
                            FontFamily.sfProDisplay),
                        SizedBox(height: getProportionateScreenHeight(10),),

                        CreateGeneralText(
                            inputText: 'Email Address : $email',
                            fontSize: 16,
                            weight: FontWeight.w400,
                            colorName: Palette.backgroundColor,
                            fontFamily:
                            FontFamily.sfProDisplay),
                        SizedBox(height: getProportionateScreenHeight(10),),

                        CreateGeneralText(
                            inputText: 'country : $country',
                            fontSize: 16,
                            weight: FontWeight.w400,
                            colorName: Palette.backgroundColor,
                            fontFamily:
                            FontFamily.sfProDisplay),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(40),),
                GestureDetector(
                  onTap: (){ Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const SignIn();
                        },
                      ), (_) => false);

                  },
                  child: CreateGeneralText(
                      inputText: 'logout',
                      fontSize: 16,
                      weight: FontWeight.w400,
                      colorName: Palette.redColor,
                      fontFamily:
                      FontFamily.sfProDisplay),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
