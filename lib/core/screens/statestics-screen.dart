import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/widgets/app-bar/page-header.dart';
import 'package:fl_chart/fl_chart.dart';
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
              PageHeader(
                title: "My Profile",
                actions: [
                  SvgPicture.asset(width: 5.w, height: 5.h, AppAssets.dot),
                  SvgPicture.asset(width: 5.w, height: 5.h, AppAssets.dot),
                  SvgPicture.asset(width: 5.w, height: 5.h, AppAssets.dot),
                ],
              ),
              SizedBox(height: 40.h),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: BarChart(
                  BarChartData(
                    titlesData: titlesData,
                    borderData: borderData,
                    barGroups: barGroups,
                    gridData: const FlGridData(show: true),
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 8,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _cardWidget(AppAssets.wallet, "15000 EGP", "Income"),
                  _cardWidget(AppAssets.sendMony, "15000 EGP", "Outcome"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget getTitles(double value, TitleMeta meta) {
  final style = TextStyle(
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text = switch (value.toInt()) {
    0 => 'jan',
    1 => 'feb',
    2 => 'mar',
    3 => 'apr',
    4 => 'may',
    _ => '',
  };
  return SideTitleWidget(
    meta: meta,
    space: 4,
    child: Text(text, style: style),
  );
}

FlTitlesData get titlesData => FlTitlesData(
  show: true,
  bottomTitles: AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 30,
      getTitlesWidget: getTitles,
    ),
  ),
  leftTitles: AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      interval: 2,
      getTitlesWidget: (value, meta) => Text(
        "${value.toInt()} k",
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
  ),
  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
);

FlBorderData get borderData => FlBorderData(show: false);

List<BarChartGroupData> get barGroups => [
  BarChartGroupData(
    x: 0,
    barRods: [
      BarChartRodData(
        toY: 6,
        color: AppColors.primary,
        width: 12.w,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      BarChartRodData(
        toY: 5,
        color: AppColors.blue,
        width: 12.w,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
    ],
  ),
  BarChartGroupData(
    x: 1,
    barRods: [
      BarChartRodData(
        toY: 5,
        color: AppColors.primary,
        width: 12.w,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      BarChartRodData(
        toY: 2,
        color: AppColors.blue,
        width: 12.w,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
    ],
  ),
  BarChartGroupData(
    x: 2,
    barRods: [
      BarChartRodData(
        toY: 8,
        color: AppColors.primary,
        width: 12.w,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      BarChartRodData(
        toY: 5,
        color: AppColors.blue,
        width: 12.w,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
    ],
  ),
  BarChartGroupData(
    x: 3,
    barRods: [
      BarChartRodData(
        toY: 6,
        color: AppColors.primary,
        width: 12.w,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      BarChartRodData(
        toY: 3,
        color: AppColors.blue,
        width: 12.w,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
    ],
  ),
  BarChartGroupData(
    x: 4,
    barRods: [
      BarChartRodData(
        toY: 5,
        color: AppColors.primary,
        width: 12.w,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      BarChartRodData(
        toY: 2,
        color: AppColors.blue,
        width: 12.w,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
    ],
  ),
];
 
 Widget _cardWidget(String icon,String title,String subtitle){
  return Container(
      height: 140.h,
      width: 156.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.lightGray),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 7.r, bottom: 7.r,left: 10.r,right: 10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.h,
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: SvgPicture.asset(icon),
              ),
            ),
            Text(title, style: AppStyles.bodyMain),
            Text(subtitle, style: AppStyles.gray12w500),
          ],
        ),
      ),
    );
 }