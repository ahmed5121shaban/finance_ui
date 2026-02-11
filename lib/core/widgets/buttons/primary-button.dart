import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? radius;
  final double? fontSize;
  final FontWeight? fontWeight;
  const PrimaryButton({super.key, this.text, this.onPressed, this.width, this.height, this.radius, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return _primaryButton(text: text ?? "Ahmed", onPressed: onPressed ?? () {},
     width: width ?? 331.w, height: height ?? 56.h, radius: radius ?? 8.r,
      fontSize: fontSize ?? 16.sp,
       fontWeight: fontWeight ?? FontWeight.w600);
  }
}

Widget _primaryButton({required String text, required VoidCallback onPressed, required double width, required double height, required double radius, required double fontSize, required FontWeight fontWeight}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      minimumSize: Size(width, height),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.r)),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.white,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    ),
  );
}