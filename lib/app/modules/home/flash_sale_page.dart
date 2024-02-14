import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/models/product_category.dart';
import 'package:shoe_app/app/models/product_model.dart';
import 'package:shoe_app/app/modules/home/components/category_card.dart';
import 'package:shoe_app/app/modules/home/components/flash_sale_card.dart';
import 'package:shoe_app/app/modules/home/components/product_sale_card.dart';
import 'package:shoe_app/app/modules/widgets/buttons/custom_text_button.dart';
import 'package:shoe_app/app/routes/app_routes.dart';

class FlashSalePage extends StatefulWidget {
  const FlashSalePage({super.key});

  @override
  State<FlashSalePage> createState() => _FlashSalePageState();
}

class _FlashSalePageState extends State<FlashSalePage> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
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
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20.w),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CategoryCard(
                        category: productCategories[index].name,
                        onTap: () {
                          setState(() {
                            _selectedCategory = index;
                          });
                        },
                        isSelected: _selectedCategory == index);
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 6.75.w),
                  itemCount: productCategories.length),
            ),
            SizedBox(height: 30.h),
            const FlashSaleCard(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text('Flash Sale', style: AppTypography.kBold16),
                  const Spacer(),
                  CustomTextButton(
                    onPressed: () {
                      Get.to(() => const FlashSalePage());
                    },
                    text: 'See More',
                    fontSize: 12.sp,
                    color: AppColors.kBlack,
                  )
                ],
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: discountedProducts.length,
                separatorBuilder: (context, index) => SizedBox(height: 5.h),
                itemBuilder: (context, index) {
                  return ProductSaleCard(
                    index: index,
                    product: discountedProducts[index],
                  );
                }),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
