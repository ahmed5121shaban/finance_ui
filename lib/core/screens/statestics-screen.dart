import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/widgets/app-bar/page-header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class StatesticsScreen extends StatefulWidget {
  const StatesticsScreen({super.key});

  @override
  State<StatesticsScreen> createState() => _StatesticsScreenState();
}

class _StatesticsScreenState extends State<StatesticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
        child: SafeArea(
          child: Column(
            children: [
              PageHeader(title: "My Profile", actions: [
                SvgPicture.asset(width: 5.w, height: 5.h, AppAssets.dot),
                SvgPicture.asset(width: 5.w, height: 5.h, AppAssets.dot),
                SvgPicture.asset(width: 5.w, height: 5.h, AppAssets.dot),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}