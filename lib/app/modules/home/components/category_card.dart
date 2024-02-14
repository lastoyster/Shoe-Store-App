import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/widgets/animations/bouncing_animation.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final VoidCallback onTap;
  final bool isSelected;
  const CategoryCard(
      {super.key,
      required this.category,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return BouncingAnimation(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.kPrimary : null,
            borderRadius: BorderRadius.circular(12.r),
            border: isSelected
                ? null
                : Border.all(color: AppColors.kLightGrey, width: 0.5)),
        child: Text(
          category,
          style: AppTypography.kBold16.copyWith(
              color: isSelected
                  ? AppColors.kLightWhite
                  : isDarkMode(context)
                      ? AppColors.kLightGrey
                      : Colors.black),
        ),
      ),
    );
  }
}
