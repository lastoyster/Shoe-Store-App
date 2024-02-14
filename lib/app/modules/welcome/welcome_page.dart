import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/modules/welcome/components/map_permission_page.dart';
import 'package:shoe_app/app/modules/welcome/components/quickly_buy_products_page.dart';
import 'package:shoe_app/app/modules/welcome/components/select_area_radius.dart';
import 'package:shoe_app/app/modules/widgets/buttons/primary_button.dart';
import 'package:shoe_app/app/routes/app_routes.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          if (_currentIndex > 0) {
            _controller.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear);
          }
        },
        icon: const Icon(Icons.close),
      )),
      body: Column(
        children: [
          Expanded(
              child: PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            children: [
              MapPermissionPage(
                allowOnceCallback: () {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
                notAllowCallback: () {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
                whileUsingAppCallback: () {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
              ),
              const SelectAreaRadius(),
              const QuicklyBUyProductsPage()
            ],
          )),
        ],
      ),
      bottomSheet: _currentIndex != 0
          ? Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: EdgeInsets.all(20.h),
              child: PrimaryButton(
                onTap: () {
                  if (_currentIndex != 2) {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                  } else {
                    Get.offAllNamed(AppRoutes.getLandingPageRoute());
                  }
                },
                text: 'Continue',
              ),
            )
          : null,
    );
  }
}
