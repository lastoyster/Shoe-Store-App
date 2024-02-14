import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/widgets/customPaint/slider_thumb_shape.dart';
import 'package:shoe_app/app/modules/widgets/customPaint/slider_track_shape.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.kLightWhite,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.kLightWhite,
        surfaceTintColor: AppColors.kLightWhite,
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          filled: true,
          fillColor: AppColors.kLightWhite2,
          hintStyle: AppTypography.kExtraLight14.copyWith(color: Colors.grey),
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r))),
      sliderTheme: SliderThemeData(
          trackShape: CustomSliderTrackShape(),
          thumbShape: SliderThumbShape(),
          activeTrackColor: AppColors.kPrimary,
          inactiveTrackColor: AppColors.kLightGrey),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.kLightWhite,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.kPrimary,
        unselectedItemColor: AppColors.kDarkWhite,
        selectedLabelStyle: AppTypography.kMedium14,
        unselectedLabelStyle: AppTypography.kMedium14,
      ));

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.kBlack,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.kBlack,
        surfaceTintColor: AppColors.kBlack,
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xFF222222),
          hintStyle:
              AppTypography.kExtraLight14.copyWith(color: AppColors.kDarkWhite),
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.r))),
      sliderTheme: SliderThemeData(
          trackShape: CustomSliderTrackShape(),
          thumbShape: SliderThumbShape(),
          activeTrackColor: AppColors.kPrimary,
          inactiveTrackColor: AppColors.kLightGrey),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.kBlackLight,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.kPrimary,
        unselectedItemColor: AppColors.kDarkWhite,
        selectedLabelStyle: AppTypography.kMedium14,
        unselectedLabelStyle: AppTypography.kMedium14,
      ));
}

SystemUiOverlayStyle defaultOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.black,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);

SystemUiOverlayStyle customOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
);
