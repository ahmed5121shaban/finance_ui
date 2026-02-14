import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
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
          _headChape(context, AppAssets.google),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome back,", style: AppStyles.gray12w500),
              Text("John Doe", style: AppStyles.black18w600),
            ],
          ),
        ],
      ),
      _headChape(context, AppAssets.wallet),
    ],
  );
}

Container _headChape(BuildContext context, String asset) {
  return Container(
    width: 41.w,
    height: 41.h,
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: AppColors.textFieldBorderColor),
    ),
    child: SvgPicture.asset(width: 48.w, height: 48.h, asset),
  );
}