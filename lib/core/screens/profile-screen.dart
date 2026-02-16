import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
          child: Column(
            children: [
              _homeScreenHeader(context),
              SizedBox(height: 40.h),
              ClipOval(
                child: Image.asset(
                  AppAssets.profileImage,
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.h),
              _textFieldsGroups("Full Name", "Ahmed Shaban"),
              SizedBox(height: 20.h),
              _textFieldsGroups("Email", "[EMAIL_ADDRESS]"),
              SizedBox(height: 20.h),
              _textFieldsGroups("Phone", "01000000000"),
              SizedBox(height: 20.h),
              _textFieldsGroups("Address", "123 Main St"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _homeScreenHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColors.lightGray),
          ),
          child: Center(
            child: SvgPicture.asset(
              width: 20.w,
              height: 17.h,
              AppAssets.leftArrow,
            ),
          ),
        ),
      ),
      Text("My Profile", style: AppStyles.black18w600),
      Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.lightGray),
        ),
        child: Center(
          child: Row(
            spacing: 2.w,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(width: 5.w, height: 5.h, AppAssets.dot),
              SvgPicture.asset(width: 5.w, height: 5.h, AppAssets.dot),
              SvgPicture.asset(width: 5.w, height: 5.h, AppAssets.dot),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _textFieldsGroups(String label,String value) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: AppStyles.darkGray14w600),
      SizedBox(height: 20.h),
      Text(value, style: AppStyles.bodyMain),
      Divider(color: AppColors.grayLight,thickness: 1.w,),
    ],
  );
}
