import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/profile/components/profile_tile.dart';
import 'package:shoe_app/app/modules/setting/components/logout_button.dart';
import 'package:shoe_app/app/modules/widgets/buttons/primary_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        actions: [
          Container(
            margin: EdgeInsets.all(8.h),
            padding: EdgeInsets.all(5.h),
            decoration: BoxDecoration(
                color: AppColors.kLightWhite3, shape: BoxShape.circle),
            child: Icon(Icons.close, color: AppColors.kBlack),
          ),
          SizedBox(width: 15.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundImage: AssetImage(AppAssets.kProfilePic),
                ),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jeniffer Winget', style: AppTypography.kBold20),
                    Text('jeniffer@gmail.com', style: AppTypography.kMedium14),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        PrimaryButton(
                          onTap: () {},
                          text: 'Edit Profile',
                          height: 30.h,
                          width: 93.w,
                          fontSize: 12.sp,
                        ),
                        SizedBox(width: 5.w),
                        SvgPicture.asset(AppAssets.kFacebookOutline),
                        SizedBox(width: 5.w),
                        SvgPicture.asset(AppAssets.kTwitter),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20.h),
            Divider(color: AppColors.kLightWhite3),
            SizedBox(height: 20.h),
            ProfileTile(
                onTap: () {}, icon: AppAssets.kHomeWhite, title: 'Home'),
            ProfileTile(
                onTap: () {}, icon: AppAssets.kService, title: 'Services'),
            ProfileTile(
                onTap: () {},
                icon: AppAssets.kNotificationWhite,
                title: 'Notifications'),
            ProfileTile(
                onTap: () {},
                icon: AppAssets.kChat,
                title: 'Messages',
                badgeTitle: '3',
                isBadge: true),
            ProfileTile(
                onTap: () {},
                icon: AppAssets.kProfileIcon,
                title: 'My Profile'),
            ProfileTile(onTap: () {}, icon: AppAssets.kWallet, title: 'Wallet'),
            ProfileTile(
                onTap: () {},
                badgeTitle: '1',
                icon: AppAssets.kChat,
                title: 'Chat Support',
                isBadge: true),
            ProfileTile(
                onTap: () {}, icon: AppAssets.kSettingWhite, title: 'Settings'),
            SizedBox(height: 40.h),
            LogoutButton(
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
