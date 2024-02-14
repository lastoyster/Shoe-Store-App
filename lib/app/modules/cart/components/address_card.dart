import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/app/data/data.dart';

class AddressCard extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const AddressCard(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.title,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
                color:
                    isSelected ? AppColors.kPrimary : AppColors.kLightWhite3),
            color: isSelected
                ? isDarkMode(context)
                    ? const Color(0xFF3DB9FF).withOpacity(0.5)
                    : const Color(0xFFF1FAFF)
                : isDarkMode(context)
                    ? AppColors.kBlackLight
                    : AppColors.kLightWhite2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(icon),
                SizedBox(width: 12.w),
                Text(title, style: AppTypography.kBold16),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppAssets.kEdit,
                    color: isSelected
                        ? AppColors.kPrimary
                        : isDarkMode(context)
                            ? AppColors.kLightWhite
                            : null,
                  ),
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                )
              ],
            ),
            SizedBox(height: 10.h),
            Text('Sunamganj', style: AppTypography.kMedium12),
            Text('+971-50-1234567', style: AppTypography.kExtraLight12),
            Divider(color: AppColors.kLightWhite3),
            Text(
              'Room #1 - Ground Floor, Al Najoun Bulding, 24 B Street, Dubai - United Arab Emirates',
              style: AppTypography.kExtraLight12,
            )
          ],
        ),
      ),
    );
  }
}
