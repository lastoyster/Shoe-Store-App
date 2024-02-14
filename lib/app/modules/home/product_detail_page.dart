import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/models/product_model.dart';
import 'package:shoe_app/app/modules/home/components/buy_confirmation_sheet.dart';
import 'package:shoe_app/app/modules/home/components/detail_page_header.dart';
import 'package:shoe_app/app/modules/home/components/review_card.dart';
import 'package:shoe_app/app/modules/widgets/buttons/primary_button.dart';
import 'package:shoe_app/app/routes/app_routes.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailPage({super.key, required this.product});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailPageHeader(product: product),
            SizedBox(height: 36.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text(product.name, style: AppTypography.kBold20),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$ ${product.discountPrice?.toInt()}',
                        style: AppTypography.kMedium14.copyWith(
                            color: AppColors.kOrange,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.kOrange),
                      ),
                      Text(
                        '\$ ${product.price.toInt()}',
                        style: AppTypography.kBold20,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(color: AppColors.kLightWhite3),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text('Available Size', style: AppTypography.kMedium14),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    5,
                    (index) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              color: isDarkMode(context)
                                  ? AppColors.kBlackLight
                                  : product.bgCol,
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Text('US 6', style: AppTypography.kBold14),
                        )),
              ),
            ),
            Divider(color: AppColors.kLightWhite3),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text('DESCRIPTION', style: AppTypography.kMedium14),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                  'Trendy Shoes For Man With High Quality Fabrics And Breathable Outdoor Sport Sneakers. Trendy Shoes For Man With High Quality Fabrics And Breathable Outdoor Sport Sneakers.',
                  style: AppTypography.kExtraLight12),
            ),
            Divider(color: AppColors.kLightWhite3),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text('Product Reviews (120)', style: AppTypography.kMedium14),
                  ...List.generate(
                      5,
                      (index) => Icon(Icons.star,
                          size: 18.h, color: AppColors.kOrange))
                ],
              ),
            ),
            SizedBox(height: 20.h),
            ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const ReviewCard();
                },
                separatorBuilder: (context, index) =>
                    Divider(color: AppColors.kLightWhite3),
                itemCount: 2),
            SizedBox(height: 100.h),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.all(20.h),
        child: PrimaryButton(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return BuyConfirmationSheet(
                      product: product,
                    );
                  });
            },
            text: 'Confirm to Buy'),
      ),
    );
  }
}
