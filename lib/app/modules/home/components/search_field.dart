import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/search/search_page.dart';
import 'package:shoe_app/app/modules/widgets/animations/bouncing_animation.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
              child: InkWell(
            onTap: () {
              Get.to(() => const SearchPage());
            },
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                  prefixIcon: const Icon(CupertinoIcons.search),
                  hintText: 'Find your product',
                  hintStyle: AppTypography.kExtraLight14.copyWith(
                      color: isDarkMode(context)
                          ? AppColors.kDarkWhite
                          : Colors.black)),
            ),
          )),
          SizedBox(width: 14.w),
          BouncingAnimation(
            onTap: () {
              Get.to(() => const SearchPage());
            },
            child: Container(
              height: 45.h,
              width: 45.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.kBlueDark),
              child: SvgPicture.asset(AppAssets.kFilter),
            ),
          )
        ],
      ),
    );
  }
}
