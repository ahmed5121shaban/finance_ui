import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PageHeader extends StatefulWidget {
  final String title;
  final List<Widget> actions;
  const PageHeader({super.key, required this.title, required this.actions});

  @override
  State<PageHeader> createState() => _PageHeaderState();
}

class _PageHeaderState extends State<PageHeader> {
  @override
  Widget build(BuildContext context) {
    return _pageHeader(context, widget.title, widget.actions);
  }
}

Widget _pageHeader(BuildContext context, String title,List<Widget> actions) {
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
      Text(title, style: AppStyles.black18w600),
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
            children: actions,
          ),
        ),
      ),
    ],
  );
}