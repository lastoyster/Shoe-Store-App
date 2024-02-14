import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/app/data/data.dart';

class DebitCard extends StatelessWidget {
  const DebitCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 212,
      padding: EdgeInsets.all(14.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: ShapeDecoration(
        color:
            isDarkMode(context) ? AppColors.kPrimary : const Color(0xFF010001),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(AppAssets.kRewind),
              const Spacer(),
              SvgPicture.asset(AppAssets.kWifi)
            ],
          ),
          const Spacer(),
          Text('****   ****   ****   2165',
              style: AppTypography.kMedium12
                  .copyWith(color: AppColors.kLightWhite)),
          SizedBox(height: 10.h),
          Text('Rakibull hassan',
              style: AppTypography.kMedium16
                  .copyWith(color: AppColors.kLightWhite)),
          const Spacer(),
          Row(
            children: [
              Image.asset(AppAssets.kMasterCard),
              const Spacer(),
              Image.asset(AppAssets.kSim)
            ],
          )
        ],
      ),
    );
  }
}
