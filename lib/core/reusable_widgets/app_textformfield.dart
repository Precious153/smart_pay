import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';
// TextFormField
class BuildInputField extends StatefulWidget {
  BuildInputField(
      {super.key, required this.inputController,
        required this.inputHintText,
        required this.keyboardType,
        this.onChanged,
        this.maxLength,
        this.enabled,
        this.suffix,
        this.onTap,
        this.readOnly = false,
        bool? isObscured,
        Function()? onPressed,
      this.onFieldSubmitted});

  TextEditingController inputController;
  String inputHintText;
  TextInputType keyboardType;
  int? maxLength;
  bool? enabled;
  void Function(String)? onChanged;
  void Function()? onTap;
  Widget? suffix;
  final bool readOnly;
  void Function(String)? onFieldSubmitted;

  @override
  State<BuildInputField> createState() => _BuildInputFieldState();
}
class _BuildInputFieldState extends State<BuildInputField> {
  bool showHint = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: TextFormField(
            readOnly: widget.readOnly,
            autofocus: false,
            controller: widget.inputController,
            keyboardType: widget.keyboardType,
            cursorColor: Palette.blackColor,
            maxLength: widget.maxLength,
            enabled: widget.enabled,
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: Palette.fillColor,
              suffix: Padding(
                padding:
                EdgeInsets.only(
                    right: getProportionateScreenWidth(16)),
                child: widget.suffix,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              contentPadding: EdgeInsets.only(
                top: getProportionateScreenHeight(16),
                bottom: getProportionateScreenHeight(16),
                left: getProportionateScreenWidth(16),
              ),
              hintText: widget.inputHintText,
              hintStyle: TextStyle(
                  fontFamily: FontFamily.sfProDisplay,
                  fontSize: getProportionateScreenWidth(16),
                  fontWeight: FontWeight.w400,
                  color: Palette.hintColor),
            ),
            validator: (value) =>
            value!.isEmpty ? 'Enter ${widget.inputHintText}' : null,
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  showHint = false;
                } else {
                  showHint = true;
                }
              });
            },
            onFieldSubmitted: widget.onFieldSubmitted,
            onTap: widget.onTap,
          ),
        ),
      ],
    );
  }
}


class BuildEmailInputField extends StatefulWidget {
  BuildEmailInputField(
      {super.key, required this.inputController,
        required this.inputHintText,
        required this.keyboardType,
        this.onChanged,
        this.suffix,
        this.onTap,
        this.onFieldSubmitted,
      });

  TextEditingController inputController;
  String inputHintText;
  TextInputType keyboardType;
  void Function(String)? onChanged;
  void Function()? onTap;
  Widget? suffix;
  void Function(String)? onFieldSubmitted;

  @override
  State<BuildEmailInputField> createState() => _BuildEmailInputFieldState();
}

class _BuildEmailInputFieldState extends State<BuildEmailInputField> {
  bool showHint = false;

  String? emailValidator(String? value) {
    final String val = value!.trim();
    final RegExp reg =
    RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-.]+$");
    if (!reg.hasMatch(val)) {
      return 'Invalid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: TextFormField(
            controller: widget.inputController,
            keyboardType: widget.keyboardType,
            cursorColor: Palette.blackColor,
            autocorrect: false,
            autofillHints: const [AutofillHints.email],
            autovalidateMode: AutovalidateMode.disabled,
            decoration: InputDecoration(
              filled: true,
              fillColor: Palette.fillColor,
              suffix: Padding(
                padding:
                EdgeInsets.only(right:
                getProportionateScreenWidth(16)),
                child: widget.suffix,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              contentPadding: EdgeInsets.only(
                top: getProportionateScreenHeight(16),
                bottom: getProportionateScreenHeight(16),
                left: getProportionateScreenWidth(16),
              ),
              hintText: widget.inputHintText,
              hintStyle: TextStyle(
                  fontFamily: FontFamily.sfProDisplay,
                  fontSize: getProportionateScreenWidth(16),
                  fontWeight: FontWeight.w400,
                  color: Palette.hintColor),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter Email';
              } else {
                String? validationResult = emailValidator(value);
                if (validationResult != null) {
                  return validationResult;
                }
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  showHint = false;
                } else {
                  showHint = true;
                }
              });
            },
            onFieldSubmitted: widget.onFieldSubmitted,
            onTap: widget.onTap,
          ),
        ),
      ],
    );
  }
}


class BuildPasswordInputField extends StatefulWidget {
  BuildPasswordInputField(
      {required this.inputController,
        required this.inputHintText,
        required this.isObscured,
        required this.onPressed,
        this.onFieldSubmitted,
        this.onChanged,
        this.onTap});

  TextEditingController inputController;
  String inputHintText;
  bool isObscured;
  String? Function(String?)? validator;
  void Function(String)? onFieldSubmitted;
  void Function(String)? onChanged;
  void Function()? onTap;
  VoidCallback onPressed;

