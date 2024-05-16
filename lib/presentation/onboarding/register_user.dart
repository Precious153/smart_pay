import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay/core/size_config.dart';
import 'package:smart_pay/presentation/onboarding/set_pin.dart';

import '../../core/constants.dart';
import '../../core/reusable_widgets/app_button.dart';
import '../../core/reusable_widgets/app_text.dart';
import '../../core/reusable_widgets/app_textformfield.dart';
import '../../data/services/register.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key, required this.email});
  final String email;

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}


class _RegisterUserState extends State<RegisterUser> {

  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _userNameController = TextEditingController();
  bool _isObscured = true;
  bool _isActive = false;

  String selectedCountry = '';
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  register() async {
    if (_key.currentState?.validate() ?? false) {
      _key.currentState?.save();
      CXLoader.show(context);
      final result = await RegisterService.register(
        email: widget.email,
        fullName: _fullNameController.text,
        userName: _userNameController.text,
        country: selectedCountry,
        password: _passwordController.text,
        deviceName: 'Mobile',
      );
      if (result!.status == true) {
        CXLoader.hide();
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  SetPin(firstName: result.data!.user!.fullName!,)));
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
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(24),
              right: getProportionateScreenWidth(24),
            ),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                  const ArrowBack(),
                  SizedBox(
                    height: getProportionateScreenHeight(22),
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hey there! tell us a bit\nabout',
                          style: TextStyle(
                            color: Palette.primaryColor,
                            fontSize: 24,
                            fontFamily: FontFamily.sfProDisplay,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: ' yourself',
                          style: TextStyle(
                            color: Palette.textColor1,
                            fontSize: 24,
                            fontFamily: FontFamily.sfProDisplay,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(32),
                  ),
                  BuildInputField(
                      inputController: _fullNameController,
                      inputHintText: 'Full name',
                      keyboardType: TextInputType.name),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  BuildInputField(
                      inputController: _userNameController,
                      inputHintText: 'Username',

                      keyboardType: TextInputType.name),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  GestureDetector(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            flagSize: 25,
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(
                                fontSize: 16, color: Colors.blueGrey),
                            bottomSheetHeight:
                                getProportionateScreenHeight(617),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                            inputDecoration: const InputDecoration(
                              filled: true,
                              fillColor: Palette.fillColor,
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                          onSelect: (Country country) {
                            print('Select country: ${country.countryCode}');
                            setState(() {
                              selectedCountry = country.countryCode;
                            });
                          });
                    },
                    child: Container(
                      height: getProportionateScreenHeight(56),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Palette.fillColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(16),
                          right: getProportionateScreenWidth(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CreateGeneralText(
                              inputText: selectedCountry.isNotEmpty
                                  ? selectedCountry
                                  : 'Select Country',
                              fontSize: 16,
                              fontFamily: FontFamily.sfProDisplay,
                              weight: FontWeight.w400,
                              colorName:  selectedCountry.isNotEmpty?Palette.blackColor:Palette.hintColor,
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Palette.hintColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
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
                    height: getProportionateScreenHeight(24),
                  ),
                  BuildButton(
                    onTap:() {
                      if (_fullNameController.text.isEmpty) {
                        kToastMsgPopUp(context,
                            message: 'Fill in the full name');
                      } else if (selectedCountry.isEmpty) {
                        kToastMsgPopUp(context, message: 'Select Country');
                      } else if (_userNameController.text.isEmpty) {
                        kToastMsgPopUp(context,
                            message: 'Fill in the UserName');
                      } else if (_passwordController.text.isEmpty) {
                        kToastMsgPopUp(context,
                            message: 'Fill in the password');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('')),
                        );
                      } else {
                        register();
                      }
                    },
                    height: getProportionateScreenHeight(56),
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(16),
                    buttonColor:Palette.primaryColor,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
