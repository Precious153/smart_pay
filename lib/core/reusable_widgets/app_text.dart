import 'package:flutter/material.dart';
import '../size_config.dart';
// text
class CreateGeneralText extends StatelessWidget {
  const CreateGeneralText({
    super.key,
    required this.inputText,
    this.fontFamily,
    this.weight,
    this.colorName,
    this.fontSize,
    this.softWrap,
    this.textAlign,
  });

  final String inputText;
  final String? fontFamily;
  final FontWeight? weight;
  final Color? colorName;
  final double? fontSize;
  final double letterSpacing =0.0;
  final bool? softWrap;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      textAlign: textAlign,
      softWrap: softWrap,
      style: TextStyle(
          letterSpacing: getProportionateScreenWidth(letterSpacing),
          fontSize: getProportionateScreenWidth(fontSize!),
          fontWeight: weight,
          fontFamily: fontFamily,
          color:colorName),
    );
  }
}
