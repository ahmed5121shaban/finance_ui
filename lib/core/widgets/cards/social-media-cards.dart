import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaCards extends StatelessWidget {
  final Function() onFacebookTap;
  final Function() onGoogleTap;
  final Function() onAppleTap;
  const SocialMediaCards({super.key, required this.onFacebookTap, required this.onGoogleTap, required this.onAppleTap});

  @override
  Widget build(BuildContext context) {
    return _socialButtons(onGoogleTap, onFacebookTap, onAppleTap);
  }
}

Widget _socialButtons(Function() onGoogleTap, Function() onFacebookTap, Function() onAppleTap) {
  return Row(
    spacing: 5.w,
    children: [
      InkWell(
        onTap: onGoogleTap,
        child: Container(
          height: 56.h,
          width: 105.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.textFieldBorderColor),
          ),
          child: SvgPicture.asset(AppAssets.google, height: 26.h, width: 26.w),
        ),
      ),
      InkWell(
        onTap: onFacebookTap,
        child: Container(
          height: 56.h,
          width: 105.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.textFieldBorderColor),
          ),
          child: SvgPicture.asset(
            AppAssets.facebook,
            height: 26.h,
            width: 26.w,
          ),
        ),
      ),
      InkWell(
        onTap: onAppleTap,
        child: Container(
          height: 56.h,
          width: 105.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.textFieldBorderColor),
          ),
          child: SvgPicture.asset(AppAssets.apple, height: 26.h, width: 26.w),
        ),
      ),
    ],
  );
}
