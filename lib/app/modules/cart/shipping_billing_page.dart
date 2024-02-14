import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/cart/components/address_card.dart';
import 'package:shoe_app/app/modules/cart/payment_options_page.dart';
import 'package:shoe_app/app/modules/widgets/buttons/primary_button.dart';

enum AddressEnum { home, office }

class ShippingBillingPage extends StatefulWidget {
  const ShippingBillingPage({super.key});

  @override
  State<ShippingBillingPage> createState() => _ShippingBillingPageState();
}

class _ShippingBillingPageState extends State<ShippingBillingPage> {
  AddressEnum addressEnum = AddressEnum.home;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text('Shipping & Billing', style: AppTypography.kMedium20),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddressCard(
              onTap: () {
                setState(() {
                  addressEnum = AddressEnum.home;
                });
              },
              isSelected: addressEnum == AddressEnum.home,
              title: 'Home',
              icon: AppAssets.kHomeAddress,
            ),
            SizedBox(height: 16.h),
            AddressCard(
              onTap: () {
                setState(() {
                  addressEnum = AddressEnum.office;
                });
              },
              isSelected: addressEnum == AddressEnum.office,
              title: 'Office',
              icon: AppAssets.kOffice,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text('Add new shipping address',
                    style: AppTypography.kMedium16),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: SvgPicture.asset(AppAssets.kAdd))
              ],
            ),
            SizedBox(height: 20.h),
            Text('Personal Info', style: AppTypography.kMedium20),
            SizedBox(height: 16.h),
            Row(
              children: [
                SvgPicture.asset(AppAssets.kCalling),
                SizedBox(width: 10.w),
                Text('Bill to the Home address',
                    style: AppTypography.kExtraLight14),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                SvgPicture.asset(AppAssets.kCalling),
                SizedBox(width: 10.w),
                Text('01746247923', style: AppTypography.kExtraLight14),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                SvgPicture.asset(AppAssets.kCalling),
                SizedBox(width: 10.w),
                Text('quickrakibull@gmail.com',
                    style: AppTypography.kExtraLight14),
              ],
            )
          ],
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.all(20.h),
        child: PrimaryButton(
          onTap: () {
            Get.to(() => const PaymentOptionsPage());
          },
          text: 'Continue',
        ),
      ),
    );
  }
}
