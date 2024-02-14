import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/widgets/animations/bouncing_animation.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final Color? iconColor;
  const SocialButton(
      {super.key, required this.onTap, required this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return BouncingAnimation(
      onTap: onTap,
      child: Container(
        height: 59.h,
        width: 59.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isDarkMode(context)
                ? AppColors.kBlackLight
                : AppColors.kLightWhite,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 32.r,
                  spreadRadius: 0,
                  // ignore: use_full_hex_values_for_flutter_colors
                  color: Colors.grey.withOpacity(0.25))
            ]),
        child: SvgPicture.asset(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
