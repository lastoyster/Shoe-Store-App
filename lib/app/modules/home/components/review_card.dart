import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60'),
        ),
        SizedBox(width: 14.w),
        Expanded(
            child: Column(
          children: [
            Text(
                'Trendy Shoes For Man With High Quality Fabrics And Breathable Outdoor Sport Sneakers.',
                style: AppTypography.kExtraLight12),
            SizedBox(height: 8.h),
            Row(
              children: [
                ...List.generate(
                    5,
                    (index) =>
                        Icon(Icons.star, size: 14.h, color: AppColors.kOrange)),
                SizedBox(width: 10.w),
                Text('2 hours ago', style: AppTypography.kExtraLight12),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: List.generate(
                  4,
                  (index) => Container(
                        margin: EdgeInsets.only(right: 10.w),
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                            color: AppColors.kGrey,
                            borderRadius: BorderRadius.circular(10.r),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://img.freepik.com/free-photo/pair-trainers_144627-3800.jpg?size=626&ext=jpg&ga=GA1.1.430249134.1693248538&semt=ais'),
                                fit: BoxFit.cover)),
                      )),
            )
          ],
        ))
      ],
    );
  }
}
