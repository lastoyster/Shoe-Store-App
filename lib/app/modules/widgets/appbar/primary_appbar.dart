import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/routes/app_routes.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      elevation: 10,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.kMenu,
            colorFilter: ColorFilter.mode(
                isDarkMode(context) ? AppColors.kLightWhite : AppColors.kBlack,
                BlendMode.srcIn),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.getCartPageRoute());
              },
              icon: SvgPicture.asset(
                AppAssets.kCartBag,
                colorFilter: ColorFilter.mode(
                    isDarkMode(context)
                        ? AppColors.kLightWhite
                        : AppColors.kBlack,
                    BlendMode.srcIn),
              )),
          SizedBox(width: 5.w),
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.getNotificationPageRoute());
              },
              icon: SvgPicture.asset(
                AppAssets.kNotification,
                colorFilter: ColorFilter.mode(
                    isDarkMode(context)
                        ? AppColors.kLightWhite
                        : AppColors.kBlack,
                    BlendMode.srcIn),
              )),
          SizedBox(width: 10.w),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.getProfilePageRoute());
            },
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: CircleAvatar(
                backgroundImage: AssetImage(AppAssets.kProfilePic),
              ),
            ),
          ),
          SizedBox(width: 10.w)
        ]);
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
