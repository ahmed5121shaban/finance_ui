import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:finance_ui/core/widgets/buttons/primary-button.dart';
import 'package:finance_ui/core/widgets/inputs/text-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
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
                  PrimaryButton(text: "Reset Password", onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      
                    }
                  }),
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
        "Create new password",
        textAlign: TextAlign.start,
        style: AppStyles.headPrimary,
      ),
      SizedBox(height: 10.h),
      Text(
        "Your new password must be unique from those previously used.",
        textAlign: TextAlign.start,
        style: AppStyles.secondary16w500,
      ),
    ],
  );
}
