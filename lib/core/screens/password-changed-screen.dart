import 'package:finance_ui/core/router/router-paths.dart';
import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/widgets/buttons/primary-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10.h,
            children: [
              SvgPicture.asset(AppAssets.sticker),
              Text("Password Changed", style: AppStyles.primary26w700),
              Text(
                "Your password has been changed\nsuccessfully.",
                textAlign: TextAlign.center,
                style: AppStyles.secondary15w500,
              ),
              PrimaryButton(
                text: "Back to Login",
                onPressed: () => GoRouter.of(context).push(RouterPaths.login),
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
