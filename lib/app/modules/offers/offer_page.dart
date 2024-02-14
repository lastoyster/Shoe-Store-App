import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/models/product_category.dart';
import 'package:shoe_app/app/modules/home/components/category_card.dart';
import 'package:shoe_app/app/modules/offers/offer_card.dart';
import 'package:shoe_app/app/modules/widgets/appbar/primary_appbar.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({super.key});

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  int _selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
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
              OfferCard(
                onTap: () {},
                title: 'Sunglass+',
                description: 'This month best offer for you',
                image: AppAssets.kSunglasses,
                linearGradient: AppColors.kGradient2,
              ),
              SizedBox(height: 16.h),
              OfferCard(
                  onTap: () {},
                  title: 'Shoes+',
                  description: 'This month best offer for you',
                  image: AppAssets.kDiscountProduct),
            ],
          ),
        ),
      ),
    );
  }
}
