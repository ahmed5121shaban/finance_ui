import 'package:finance_ui/core/screens/all-cards-screen.dart';
import 'package:finance_ui/core/screens/home-screen.dart';
import 'package:finance_ui/core/screens/profile-screen.dart';
import 'package:finance_ui/core/screens/statestics-screen.dart';
import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> screens = [
    HomeScreen(),
    StatesticsScreen(),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color.fromARGB(255, 69, 3, 120),
      child: Center(
        child: Text(
          "School",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
    AllCardsScreen(),
    ProfileScreen(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.home,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 0 ? AppColors.primary : AppColors.gray,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.chart,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 1 ? AppColors.primary : AppColors.gray,
                BlendMode.srcIn,
              ),
            ),
            label: "Business",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.vector,
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.wallet,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 3 ? AppColors.primary : AppColors.gray,
                BlendMode.srcIn,
              ),
            ),
            label: "Business",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.profile,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 4 ? AppColors.primary : AppColors.gray,
                BlendMode.srcIn,
              ),
            ),
            label: "School",
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: screens),
    );
  }
}
