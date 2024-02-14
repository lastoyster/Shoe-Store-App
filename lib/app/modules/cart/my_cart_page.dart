import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/constants/app_assets.dart';
import 'package:shoe_app/app/data/constants/app_colors.dart';
import 'package:shoe_app/app/data/constants/app_typography.dart';
import 'package:shoe_app/app/models/product_model.dart';
import 'package:shoe_app/app/modules/cart/payment_options_page.dart';
import 'package:shoe_app/app/modules/cart/shipping_billing_page.dart';
import 'package:shoe_app/app/modules/home/components/product_sale_card.dart';
import 'package:shoe_app/app/modules/widgets/buttons/custom_outlined_button.dart';
import 'package:shoe_app/app/modules/widgets/buttons/primary_button.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text('My Cart', style: AppTypography.kMedium20),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                separatorBuilder: (context, index) => SizedBox(height: 5.h),
                itemBuilder: (context, index) {
                  return ProductSaleCard(
                    isCartPage: true,
                    index: index,
                    product: discountedProducts[index],
                  );
                }),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text('Shipping address', style: AppTypography.kMedium14),
                  SizedBox(width: 6.w),
                  SvgPicture.asset(AppAssets.kShippingIcon)
                ],
              ),
            ),
            SizedBox(height: 11.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sunamganj, hospital',
                          style: AppTypography.kMedium12),
                      Text('54-568 Abullah',
                          style: AppTypography.kExtraLight12),
                    ],
                  ),
                  const Spacer(),
                  CustomOutlinedButton(
                    onTap: () {
                      Get.to(() => const ShippingBillingPage());
                    },
                    text: 'Change',
                    height: 31.h,
                    width: 76.w,
                    fontSize: 14.sp,
                    fontColor: isDarkMode(context)
                        ? AppColors.kLightWhite
                        : AppColors.kBlack,
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Divider(color: AppColors.kLightWhite3),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text('Payment Method', style: AppTypography.kMedium14),
            ),
            SizedBox(height: 11.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Image.asset(AppAssets.kVisa),
                  SizedBox(width: 5.w),
                  Text('.....  .....  .....  3265',
                      style: AppTypography.kMedium12),
                  const Spacer(),
                  CustomOutlinedButton(
                    onTap: () {
                      Get.to(() => const PaymentOptionsPage());
                    },
                    text: 'Change',
                    height: 31.h,
                    width: 76.w,
                    fontSize: 14.sp,
                    fontColor: isDarkMode(context)
                        ? AppColors.kLightWhite
                        : AppColors.kBlack,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.all(20.h),
        child: PrimaryButton(
          onTap: () {
            Get.to(() => const ShippingBillingPage());
          },
          text: r'Pay Now $350',
        ),
      ),
    );
  }
}
