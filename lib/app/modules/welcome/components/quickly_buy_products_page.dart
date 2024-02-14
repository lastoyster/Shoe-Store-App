import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';

class QuicklyBUyProductsPage extends StatelessWidget {
  const QuicklyBUyProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Column(
        children: [
          Text('Quickly buy your dream product', style: AppTypography.kBold32),
          SizedBox(height: 45.h),
          Image.asset(AppAssets.kWelcome),
        ],
      ),
    );
  }
}
