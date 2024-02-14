import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/constants/app_typography.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/models/product_category.dart';
import 'package:shoe_app/app/models/product_model.dart';
import 'package:shoe_app/app/modules/home/components/category_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Search',
          style: AppTypography.kMedium20,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                  hintText: 'Search Your Products',
                  prefixIcon: Icon(CupertinoIcons.search),
                  suffixIcon: Icon(CupertinoIcons.mic)),
            ),
            SizedBox(height: 50.h),
            Text('Popular Products', style: AppTypography.kBold16),
            SizedBox(height: 20.h),
            Wrap(
              spacing: 14.w,
              runSpacing: 14.h,
              children: List.generate(
                  productCategories.length,
                  (index) => CategoryCard(
                        onTap: () {
                          setState(() {
                            _selectedCategory = index;
                          });
                        },
                        category: productCategories[index].name,
                        isSelected: _selectedCategory == index,
                      )),
            ),
            SizedBox(height: 50.h),
            Text('Recommended Products', style: AppTypography.kBold16),
            SizedBox(height: 20.h),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 146 / 150,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 20.h),
                itemCount: discountedProducts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5.h),
                    decoration: BoxDecoration(
                        color: isDarkMode(context)
                            ? AppColors.kBlackLight
                            : discountedProducts[index].bgCol,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      children: [
                        Image.asset(
                          discountedProducts[index].image[0],
                          height: 90.h,
                          fit: BoxFit.fitHeight,
                        ),
                        const Spacer(),
                        Text(
                          discountedProducts[index].name,
                          style: AppTypography.kMedium12,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '\$ ${discountedProducts[index].price.toInt()}',
                          style: AppTypography.kBold14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
