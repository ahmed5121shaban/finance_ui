import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWidget {
  static AppBar buildAppBar({
    required BuildContext context,
    String? title,
    IconData? icon,
    VoidCallback? onPressed,
    Color? color,
    double? iconSize,
    double? width,
    double? height,
    double? radius,
  }) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(title!),
      leading: IconButton(
        iconSize: iconSize ?? 25.sp,
        color: color ?? AppColors.primary,
        style: IconButton.styleFrom(
          minimumSize: Size(width ?? 41.w, height ?? 41.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 12.r),
          ),
          side: BorderSide(color: AppColors.textFieldBorderColor),
        ),
        icon: Icon(icon ?? Icons.arrow_back_ios_new_rounded),
        onPressed: onPressed,
      ),
    );
  }
}
