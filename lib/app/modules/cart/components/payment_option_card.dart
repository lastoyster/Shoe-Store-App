import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/widgets/animations/bouncing_animation.dart';

class PaymentOptionCard extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final bool isSelected;
  const PaymentOptionCard(
      {super.key,
      required this.child,
      required this.onTap,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return BouncingAnimation(
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: 70.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: isSelected
                ? AppColors.kPrimary.withOpacity(0.5)
                : isDarkMode(context)
                    ? AppColors.kBlackLight
                    : AppColors.kLightWhite2),
        child: child,
      ),
    );
  }
}
