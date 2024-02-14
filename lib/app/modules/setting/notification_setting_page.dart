import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/setting/components/custom_switch.dart';
import 'package:shoe_app/app/modules/setting/components/logout_button.dart';

class NotificationSettingPage extends StatefulWidget {
  const NotificationSettingPage({super.key});

  @override
  State<NotificationSettingPage> createState() =>
      _NotificationSettingPageState();
}

class _NotificationSettingPageState extends State<NotificationSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notification Setting', style: AppTypography.kMedium20),
            SizedBox(height: 30.h),
            Text('Mobile Notification', style: AppTypography.kExtraLight14),
            Divider(color: AppColors.kLightWhite3),
            Row(children: [
              Text('Enable text message notification',
                  style: AppTypography.kMedium14),
              const Spacer(),
              CustomSwitch(
                switchCallback: (value) {},
              )
            ]),
            Divider(color: AppColors.kLightWhite3),
            Row(children: [
              Text('Push Notifications', style: AppTypography.kMedium14),
              const Spacer(),
              Icon(Icons.arrow_forward_ios_rounded, size: 15.h),
            ]),
            Divider(color: AppColors.kLightWhite3),
            SizedBox(height: 20.h),
            Text('Email Notification', style: AppTypography.kExtraLight14),
            Divider(color: AppColors.kLightWhite3),
            Row(children: [
              Text('Promotions and announcements',
                  style: AppTypography.kMedium14),
              const Spacer(),
              CustomSwitch(
                switchCallback: (value) {},
              )
            ]),
            Divider(color: AppColors.kLightWhite3),
            const Spacer(),
            LogoutButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
