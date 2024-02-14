import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/widgets/animations/bouncing_animation.dart';

class CircularIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String icon;
  const CircularIconButton(
      {super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return BouncingAnimation(
      onTap: onTap,
      child: Container(
        height: 54.h,
        width: 54.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isDarkMode(context)
                ? AppColors.kBlueDark2
                : AppColors.kLightWhite,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 32.r,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(0.25))
            ]),
        child: SvgPicture.asset(
          icon,
          color: onTap != null ? AppColors.kPrimary : AppColors.kPrimary.withOpacity(0.1),
        ),
      ),
    );
  }
}
