import 'package:finance_ui/core/constants/auth-data.dart';
import 'package:finance_ui/core/router/router-paths.dart';
import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/widgets/buttons/primary-button.dart';
import 'package:finance_ui/core/widgets/inputs/text-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  bool isPassword = false;
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
                    isEmail: true,
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
                  SizedBox(height: 20.h),
                  TextFieldWidget(
                    hint: "Enter your password",
                    isPassword: isPassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(
                        isPassword
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.gray,
                      ),
                    ),
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  _forgotPassword(context),
                  SizedBox(height: 16.h),
                  PrimaryButton(
                    text: "Login",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_emailController.text == AuthData.email &&
                            _passwordController.text == AuthData.password) {
                          GoRouter.of(context).go(RouterPaths.otpVerification);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Invalid email or password",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: AppColors.primary,
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  SizedBox(height: 16.h),
                  _throwLineText(text: "Or Login with"),
                  SizedBox(height: 10.h),
                  _socialButtons(),
                  SizedBox(height: 150.h),
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

Text _headText() {
  return Text(
    "Welcome back! \n Again!",
    textAlign: TextAlign.start,
    style: AppStyles.headPrimary,
  );
}

Widget _throwLineText({String text = "OR"}) {
  return Row(
    spacing: 10,
    children: [
      Expanded(child: Divider(color: AppColors.gray, thickness: 1)),
      Text(text, style: AppStyles.darkGray14w600),
      Expanded(child: Divider(color: AppColors.gray, thickness: 1)),
    ],
  );
}

Widget _socialButtons() {
  return Row(
    spacing: 5.w,
    children: [
      InkWell(
        onTap: () {},
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
        onTap: () {},
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
        onTap: () {},
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

Container _forgotPassword(BuildContext context) {
  return Container(
    alignment: Alignment.centerRight,
    child: InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: () {
        GoRouter.of(context).push(RouterPaths.forgotPassword);
      },
      child: Text("Forgot Password?", style: AppStyles.primary15w500underline),
    ),
  );
}

Widget _doYouHaveAccount(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ", style: AppStyles.primary15w500),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            overlayColor: Colors.transparent,
          ),
          onPressed: () {
            GoRouter.of(context).push(RouterPaths.register);
          },
          child: Text("Register Now", style: AppStyles.black15w500),
        ),
      ],
    ),
  );
}
