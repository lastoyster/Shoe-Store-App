import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoe_app/app/controllers/theme_controller.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/routes/app_routes.dart';
import 'package:shoe_app/app/services/theme_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(defaultOverlay);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shoe App',
            useInheritedMediaQuery: true,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: getThemeMode(themeController.theme),
            scrollBehavior: const ScrollBehavior()
                .copyWith(physics: const BouncingScrollPhysics()),
            defaultTransition: Transition.fadeIn,
            home: child,
            initialRoute: AppRoutes.startingPage,
            getPages: AppRoutes.routes,
          ),
        );
      },
    );
  }
}
