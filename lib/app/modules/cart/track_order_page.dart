import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/widgets/appbar/primary_appbar.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({super.key});

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  int activeStep = 0;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Image.asset(
                  AppAssets.kMap2,
                  fit: BoxFit.cover,
                )),
            Container(
              height: 250.h,
              padding: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                  color: isDarkMode(context)
                      ? AppColors.kBlackLight
                      : AppColors.kLightWhite,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30.r))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('YOUR DELIVERY DATES', style: AppTypography.kMedium14),
                  SizedBox(height: 10.h),
                  Divider(color: AppColors.kLightWhite3),
                  Row(
                    children: [
                      SizedBox(
                        width: 160,
                        height: 59,
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
                  const Spacer(),
                  EasyStepper(
                    activeStep: activeStep,
                    lineLength: 100,
                    lineSpace: 5,
                    lineType: LineType.dotted,
                    defaultLineColor: AppColors.kPrimary,
                    finishedLineColor: AppColors.kPrimary,
                    activeStepTextColor: isDarkMode(context)
                        ? AppColors.kLightWhite
                        : AppColors.kBlack,
                    finishedStepTextColor: isDarkMode(context)
                        ? AppColors.kLightWhite
                        : AppColors.kBlack,
                    internalPadding: 0,
                    padding: EdgeInsets.zero,
                    showLoadingAnimation: false,
                    stepRadius: 22,
                    showStepBorder: false,
                    steps: [
                      _buildActiveStep(
                        title: 'Order',
                        icon: AppAssets.kOrder,
                        isActive: activeStep >= 0,
                      ),
                      _buildActiveStep(
                        isActive: activeStep >= 1,
                        icon: AppAssets.kReceive,
                        title: 'Ship',
                      ),
                      _buildActiveStep(
                        isActive: activeStep >= 2,
                        icon: AppAssets.kShip,
                        title: 'Receive',
                      ),
                    ],
                    onStepReached: (index) =>
                        setState(() => activeStep = index),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  EasyStep _buildActiveStep(
      {required String title, required String icon, required bool isActive}) {
    return EasyStep(
      customStep: CircleAvatar(
        radius: 21,
        backgroundColor: isActive ? AppColors.kPrimary : AppColors.kPeriwinkle,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            icon,
            color: isActive ? AppColors.kLightWhite : null,
          ),
        ),
      ),
      title: title,
    );
  }
}