  @override
  State<BuildPasswordInputField> createState() =>
      _BuildPasswordInputFieldState();
}

class _BuildPasswordInputFieldState extends State<BuildPasswordInputField> {
  bool showHint = false;
  RegExp passwordvalid = RegExp(r'(?=.*[a-z])');
  RegExp passwordvalid2 = RegExp(r'(?=.*[A-Z])');
  RegExp passwordvalid3 = RegExp(r'(?=.*[0-9])');
  RegExp passwordvalid4 = RegExp(r'(?=.*[^A-Za-z0-9])');
  RegExp passwordvalid5 = RegExp(r'(?=.{8,})');

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (passwordvalid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword2(String pass) {
    String password = pass.trim();
    if (passwordvalid2.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword3(String pass) {
    String _password = pass.trim();
    if (passwordvalid3.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword4(String pass) {
    String _password = pass.trim();
    if (passwordvalid4.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword5(String pass) {
    String _password = pass.trim();
    if (passwordvalid5.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.inputController,
          autofocus: false,
          obscureText: widget.isObscured ? true : false,
          cursorColor: Palette.blackColor,
          keyboardType: TextInputType.text,
          autocorrect: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Palette.fillColor,
            suffix: GestureDetector(
              onTap: widget.onPressed,
              child: Padding(
                padding:
                EdgeInsets.only(right:
                getProportionateScreenWidth(16)),
                child: Icon(
                  widget.isObscured ? Icons.visibility : Icons.visibility_off,
                  color: Palette.textColor,
                  size: getProportionateScreenWidth(22),
                ),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            hintText: widget.inputHintText,
            contentPadding: EdgeInsets.only(
              top: getProportionateScreenHeight(16),
              bottom: getProportionateScreenHeight(16),
              left: getProportionateScreenWidth(16),
            ),
            hintStyle: TextStyle(
                fontFamily: FontFamily.sfProDisplay,
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.w400,
                color: Palette.hintColor),
          ),
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Password';
            } else {
              bool result = validatePassword(value);
              if (result == false) {
                return 'Password should contain small letter';
              } else {
                bool result2 = validatePassword2(value);
                if (result2 == false) {
                  return 'Password should contain capital letter';
                } else {
                  bool result3 = validatePassword3(value);
                  if (result3 == false) {
                    return 'Password should contain number';
                  } else {
                    bool result4 = validatePassword4(value);
                    if (result4 == false) {
                      return 'Password should contain special character';
                    } else if (value.length < 8) {
                      return 'Password should be at least 8 characters';
                    } else {}
                  }
                }
              }
            }
          },
          onChanged: (value) {
            setState(() {
              if (value.isEmpty) {
                showHint = false;
              } else {
                showHint = true;
              }
            });
          },
          onTap: widget.onTap,

        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
      ],
    );
  }
}


class BuildPasswordInputFieldWithoutValidation extends StatefulWidget {
  BuildPasswordInputFieldWithoutValidation(
      {required this.inputController,
        required this.inputHintText,
        required this.isObscured,
        required this.onPressed,
        this.onFieldSubmitted,
        this.onChanged,
        this.onTap});

  TextEditingController inputController;
  String inputHintText;
  bool isObscured;
  String? Function(String?)? validator;

  Function(String)? onFieldSubmitted;
  void Function(String)? onChanged;
  void Function()? onTap;
  VoidCallback onPressed;

  @override
  State<BuildPasswordInputFieldWithoutValidation> createState() =>
      _BuildPasswordInputFieldWithoutValidationState();
}

class _BuildPasswordInputFieldWithoutValidationState extends State<BuildPasswordInputFieldWithoutValidation> {
  bool showHint = false;

  RegExp passwordvalid =
  RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})');

  bool validatePassword(String pass) {
    String password = pass.trim();
    if (passwordvalid.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.inputController,
          autofocus: false,
          obscureText: widget.isObscured ? true : false,
          cursorColor: Palette.blackColor,
          keyboardType: TextInputType.text,
          autocorrect: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Palette.fillColor,
            suffix: GestureDetector(
              onTap: widget.onPressed,
              child: Padding(
                padding:
                EdgeInsets.only(right:
                getProportionateScreenWidth(16)),
                child: Icon(
                  widget.isObscured ? Icons.visibility : Icons.visibility_off,
                  color: Palette.textColor,
                  size: getProportionateScreenWidth(22),
                ),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12),),
            ),
            contentPadding: EdgeInsets.only(
              top: getProportionateScreenHeight(16),
              bottom: getProportionateScreenHeight(16),
              left: getProportionateScreenWidth(16),
            ),
            hintText: widget.inputHintText,
            hintStyle: TextStyle(
                fontFamily: FontFamily.sfProDisplay,
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.w400,
                color: Palette.hintColor),
          ),
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a password';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              if (value.isEmpty) {
                showHint = false;
              } else {
                showHint = true;
              }
            });
          },
          onTap: widget.onTap,
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
      ],
    );
  }
}