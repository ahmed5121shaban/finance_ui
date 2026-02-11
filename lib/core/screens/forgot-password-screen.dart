import 'package:finance_ui/core/router/router-paths.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/widgets/buttons/primary-button.dart';
import 'package:finance_ui/core/widgets/cards/social-media-cards.dart';
import 'package:finance_ui/core/widgets/inputs/text-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 12.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headChape(context),
                  SizedBox(height: 20.h),
                  _headText(),
                  SizedBox(height: 20.h),
                  TextFieldWidget(
                    hint: "Enter your email",
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains("@")) {
                        return 'Please enter a valid email';
                      }
                      if (value.length < 6) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  PrimaryButton(
                    text: "Send Code",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  ),
                  SizedBox(height: 350.h),
                  _doYouHaveAccount(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Container _headChape(BuildContext context) {
  return Container(
    width: 41.w,
    height: 41.h,
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: AppColors.textFieldBorderColor),
    ),
    child: IconButton(
      onPressed: () => GoRouter.of(context).pop(),
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.primary,
        size: 25.sp,
      ),
    ),
  );
}

Column _headText() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Forgot Password?",
        textAlign: TextAlign.start,
        style: AppStyles.headPrimary,
      ),
      SizedBox(height: 10.h),
      Text(
        "Don't worry! It occurs. Please enter the email address linked with your account.",
        textAlign: TextAlign.start,
        style: AppStyles.secondary16w500,
      ),
    ],
  );
}

Widget _doYouHaveAccount(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Remember Password?", style: AppStyles.primary15w500),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            overlayColor: Colors.transparent,
          ),
          onPressed: () => GoRouter.of(context).go(RouterPaths.login),
          child: Text("Login", style: AppStyles.black15w500),
        ),
      ],
    ),
  );
}
