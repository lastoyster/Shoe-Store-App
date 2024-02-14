import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';

class RememberMeCheckbox extends StatefulWidget {
  final void Function(bool) onRememberChanged;
  const RememberMeCheckbox({super.key, required this.onRememberChanged});

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isRemember = !isRemember;
        });

        widget.onRememberChanged(isRemember);
      },
      child: Row(
        children: [
          Container(
            height: 22.h,
            width: 22.w,
            decoration: BoxDecoration(
                color: isRemember ? AppColors.kPrimary : null,
                borderRadius: BorderRadius.circular(6.r),
                border:
                    !isRemember ? Border.all(color: AppColors.kGrey) : null),
            child: isRemember
                ? Icon(Icons.done, size: 14.h, color: AppColors.kLightWhite)
                : null,
          ),
          SizedBox(width: 10.w),
          Text(
            'Remember',
            style: AppTypography.kMedium12,
          )
        ],
      ),
    );
  }
}
