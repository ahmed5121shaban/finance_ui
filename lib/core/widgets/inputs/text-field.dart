import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hint;
  final double? width;
  final Widget? suffixIcon;
  final bool? isPassword;
  final bool? isEmail;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  const TextFieldWidget(
    {
      super.key,
      this.hint,
      this.width,
      this.suffixIcon,
      this.isPassword,
      this.isEmail,
      this.controller,
      this.validator
    }
    );

  @override
  Widget build(BuildContext context) {
    return _textField(
      hint: hint,
      width: width,
      suffixIcon: suffixIcon,
      isPassword: isPassword,
      isEmail: isEmail,
      controller: controller,
      validator: validator
    );
  }
}

Widget _textField({String? hint, double? width, Widget? suffixIcon, bool? isPassword, bool? isEmail, TextEditingController? controller, FormFieldValidator<String>? validator}) {
  return SizedBox(
    width: width ?? 331.w,
    child: TextFormField(
      keyboardType: isEmail == true ? TextInputType.emailAddress : TextInputType.text,
      obscureText: isPassword ?? false,
      autofocus: false,
      controller: controller,
      validator: validator,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        fillColor: AppColors.textFieldBackgroundColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor,
          ),
        ),
        hintText: hint,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
          color: AppColors.hintsColor,
          fontFamily: AppFonts.mainFont,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}