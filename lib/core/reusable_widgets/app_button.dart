import 'package:flutter/material.dart';
//  button
class BuildButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Widget child;
  void Function()? onTap;
  final Color buttonColor;


  BuildButton({
    super.key,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.onTap,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {

    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color:  buttonColor,
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}
