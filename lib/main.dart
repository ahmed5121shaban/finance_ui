import 'package:finance_ui/core/router/router-generator.dart';
import 'package:finance_ui/core/styling/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp.router(
        routerConfig: RouterGenerator.generateRoute,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
