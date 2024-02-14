import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/home/home_page.dart';
import 'package:shoe_app/app/modules/offers/offer_page.dart';
import 'package:shoe_app/app/modules/setting/setting_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const OfferPage(),
    Container(),
    const SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(10.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: SizedBox(
              height: 70.h,
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppAssets.kHome),
                    activeIcon: SvgPicture.asset(AppAssets.kHomeActive),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(AppAssets.kDiscount),
                      activeIcon: SvgPicture.asset(AppAssets.kDiscountActive),
                      label: 'Offers'),
                  // TODO: Favoerite and Setting Iocn
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(AppAssets.kHeart),
                      activeIcon: SvgPicture.asset(
                        AppAssets.kHeart,
                        colorFilter:
                            ColorFilter.mode(AppColors.kPrimary, BlendMode.srcIn),
                      ),
                      label: 'Favorite'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(AppAssets.kSetting),
                      activeIcon: SvgPicture.asset(
                        AppAssets.kSetting,
                        colorFilter:
                            ColorFilter.mode(AppColors.kPrimary, BlendMode.srcIn),
                      ),
                      label: 'Setting'),
                ],
              ),
            ),
          ),
        ));
  }
}
