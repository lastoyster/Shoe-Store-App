import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/constants/app_colors.dart';
import 'package:shoe_app/app/data/constants/app_typography.dart';
import 'package:shoe_app/app/modules/widgets/animations/bouncing_animation.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? fontColor;
  final Color? btnColor;

  const CustomOutlinedButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.btnColor,
      this.height,
      this.width,
      this.fontSize,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return BouncingAnimation(
      onTap: onTap,
      child: Container(
        height: height ?? 50.h,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: btnColor ?? AppColors.kViolet),
            borderRadius: BorderRadius.circular(23.r)),
        child: Text(
          text,
          style: AppTypography.kBold16.copyWith(
              color: fontColor ?? AppColors.kLightWhite, fontSize: fontSize),
        ),
      ),
    );
  }
}
