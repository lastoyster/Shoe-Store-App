import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/models/product_model.dart';
import 'package:shoe_app/app/modules/home/product_detail_page.dart';
import 'package:shoe_app/app/modules/widgets/animations/bouncing_animation.dart';
import 'package:shoe_app/app/modules/widgets/animations/fade_in_left_animation.dart';

class ProductSaleCard extends StatelessWidget {
  final ProductModel product;
  final bool isCartPage;
  final int index;
  const ProductSaleCard({
    super.key,
    required this.index,
    required this.product,
    this.isCartPage = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    final delay = Duration(milliseconds: 100 * index);
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailPage(product: product));
      },
      child: FadeInLeft(
        duration: const Duration(milliseconds: 500),
        delay: delay,
        child: Container(
          height: 180.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          color: isDarkMode(context) ? AppColors.kBlackLight : product.bgCol,
          child: Row(
            children: [
              Hero(
                tag: product.image,
                child: Image.asset(product.image[0],
                    width: 150.w, fit: BoxFit.cover),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(product.name,
                      style: AppTypography.kMedium14
                          .copyWith(color: AppColors.kDarkWhite)),
                  Text(
                    '\$ ${product.price.toInt()}',
                    style: AppTypography.kBold20,
                  ),
                  Text(
                    '\$ ${product.discountPrice}',
                    style: AppTypography.kMedium14.copyWith(
                        color: AppColors.kOrange,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.kOrange),
                  ),
                  SizedBox(height: 10.h),
                  isCartPage
                      ? IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppAssets.kDelete))
                      : BouncingAnimation(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.w, vertical: 8.h),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.kDarkWhite),
                                borderRadius: BorderRadius.circular(32.r)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Buy Now', style: AppTypography.kMedium14),
                                SizedBox(width: 5.w),
                                SvgPicture.asset(
                                  AppAssets.kBuyNow,
                                  colorFilter: ColorFilter.mode(
                                      isDarkMode(context)
                                          ? AppColors.kLightWhite
                                          : AppColors.kBlack,
                                      BlendMode.srcIn),
                                )
                              ],
                            ),
                          ),
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
