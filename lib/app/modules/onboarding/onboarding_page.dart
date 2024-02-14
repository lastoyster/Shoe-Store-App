import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/onboarding/components/onboarding_card.dart';
import 'package:shoe_app/app/modules/widgets/buttons/circular_icon_button.dart';
import 'package:shoe_app/app/routes/app_routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentIndex = 0;
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(
        isDarkMode(context) ? defaultOverlay : customOverlay);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: PageView(
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            children: [
              OnboardingCard(
                  image: AppAssets.kOnboardingPic1,
                  playAnimation: true,
                  title: 'Welcome To Online Store',
                  description: 'Let’s choose the best shoes from here'),
              OnboardingCard(
                  image: AppAssets.kOnboardingPic2,
                  playAnimation: true,
                  title: 'Choose Smart Shoes',
                  description: 'Choose the most altractive shoes for your'),
              OnboardingCard(
                  image: AppAssets.kOnboardingPic3,
                  playAnimation: true,
                  title: 'Let’s Go To The Store',
                  description:
                      'We are providing the best service to the customer'),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularIconButton(
                onTap: _currentIndex > 0
                    ? () {
                        _controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.fastEaseInToSlowEaseOut);
                      }
                    : null,
                icon: AppAssets.kDirectionLeft,
              ),
              SizedBox(width: 28.w),
              RichText(
                  text: TextSpan(
                      text: '$_currentIndex / ',
                      style: AppTypography.kBold14
                          .copyWith(color: AppColors.kPrimary),
                      children: [
                    TextSpan(
                        text: '3',
                        style: AppTypography.kExtraLight14.copyWith(
                            color: isDarkMode(context)
                                ? AppColors.kLightWhite
                                : AppColors.kBlack))
                  ])),
              SizedBox(width: 28.w),
              CircularIconButton(
                onTap: () {
                  if (_currentIndex <= 1) {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastEaseInToSlowEaseOut);
                  } else {
                    Get.offAllNamed(AppRoutes.getSignUpPageRoute());
                  }
                },
                icon: AppAssets.kDirectionRight,
              )
            ],
          ),
          SizedBox(height: 20.h)
        ],
      ),
    );
  }
}
