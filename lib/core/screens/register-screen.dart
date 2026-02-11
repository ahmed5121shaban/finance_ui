import 'package:finance_ui/core/router/router-paths.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/widgets/buttons/primary-button.dart';
import 'package:finance_ui/core/widgets/cards/social-media-cards.dart';
import 'package:finance_ui/core/widgets/inputs/text-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isPassword = true;
  bool isConfirmPassword = true;
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
                    hint: "Enter your name",
                    controller: _userNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  TextFieldWidget(
                    isEmail: true,
                    hint: "Enter your email",
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if(!value.contains("@")) {
                        return 'Please enter a valid email';
                      }
                      if(value.length < 6) {
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
                      if(value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  TextFieldWidget(
                    hint: "Confirm password",
                    isPassword: isConfirmPassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isConfirmPassword = !isConfirmPassword;
                        });
                      },
                      icon: Icon(
                        isConfirmPassword
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.gray,
                      ),
                    ),
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if(value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      if(value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  PrimaryButton(text: "Register", onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      
                    }
                  }),
                  SizedBox(height: 16.h),
                  _throwLineText(text: "Or Register with"),
                  SizedBox(height: 10.h),
                  SocialMediaCards(onAppleTap: () {}, onFacebookTap: () {}, onGoogleTap: () {},),
                  SizedBox(height: 50.h),
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
    "Hello! Register to get\nstarted",
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

Container _forgotPassword() {
  return Container(
    alignment: Alignment.centerRight,
    child: InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: () {},
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
        Text("Already have an account?", style: AppStyles.primary15w500),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            overlayColor: Colors.transparent,
          ),
          onPressed: () => GoRouter.of(context).go(RouterPaths.login),
          child: Text("Login Now", style: AppStyles.black15w500),
        ),
      ],
    ),
  );
}
