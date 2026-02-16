import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AllCardsScreen extends StatefulWidget {
  const AllCardsScreen({super.key});

  @override
  State<AllCardsScreen> createState() => _AllCardsScreenState();
}

class _AllCardsScreenState extends State<AllCardsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
        child: Column(
          children: [
            _homeScreenHeader(context),
            SizedBox(height: 20.h),
            _cardBody("Ahmed", AppColors.primary),
            SizedBox(height: 20.h),
            _cardBody("Ahmed", Color(0xff4151a6)),
          ],
        ),
      ),
    );
  }
}

Widget _homeScreenHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColors.lightGray),
          ),
          child: Center(
            child: SvgPicture.asset(
              width: 20.w,
              height: 17.h,
              AppAssets.leftArrow,
            ),
          ),
        ),
      ),
      Text("All Cards", style: AppStyles.black18w600),
      Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.lightGray),
        ),
        child: Center(
          child: Row(
            spacing: 2.w,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(width: 5.w, height: 5.h, AppAssets.dot),
              SvgPicture.asset(width: 5.w, height: 5.h, AppAssets.dot),
              SvgPicture.asset(width: 5.w, height: 5.h, AppAssets.dot),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _cardBody(String cardName, Color color) {
  return Stack(
    children: [
      Container(
        width: 327.w,
        height: 179.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.symmetric(
            horizontal: BorderSide(color: AppColors.gray),
            vertical: BorderSide(color: AppColors.gray),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("X-Card", style: AppStyles.white12w700),
                SvgPicture.asset(height: 16.h, width: 52.w, AppAssets.visa),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Balance", style: AppStyles.white16w500.copyWith(
                  fontSize: 14.sp,
                ),textAlign: TextAlign.center,),
                Text("3209 EG", style: AppStyles.white24w600),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("****  4545", style: AppStyles.white16w500.copyWith(
                  fontWeight: FontWeight.w500,
                )),
                Text("12/25", style: AppStyles.white16w500.copyWith(
                  fontSize: 16.sp,
                )),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        child: Image.asset(
          AppAssets.layer1,
          fit: BoxFit.fill,
          width: 100.w,
          height: 110.h,
        ),
      ),
      Positioned(
        bottom: 0,
        child: Image.asset(
          AppAssets.layer2,
          fit: BoxFit.fill,
          width: 160.w,
          height: 170.h,
        ),
      ),
    ],
  );
}
