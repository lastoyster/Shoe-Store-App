// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/widgets/buttons/custom_text_button.dart';

class MapPermissionPage extends StatelessWidget {
  final VoidCallback allowOnceCallback;
  final VoidCallback whileUsingAppCallback;
  final VoidCallback notAllowCallback;
  const MapPermissionPage({
    Key? key,
    required this.allowOnceCallback,
    required this.whileUsingAppCallback,
    required this.notAllowCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Column(
        children: [
          Text('Allow track to use your location',
              style: AppTypography.kBold32),
          SizedBox(height: 64.h),
          Container(
            height: 290.h,
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(14.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                    image: AssetImage(AppAssets.kMap), fit: BoxFit.cover)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 7.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.kLightWhite),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppAssets.kSend),
                  SizedBox(width: 5.w),
                  Text('Precise: On',
                      style: AppTypography.kLight14
                          .copyWith(color: AppColors.kPrimary))
                ],
              ),
            ),
          ),
          const Spacer(),
          CustomTextButton(
            onPressed: allowOnceCallback,
            text: 'Allow Once',
            fontSize: 20.sp,
          ),
          Divider(height: 0.h, color: AppColors.kLightGrey, thickness: 0.5),
          CustomTextButton(
            onPressed: whileUsingAppCallback,
            text: 'Allow While Using App',
            fontSize: 20.sp,
          ),
          Divider(height: 0.h, color: AppColors.kLightGrey, thickness: 0.5),
          CustomTextButton(
            onPressed: notAllowCallback,
            text: 'Don’t Allow',
            fontSize: 20.sp,
          )
        ],
      ),
    );
  }
}
