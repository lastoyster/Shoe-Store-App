import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/widgets/animations/bouncing_animation.dart';

class OfferCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String description;
  final String image;
  final Gradient? linearGradient;
  const OfferCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.description,
    required this.image,
    this.linearGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 388.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 23.w),
                  decoration: BoxDecoration(
                      gradient: linearGradient ?? AppColors.kGradient1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: AppTypography.kBold32
                              .copyWith(color: AppColors.kLightWhite)),
                      Text(description,
                          style: AppTypography.kMedium16
                              .copyWith(color: AppColors.kLightWhite)),
                      const Spacer(),
                      BouncingAnimation(
                        onTap: onTap,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                              color: AppColors.kPrimary,
                              borderRadius: BorderRadius.circular(32.r)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Buy Now',
                                  style: AppTypography.kMedium14
                                      .copyWith(color: AppColors.kLightWhite)),
                              SizedBox(width: 5.w),
                              SvgPicture.asset(AppAssets.kBuyNow)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                )),
            Expanded(
                flex: 7,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                )),
          ],
        ),
      ),
    );
  }
}
