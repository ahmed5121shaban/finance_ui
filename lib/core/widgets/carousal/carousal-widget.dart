import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/widgets/cards/card-items-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCarousalWidget extends StatefulWidget {
  const AppCarousalWidget({super.key});
  @override
  State<AppCarousalWidget> createState() => AppCarousalWidgetState();
}

class AppCarousalWidgetState extends State<AppCarousalWidget> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 263.h,
            padEnds: false,
            viewportFraction: 0.6,
            enlargeFactor: 0.1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return CardItemsWidget(
                  color: i % 2 == 0
                      ? AppColors.grayBlack
                      : AppColors.carousalPrimaryColor,
                  cardName: "X-Card",
                  balance: "23400 EG",
                  cardNumber: "****  3434",
                  expiryDate: "12/24",
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 20.h),
        DotsIndicator(
          dotsCount: 5,
          position: currentPage.toDouble(),
          decorator: DotsDecorator(
            activeColor: AppColors.primary,
            color: AppColors.lightGray,
            spacing: EdgeInsets.all(3.0.w),
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
