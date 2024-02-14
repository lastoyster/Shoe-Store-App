import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/models/product_model.dart';
import 'package:shoe_app/app/modules/widgets/buttons/primary_button.dart';

class BuyConfirmationSheet extends StatefulWidget {
  final ProductModel product;
  const BuyConfirmationSheet({super.key, required this.product});

  @override
  State<BuyConfirmationSheet> createState() => _BuyConfirmationSheetState();
}

class _BuyConfirmationSheetState extends State<BuyConfirmationSheet> {
  int _selectedSize = 0;
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
  ];
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.h,
            padding: EdgeInsets.all(20.h),
            decoration: BoxDecoration(
                color: isDarkMode(context)
                    ? AppColors.kBlackLight
                    : widget.product.bgCol,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30.r))),
            child: Row(
              children: [
                Image.asset(
                  widget.product.image[0],
                  width: 160.w,
                  fit: BoxFit.cover,
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 10.h),
                    Text(widget.product.name, style: AppTypography.kMedium14),
                    SizedBox(height: 10.h),
                    Text(
                      '\$ ${widget.product.discountPrice?.toInt()}',
                      style: AppTypography.kMedium14.copyWith(
                          color: AppColors.kOrange,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.kOrange),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      '\$ ${widget.product.price.toInt()}',
                      style: AppTypography.kBold20,
                    ),
                    const Spacer(),
                    SvgPicture.asset(AppAssets.kHeart),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text('Select Size', style: AppTypography.kMedium14),
          ),
          SizedBox(height: 23.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Wrap(
                runSpacing: 18.w,
                spacing: 18.h,
                children: List.generate(
                  6,
                  (index) => _buildSizeCard('US 6', () {
                    setState(() {
                      _selectedSize = index;
                    });
                  }, _selectedSize == index, context),
                )),
          ),
          SizedBox(height: 49.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text('Select Color', style: AppTypography.kMedium14),
          ),
          SizedBox(height: 23.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Wrap(
                spacing: 10.w,
                children: List.generate(
                    colorList.length,
                    (index) => Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: colorList[index]),
                        ))),
          ),
          SizedBox(height: 39.h),
          Padding(
            padding: EdgeInsets.all(20.h),
            child: Row(
              children: [
                Expanded(
                    child: PrimaryButton(
                  onTap: () {},
                  text: '+ Cart',
                  btnColor: AppColors.kLightWhite2,
                  fontColor: AppColors.kPrimary,
                )),
                SizedBox(width: 12.w),
                Expanded(child: PrimaryButton(onTap: () {}, text: 'Buy')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildSizeCard(
    String text, VoidCallback onTap, bool isSelected, context) {
  bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
  return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: isSelected ? AppColors.kPrimary : null,
            border: isSelected ? null : Border.all(color: AppColors.kGrey)),
        child: Text('US 6',
            style: AppTypography.kBold14.copyWith(
                color: isSelected
                    ? AppColors.kLightWhite
                    : isDarkMode(context)
                        ? AppColors.kLightWhite
                        : AppColors.kBlack)),
      ));
}
