import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/data/enums/notification_type.dart';
import 'package:shoe_app/app/models/notification_model.dart';
import 'package:shoe_app/app/modules/widgets/animations/fade_in_left_animation.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final int index;
  const NotificationCard(
      {super.key, required this.notification, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    final delay = Duration(milliseconds: 100 * index);
    return FadeInLeft(
      duration: const Duration(milliseconds: 500),
      delay: delay,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        decoration: BoxDecoration(
            color: isDarkMode(context)
                ? AppColors.kBlackLight
                : notification.notificationType == NotificationType.done
                    ? const Color(0xFFFDF1F0)
                    : notification.notificationType == NotificationType.delivery
                        ? const Color(0xFFE2EDFB)
                        : const Color(0xFFE0F3E1),
            borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30.h,
              width: 30.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: notification.notificationType == NotificationType.done
                      ? const Color(0xFFFCDDDA)
                      : notification.notificationType ==
                              NotificationType.delivery
                          ? const Color(0xFFD5E2F1)
                          : const Color(0xFFC4EFC6)),
              child: Image.asset(notification.notificationType ==
                      NotificationType.done
                  ? AppAssets.kDone
                  : notification.notificationType == NotificationType.delivery
                      ? AppAssets.kDelivery
                      : AppAssets.kOfferIcon),
            ),
            SizedBox(width: 10.w),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.title, style: AppTypography.kMedium16),
                Text(notification.message, style: AppTypography.kExtraLight12),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
