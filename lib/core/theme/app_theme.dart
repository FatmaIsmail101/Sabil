import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami1/core/colors/app_colors.dart';

class AppTheme {
  static ThemeData get themeApp {
    return ThemeData(
      useMaterial3: true,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: AppColors.primaryColor,
          fontFamily: "Janna",
          fontSize: 24.sp,
          fontWeight: .bold,
        ),
        titleMedium: TextStyle(
          color: AppColors.primaryColor,
          fontFamily: "Janna",
          fontSize: 20.sp,
          fontWeight: .bold,
        ),
        titleSmall: TextStyle(
          color: AppColors.selectedWhiteColor,
          fontFamily: "Janna",
          fontSize: 12.sp,
          fontWeight: .bold,
        ),
        bodyMedium: TextStyle(
          color: AppColors.secondaryColor,
          fontFamily: "Janna",
          fontSize: 16.sp,
          fontWeight: .bold,
        ),
      ),
      primaryColor: AppColors.secondaryColor,
      scaffoldBackgroundColor: AppColors.secondaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.secondaryColor,
        titleTextStyle: TextStyle(
          color: AppColors.primaryColor,
          fontFamily: "Janna",
          fontSize: 24.sp,
          fontWeight: .bold,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor,

        selectedItemColor: AppColors.selectedWhiteColor,
        unselectedItemColor: AppColors.secondaryColor,
        selectedIconTheme: IconThemeData(color: AppColors.selectedWhiteColor),
        unselectedIconTheme: IconThemeData(color: AppColors.secondaryColor),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: .bold,
          fontFamily: "Janna",
          color: AppColors.selectedWhiteColor,
        ),
        showSelectedLabels: true,
      ),
    );
  }
}
