import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/app/data/data.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String icon;
  final Color iconColor;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const AuthField(
      {super.key,
      required this.iconColor,
      required this.controller,
      required this.icon,
      required this.hintText,
      this.validator,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: AppTypography.kMedium14,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          errorMaxLines: 3,
          prefixIcon: Padding(
            padding: EdgeInsets.all(8.h),
            child: Container(
              height: 35.h,
              width: 35.w,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: iconColor),
              child: SvgPicture.asset(icon),
            ),
          )),
    );
  }
}
