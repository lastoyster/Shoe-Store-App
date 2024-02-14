import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/models/product_category.dart';
import 'package:shoe_app/app/models/product_model.dart';
import 'package:shoe_app/app/modules/home/components/category_card.dart';
import 'package:shoe_app/app/modules/home/components/flash_sale_card.dart';
import 'package:shoe_app/app/modules/home/components/product_sale_card.dart';
import 'package:shoe_app/app/modules/home/components/search_field.dart';
import 'package:shoe_app/app/modules/home/flash_sale_page.dart';
import 'package:shoe_app/app/modules/widgets/appbar/primary_appbar.dart';
import 'package:shoe_app/app/modules/widgets/buttons/custom_text_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const SearchField(),
            SizedBox(height: 30.h),
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
            SizedBox(height: 10.h),
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
                    color: isDarkMode(context)
                        ? AppColors.kLightWhite2
                        : AppColors.kBlack,
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),
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
                })
          ],
        ),
      ),
    );
  }
}
