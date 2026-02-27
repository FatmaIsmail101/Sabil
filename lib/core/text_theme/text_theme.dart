import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami1/core/colors/app_colors.dart';

class TextThemeApp {
  static TextStyle primaryTextTheme24 = TextStyle(
    color: AppColors.primaryColor,
    fontFamily: "Janna",
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle primaryTextTheme20 = TextStyle(
    color: AppColors.primaryColor,
    fontFamily: "Janna",
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle selectedTextTheme12 = TextStyle(
    color: AppColors.selectedWhiteColor,
    fontFamily: "Janna",
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textTheme16 = TextStyle(
    color: AppColors.secondaryColor,
    fontFamily: "Janna",
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );
}
