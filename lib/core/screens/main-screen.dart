import 'package:finance_ui/core/router/router-paths.dart';
import 'package:finance_ui/core/widgets/buttons/primary-button.dart';
import 'package:finance_ui/core/widgets/buttons/secondry-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16.h,
            children: [
              PrimaryButton(
                text: "Password Changed",
                onPressed: () {
                  GoRouter.of(context).push(RouterPaths.passwordChanged);
                },
                width: 331.w,
                height: 56.h,
                radius: 8.r,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SecondryButton(
                text: "Create New Password",
                onPressed: () {
                  GoRouter.of(context).push(RouterPaths.createNewPassword);
                },
                width: 331.w,
                height: 56.h,
                radius: 8.r,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              PrimaryButton(
                text: "OTP Verification",
                onPressed: () {
                  GoRouter.of(context).push(RouterPaths.otpVerification);
                },
                width: 331.w,
                height: 56.h,
                radius: 8.r,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
