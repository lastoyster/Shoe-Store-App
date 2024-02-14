import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';

class SelectAreaRadius extends StatefulWidget {
  const SelectAreaRadius({super.key});

  @override
  State<SelectAreaRadius> createState() => _SelectAreaRadiusState();
}

class _SelectAreaRadiusState extends State<SelectAreaRadius> {
  double _sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('How was your \nJourney', style: AppTypography.kBold32),
          SizedBox(height: 100.h),
          Center(child: Image.asset(AppAssets.kAreaRadiusPic)),
          SizedBox(height: 40.h),
          Slider(
            value: _sliderValue,
            activeColor: AppColors.kPrimary,
            onChanged: (newValue) {
              setState(() {
                _sliderValue = newValue;
              });
            },
            min: 0,
            max: 100,
            divisions: 100,
            label: '${_sliderValue.toInt()}',
          ),
        ],
      ),
    );
  }
}
