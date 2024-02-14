import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/cart/track_order_page.dart';
import 'package:shoe_app/app/modules/widgets/buttons/custom_outlined_button.dart';
import 'package:shoe_app/app/modules/widgets/buttons/primary_button.dart';

class OrderCompletePage extends StatelessWidget {
  const OrderCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            Container(
              height: 170.h,
              width: 170.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AppAssets.kOrderComplete),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.kTime),
                SizedBox(width: 12.w),
                Text(
                  'Thank you for Purchase!',
                  style: AppTypography.kBold20,
                )
              ],
            ),
            SizedBox(height: 40.h),
            Container(
              padding: EdgeInsets.all(23.h),
              decoration: ShapeDecoration(
                color: isDarkMode(context)
                    ? AppColors.kBlackLight
                    : const Color(0xFFFFF6F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(children: [
                Text('YOUR DELIVERY DATES', style: AppTypography.kMedium14),
                SizedBox(height: 10.h),
                Divider(color: AppColors.kLightWhite3),
                Row(
                  children: [
                    Container(
                      width: 160,
                      height: 59,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFDFDFD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(AppAssets.kNike1, width: 60.w),
                          SizedBox(width: 5.w),
                          Image.asset(AppAssets.kNike2, width: 60.w),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Est: 20 Dec-2021',
                            style: AppTypography.kMedium14),
                        Text('10:30 pm', style: AppTypography.kExtraLight12),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text:
                              'For more details, track your delivery status under ',
                          style: AppTypography.kExtraLight14),
                      TextSpan(
                          text: 'My Account > My Order',
                          style: AppTypography.kMedium14),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    CustomOutlinedButton(
                      height: 31.h,
                      width: 96.w,
                      onTap: () {
                        Get.to(() => const TrackOrderPage());
                      },
                      text: 'View Order',
                      fontSize: 14.sp,
                      btnColor: AppColors.kOrange,
                      fontColor: AppColors.kOrange,
                    ),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.all(20.h),
        child: PrimaryButton(
          onTap: () {},
          text: 'Continue Shopping',
        ),
      ),
    );
  }
}
