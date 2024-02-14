import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/widgets/animations/bouncing_animation.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? btnColor;
  final Color? fontColor;
  const PrimaryButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.height,
      this.width,
      this.fontSize,
      this.btnColor,
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
            color: btnColor ?? AppColors.kPrimary,
            borderRadius: BorderRadius.circular(23.r)),
        child: Text(
          text,
          style: AppTypography.kMedium20.copyWith(
              color: fontColor ?? AppColors.kLightWhite, fontSize: fontSize),
        ),
      ),
    );
  }
}
