import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/app/data/constants/app_assets.dart';
import 'package:shoe_app/app/data/constants/app_colors.dart';
import 'package:shoe_app/app/models/product_model.dart';

class DetailPageHeader extends StatefulWidget {
  final ProductModel product;
  const DetailPageHeader({super.key, required this.product});

  @override
  State<DetailPageHeader> createState() => _DetailPageHeaderState();
}

class _DetailPageHeaderState extends State<DetailPageHeader> {
  int _selectedIndex = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 330.h,
      width: double.infinity,
      padding: EdgeInsets.all(20.h),
      color: isDarkMode(context) ? AppColors.kBlackLight : widget.product.bgCol,
      child: Column(
        children: [
          CarouselSlider.builder(
              carouselController: _controller,
              options: CarouselOptions(
                  viewportFraction: 1,
                  height: 250,
                  onPageChanged: (value, reason) {
                    setState(() {
                      _selectedIndex = value;
                    });
                  }),
              itemCount: widget.product.image.length,
              itemBuilder:
                  (BuildContext context, int index, int pageViewIndex) => Hero(
                        tag: widget.product.image,
                        child: Image.asset(
                          widget.product.image[index],
                        ),
                      )),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              DotsIndicator(
                dotsCount: widget.product.image.length,
                position: _selectedIndex,
                decorator: DotsDecorator(
                    activeColor: isDarkMode(context)
                        ? AppColors.kPrimary
                        : AppColors.kBlack),
              ),
              const Spacer(),
              SvgPicture.asset(AppAssets.kHeart),
            ],
          )
        ],
      ),
    );
  }
}
