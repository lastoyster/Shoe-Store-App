import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';

class CashDeliveryButton extends StatelessWidget {
  final VoidCallback onTap;
  const CashDeliveryButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: AppColors.kLightWhite3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 4,
                    top: 4,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFADADAD),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 5.w),
            Text(
              'Cash On Delivery',
              style: AppTypography.kMedium12,
            ),
          ],
        ),
      ),
    );
  }
}
