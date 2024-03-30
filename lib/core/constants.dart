import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_pay/core/reusable_widgets/app_text.dart';
import 'package:smart_pay/core/size_config.dart';
//constants
class Palette{
static const Color backgroundColor = Color(0xFFFFFFFF);
static const Color primaryColor = Color(0xFF111827);
static const Color textColor = Color(0xFF6B7280);
static const Color textColor1 = Color(0xFF0A6375);
static const Color resendTextColor = Color(0xff727272);
static const Color skipColor = Color(0xFF2FA2B9);
static const Color hintColor = Color(0xFF9CA3AF);
static const Color blackColor = Color(0xFF000000);
static const Color dividerColor = Color(0xFFE5E7EB);
static const Color fillColor = Color(0xFFF9FAFB);
static const Color redColor = Color(0xFFEB2020);
static const Color greenColor = Color(0xFF00CA69);
}


class FontFamily {
  static const String sfProDisplay = 'SF-Pro-Display-Regular';
}
class ArrowBack extends StatelessWidget {
  const ArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
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
    );
  }
}
class ContainerIcon extends StatelessWidget {
  const ContainerIcon({
    super.key, required this.image,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(56),
      width: getProportionateScreenWidth(155),
      decoration: BoxDecoration(
        border: Border.all(
            color: Palette.dividerColor
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(image),
    );
  }
}

kToastMsgPopUp(BuildContext context,
    {required String message, bool? success}) {
  success ?? (success = false);
  final color = success ? Palette.greenColor : Palette.redColor;
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: color,
          margin: const EdgeInsets.all(8),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          content: CreateGeneralText(
            inputText: message,
            fontSize: 13,
            weight: FontWeight.w400,
            colorName: Colors.white,
          )));
}

class CXLoader {
  static void show(BuildContext context) {
    FocusScope.of(context).unfocus();
    return Loader.show(
      context,
      overlayColor: Colors.black38,
      progressIndicator: const SpinKitCircle(
        color: Palette.primaryColor,
      ),
    );
  }

  static void hide() {
    return Loader.hide();
  }
}
