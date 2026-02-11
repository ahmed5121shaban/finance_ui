import 'dart:async';

import 'package:finance_ui/core/router/router-paths.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/widgets/buttons/primary-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();
  final StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  String currentText = "";
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
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    textStyle: TextStyle(
                      color: AppColors.primary,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      fieldHeight: 60.h,
                      fieldWidth: 70.w,
                      activeFillColor: AppColors.white,
                      selectedFillColor: AppColors.white,
                      inactiveFillColor: AppColors.lightGray,
                      activeColor: AppColors.gray,
                      inactiveColor: AppColors.textFieldBorderColor,
                      selectedColor: AppColors.primary,
                    ),
                    cursorColor: AppColors.primary,
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: AppColors.white,
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      return true;
                    },
                  ),
                  SizedBox(height: 16.h),
                  PrimaryButton(
                    text: "Verify",
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
        "OTP Verification",
        textAlign: TextAlign.start,
        style: AppStyles.headPrimary,
      ),
      SizedBox(height: 10.h),
      Text(
        "Enter the verification code we just sent on your email address.",
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
        Text("Didn’t received code? ", style: AppStyles.primary15w500),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            overlayColor: Colors.transparent,
          ),
          onPressed: () => GoRouter.of(context).go(RouterPaths.forgotPassword),
          child: Text("Resend", style: AppStyles.black15w500),
        ),
      ],
    ),
  );
}
