import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondryButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? radius;
  final double? fontSize;
  final FontWeight? fontWeight;
  const SecondryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.radius,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return _secondaryButton(text: text?? "Ahmed", onPressed: onPressed ?? () {}, 
    width: width ?? 331.w, height: height ?? 56.h, radius: radius ?? 8.r, 
    fontSize: fontSize ?? 16.sp, fontWeight: fontWeight ?? FontWeight.w600);
  }
}

Widget _secondaryButton({
  required String text,
  required VoidCallback onPressed,
  required double width,
  required double height,
  required double radius,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      minimumSize: Size(width, height),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.r)),
      side: BorderSide(color: AppColors.primary),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.primary,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    ),
  );
}
