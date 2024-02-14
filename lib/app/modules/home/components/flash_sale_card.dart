import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/widgets/animations/bouncing_animation.dart';

class FlashSaleCard extends StatefulWidget {
  const FlashSaleCard({super.key});

  @override
  State<FlashSaleCard> createState() => _FlashSaleCardState();
}

class _FlashSaleCardState extends State<FlashSaleCard> {
  late Timer _timer;
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();

    DateTime endDateTime =
        DateTime.now().add(const Duration(hours: 4, minutes: 30, seconds: 15));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final difference = endDateTime.difference(now);

      setState(() {
        _hours = difference.inHours;
        _minutes = difference.inMinutes % 60;
        _seconds = difference.inSeconds % 60;
      });

      if (difference.isNegative) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              Text('Flash Sale', style: AppTypography.kBold16),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ending in', style: AppTypography.kExtraLight12),
                  Text('On sale now',
                      style: AppTypography.kExtraLight12
                          .copyWith(color: AppColors.kOrange)),
                ],
              ),
              SizedBox(width: 12.w),
              _buildTimeDigit(_hours),
              Text(' : ',
                  style: AppTypography.kExtraLight12
                      .copyWith(color: AppColors.kOrange)),
              _buildTimeDigit(_minutes),
              Text(' : ',
                  style: AppTypography.kExtraLight12
                      .copyWith(color: AppColors.kOrange)),
              _buildTimeDigit(_seconds),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 332.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 23.w),
                    decoration: BoxDecoration(gradient: AppColors.kGradient1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Shoes+',
                                style: AppTypography.kBold32
                                    .copyWith(color: AppColors.kLightWhite)),
                            SizedBox(width: 10.w),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colors.red),
                              child: Text(' 20% ',
                                  style: AppTypography.kBold16
                                      .copyWith(color: AppColors.kLightWhite)),
                            )
                          ],
                        ),
                        Text('This month best offer for you',
                            style: AppTypography.kMedium16
                                .copyWith(color: AppColors.kLightWhite)),
                        const Spacer(),
                        BouncingAnimation(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.w, vertical: 12.h),
                            decoration: BoxDecoration(
                                color: AppColors.kPrimary,
                                borderRadius: BorderRadius.circular(32.r)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Buy Now',
                                    style: AppTypography.kMedium14.copyWith(
                                        color: AppColors.kLightWhite)),
                                SizedBox(width: 5.w),
                                SvgPicture.asset(AppAssets.kBuyNow)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: Image.asset(
                    AppAssets.kDiscountProduct,
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildTimeDigit(int digit) {
  return Container(
    height: 30.h,
    width: 30.w,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: AppColors.kOrange, borderRadius: BorderRadius.circular(4.r)),
    child: Text(digit.toString(),
        style: AppTypography.kMedium12.copyWith(color: AppColors.kLightWhite)),
  );
}
