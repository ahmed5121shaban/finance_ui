import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/widgets/carousal/carousal-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 22, right: 22, top: 18),
        child: Column(
          children: [
            _homeScreenHeader(context),
            SizedBox(height: 20.h),
            _carousalWidget(),
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
      Row(
        spacing: 10.w,
        children: [
          ClipOval(
            child: Image.asset(width: 48.w, height: 48.h, AppAssets.profileImage,fit: BoxFit.fill,)
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome back,", style: AppStyles.gray12w500),
              Text("Ahmed Shaban", style: AppStyles.black18w600),
            ],
          ),
        ],
      ),
      Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.lightGray),
        ),
        child: Center(
          child: SvgPicture.asset(width: 20.w, height: 17.h, AppAssets.notification),
        )
      ),
    ],
  );
}

Widget _carousalWidget() {
  return Container(
    child: AppCarousalWidget(),
  );
}