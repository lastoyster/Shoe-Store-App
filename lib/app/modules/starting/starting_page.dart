import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/widgets/buttons/custom_outlined_button.dart';
import 'package:shoe_app/app/routes/app_routes.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlack,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Center(
                child: SvgPicture.asset(AppAssets.kLuxuryVert,
                    width: 72.w, height: 391.h)),
            SizedBox(height: 49.h),
            Container(
              height: 62.h,
              width: 62.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kPrimary,
                  ),
                  child: Image.asset(AppAssets.kAppLogo),
            ),
            SizedBox(height: 9.h),
            Text(
              'Shopping',
              style: AppTypography.kMedium16
                  .copyWith(color: AppColors.kPrimary, letterSpacing: 6.w),
            ),
            SizedBox(height: 26.1.h),
            SvgPicture.asset(AppAssets.kLuxuryHoriz),
            const Spacer(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: CustomOutlinedButton(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.getOnboardingPageRoute());
                  },
                  text: 'Go ahead'),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
