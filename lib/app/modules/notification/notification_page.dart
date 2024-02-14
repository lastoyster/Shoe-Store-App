import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/models/notification_model.dart';
import 'package:shoe_app/app/modules/notification/components/notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.h),
        child: Column(children: [
          Row(
            children: [
              Text('Today', style: AppTypography.kMedium14),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppAssets.kFilterIcon))
            ],
          ),
          SizedBox(height: 10.h),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return NotificationCard(
                  notification: notifications[index],
                  index: index,
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: notifications.length),
          SizedBox(height: 30.h),
          Row(
            children: [
              Text('Yesterday', style: AppTypography.kMedium14),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppAssets.kFilterIcon))
            ],
          ),
          SizedBox(height: 10.h),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return NotificationCard(
                  notification: notifications[index],
                  index: index,
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: notifications.length)
        ]),
      ),
    );
  }
}
