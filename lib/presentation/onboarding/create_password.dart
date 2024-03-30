import 'package:flutter/material.dart';
import 'package:smart_pay/core/constants.dart';
import 'package:smart_pay/core/size_config.dart';

import '../../core/reusable_widgets/app_button.dart';
import '../../core/reusable_widgets/app_text.dart';
import '../../core/reusable_widgets/app_textformfield.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  bool _isObscured = true;
  bool _isObscured1 = true;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Scaffold(
      body: SafeArea(
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
                inputText: 'Create New Password',
                fontSize: 24,
                fontFamily: FontFamily.sfProDisplay,
                weight: FontWeight.w600,
                colorName: Palette.primaryColor,
              ),
              SizedBox(
                height: getProportionateScreenHeight(12),
              ),
              const CreateGeneralText(
                inputText: 'Please enter a new password below different from the previous password',
                fontSize: 16,
                fontFamily: FontFamily.sfProDisplay,
                weight: FontWeight.w400,
                colorName: Palette.textColor,
              ),
              SizedBox(
                height: getProportionateScreenHeight(32),
              ),
              BuildPasswordInputField(
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
                height: getProportionateScreenHeight(16),
              ),
              BuildPasswordInputFieldWithoutValidation(
                inputController: _confirmPasswordController,
                inputHintText: 'Confirm Password',
                isObscured: _isObscured1,
                onPressed: () {
                  setState(() {
                    _isObscured1 = !_isObscured1;
                  });
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(331),
              ),
              BuildButton(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreatePassword()));
                },
                height: getProportionateScreenHeight(56),
                width: double.infinity,
                borderRadius: BorderRadius.circular(16),
                buttonColor: Palette.primaryColor,
                child: const Center(
                  child: CreateGeneralText(
                    inputText: 'Create new password',
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
    );
  }
}
