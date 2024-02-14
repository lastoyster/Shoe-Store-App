import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/cart/components/cash_delivery_button.dart';
import 'package:shoe_app/app/modules/cart/components/debit_card.dart';
import 'package:shoe_app/app/modules/cart/components/payment_option_card.dart';
import 'package:shoe_app/app/modules/cart/order_complete_page.dart';
import 'package:shoe_app/app/modules/cart/shipping_billing_page.dart';
import 'package:shoe_app/app/modules/widgets/buttons/custom_outlined_button.dart';

class PaymentOptionsPage extends StatefulWidget {
  const PaymentOptionsPage({super.key});

  @override
  State<PaymentOptionsPage> createState() => _PaymentOptionsPageState();
}

class _PaymentOptionsPageState extends State<PaymentOptionsPage> {
  int _selectedPaymentOptions = 0;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        actions: [
          CashDeliveryButton(onTap: () {
            Get.to(() => const OrderCompletePage());
          }),
          SizedBox(width: 15.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text('Multiple payment Option', style: AppTypography.kMedium20),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                    3,
                    (index) => PaymentOptionCard(
                          onTap: () {
                            setState(() {
                              _selectedPaymentOptions = index;
                            });
                          },
                          isSelected: _selectedPaymentOptions == index,
                          child: Image.asset([
                            AppAssets.kMasterCard,
                            AppAssets.kVisa,
                            AppAssets.kPaypal
                          ][index]),
                        )),
                PaymentOptionCard(
                    child: SvgPicture.asset(AppAssets.kAdd), onTap: () {})
              ],
            ),
            SizedBox(height: 38.h),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  top: 130.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 123.h, left: 24.w, right: 24.w),
                    decoration: BoxDecoration(
                        color: isDarkMode(context)
                            ? AppColors.kBlackLight
                            : const Color(0xFFFFF6F6),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total (2) Items',
                            style: AppTypography.kExtraLight12
                                .copyWith(color: AppColors.kGrey)),
                        Text('Total Balance', style: AppTypography.kMedium16),
                        Text(r'$ 15,014', style: AppTypography.kBold32),
                        SizedBox(height: 10.h),
                        Divider(color: AppColors.kLightWhite3),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Text('Shipping address',
                                style: AppTypography.kMedium14),
                            SizedBox(width: 6.w),
                            SvgPicture.asset(AppAssets.kShippingIcon)
                          ],
                        ),
                        SizedBox(height: 11.h),
                        Row(
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
                              fontColor: AppColors.kBlack,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const DebitCard()
              ],
            ))
          ],
        ),
      ),
    );
  }
}
