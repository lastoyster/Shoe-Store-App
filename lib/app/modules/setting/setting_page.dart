import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/controllers/theme_controller.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/setting/components/logout_button.dart';
import 'package:shoe_app/app/modules/setting/components/setting_tile.dart';
import 'package:shoe_app/app/modules/setting/notification_setting_page.dart';
import 'package:shoe_app/app/modules/widgets/animations/fade_animation.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Setting', style: AppTypography.kMedium20),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingTile(
                onTap: () {
                  Get.to(() => const NotificationSettingPage());
                },
                iconColor: const Color(0xFFF6DFDF),
                title: 'Notification Settings',
                icon: AppAssets.kNotificationColoredIcon),
            SizedBox(height: 16.h),
            SettingTile(
                onTap: () {},
                iconColor: const Color(0xFFF6DFDF),
                title: 'My Card',
                icon: AppAssets.kCard),
            SizedBox(height: 16.h),
            SettingTile(
                onTap: () {},
                iconColor: const Color(0xFFFFF3D0),
                title: 'Saved Places',
                icon: AppAssets.kSavedPlaces),
            SizedBox(height: 16.h),
            GetBuilder<ThemeController>(
              init: ThemeController(),
              initState: (_) {},
              builder: (tc) {
                return SettingTile(
                    onTap: () {},
                    iconColor: const Color(0xFFD4F3FF),
                    title: 'Dark Mode',
                    isSwitch: true,
                    onSwitch: (value) {
                      if (value) {
                        tc.setTheme('dark');
                      } else {
                        tc.setTheme('light');
                      }
                    },
                    icon: AppAssets.kDarkMode);
              },
            ),
            SizedBox(height: 16.h),
            SettingTile(
                onTap: () {},
                iconColor: const Color(0xFFFFCDCD),
                title: 'Location',
                icon: AppAssets.kLocation),
            const Spacer(),
            FadeAnimation(delay: 1.5, child: LogoutButton(onTap: () {})),
            SizedBox(height: 60.h)
          ],
        ),
      ),
    );
  }
}
