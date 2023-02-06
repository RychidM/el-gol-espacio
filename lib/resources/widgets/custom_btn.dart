import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_dimens.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final VoidCallback onTap;
  final Widget child;
  const CustomButton({
    Key? key,
    required this.child,
    this.width = double.maxFinite,
    required this.onTap,
    this.color = AppColors.lBlue,
    this.height = 63,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? AppDimens.lButtonHeight,
        width: width ?? AppDimens.lButtonWidth,
        decoration: BoxDecoration(
            color: color ?? AppColors.lBlue,
            borderRadius: BorderRadius.circular(AppDimens.lAppBorderRadius)),
        child:  Center(
        child: child,
      ),
      ),
    );
  }
}
