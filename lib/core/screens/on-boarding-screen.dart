import 'package:finance_ui/core/router/router-paths.dart';
import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/widgets/buttons/primary-button.dart';
import 'package:finance_ui/core/widgets/buttons/secondry-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.onBoardingImage,
                width: 375.w,
                height: 570.h,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.h),
              PrimaryButton(
                text: "Login",
                onPressed: () => GoRouter.of(context).push(RouterPaths.login),
                width: 331.w,
                height: 56.h,
                radius: 8.r,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 16.h),
              SecondryButton(
                text: "Register",
                onPressed: () =>
                    GoRouter.of(context).push(RouterPaths.register),
                width: 331.w,
                height: 56.h,
                radius: 8.r,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 25.h),
              _guestButton(context),
            ],
          ),
        ),
      ),
    );
  }
}

InkWell _guestButton(BuildContext context) {
  return InkWell(
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    onTap: () => GoRouter.of(context).push(RouterPaths.screens),
    child: Text(
      "Continue as a guest",
      style: AppStyles.black15w700underline,
    ),
  );
}
