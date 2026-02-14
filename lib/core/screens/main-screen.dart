import 'package:finance_ui/core/screens/home-screen.dart';
import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    HomeScreen(),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.greenAccent,
      child: Center(
        child: Text(
          "Business",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.amberAccent,
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
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.greenAccent,
      child: Center(
        child: Text(
          "Business",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.amberAccent,
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
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.chart),
            label: "Business",
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: SvgPicture.asset(AppAssets.vector),
            ),
            label: "School",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.wallet),
            label: "Business",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.profile),
            label: "School",
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Center(child: screens[_selectedIndex]),
      ),
    );
  }
}


