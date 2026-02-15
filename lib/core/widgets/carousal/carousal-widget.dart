import 'package:carousel_slider/carousel_slider.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCarousalWidget extends StatefulWidget {
  const AppCarousalWidget({super.key});
  @override
  State<AppCarousalWidget> createState() => AppCarousalWidgetState();
}

class AppCarousalWidgetState extends State<AppCarousalWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 263.h),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return _carousalCardContainer();
          },
        );
      }).toList(),
    );
  }
}

Widget _carousalCardContainer() {
  return Container(
    height: 263.h,
    width: 207.w,
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    decoration: BoxDecoration(
      color: AppColors.carousalPrimaryColor,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: _carousalCard(),
  );
}

Widget _carousalCard() {
  return Stack(
    children: [
      Text(
        "X-Card",
        style: AppStyles.bodySecondary.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      Column(
        children: [
          Row(
            children: [
              Text("Balance", style: AppStyles.gray12w500),
              Text("23400 EG", style: AppStyles.cardTitle),
            ],
          ),
        ],
      ),
      Row(
        children: [
          Text("Balance", style: AppStyles.gray12w500),
          Text("23400 EG", style: AppStyles.cardTitle),
        ],
      ),
    ],
  );
}
