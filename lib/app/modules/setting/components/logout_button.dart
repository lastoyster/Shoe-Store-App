import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/widgets/animations/bouncing_animation.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onTap; 
  const LogoutButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BouncingAnimation(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 112.w,
        decoration: BoxDecoration(
            color: const Color(0xFFFEE9E5),
            borderRadius: BorderRadius.circular(16.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.kLogout),
            SizedBox(width: 12.w),
            Text('Logout',
                style:
                    AppTypography.kMedium14.copyWith(color: AppColors.kOrange))
          ],
        ),
      ),
    );
  }
}
