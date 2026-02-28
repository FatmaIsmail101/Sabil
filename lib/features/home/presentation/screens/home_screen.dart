import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami1/core/assets/app_assets.dart';

import '../../../hadith/presentation/screens/hadith_screen.dart';
import '../../../quran/presentation/screens/quran_screen.dart';
import '../../../radio/presentation/screens/radio_screen.dart';
import '../../../sebha/presentation/screen/sebha_screen.dart';
import '../../../time/presentation/screens/time_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(child: screens[currentIndex]),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AppAssets.moseque,
              fit: BoxFit.contain, // عشان تحافظ على أبعادها
            ),
          ),
        ],
      ),
      // appBar: AppBar(
      //   title: Image.asset(AppAssets.moseque),
      //   centerTitle: true,
      //   toolbarHeight: 151.h,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: .bold,
          fontFamily: "Janna",
          color: Colors.white,
        ),
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },

        showSelectedLabels: true,
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,

        items: [
          BottomNavigationBarItem(
            activeIcon: Container(
              width: 60.w,
              height: 34.h,
              decoration: BoxDecoration(
                color: Color(0xa8202020),
                borderRadius: BorderRadius.circular(66.r),
              ),
              child: Image.asset(AppAssets.quranSelected),
            ),
            icon: Image.asset(AppAssets.quran),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              width: 60.w,
              height: 34.h,
              decoration: BoxDecoration(
                color: Color(0xa8202020),
                borderRadius: BorderRadius.circular(66.r),
              ),
              child: Image.asset(AppAssets.hadithSelected),
            ),
            icon: SvgPicture.asset(AppAssets.hadith),
            label: "Hadith",
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              width: 60.w,
              height: 34.h,
              decoration: BoxDecoration(
                color: Color(0xa8202020),
                borderRadius: BorderRadius.circular(66.r),
              ),
              child: Image.asset(AppAssets.sebhaSelected),
            ),
            icon: SvgPicture.asset(AppAssets.sebha),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              width: 60.w,
              height: 34.h,
              decoration: BoxDecoration(
                color: Color(0xa8202020),
                borderRadius: BorderRadius.circular(66.r),
              ),
              child: Image.asset(AppAssets.radioSelected),
            ),
            icon: Image.asset(AppAssets.radio),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              width: 60.w,
              height: 34.h,
              decoration: BoxDecoration(
                color: Color(0xa8202020),
                borderRadius: BorderRadius.circular(66.r),
              ),
              child: Image.asset(AppAssets.timeSelected),
            ),
            icon: SvgPicture.asset(AppAssets.time),
            label: "Time",
          ),
        ],
      ),
    );
  }

  List<Widget> screens = [
    QuranScreen(),
    HadithScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),
  ];
}
