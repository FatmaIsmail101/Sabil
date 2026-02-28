import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami1/core/assets/app_assets.dart';

import '../../../../../../../core/colors/app_colors.dart';

class MostRecentWidget extends StatelessWidget {
  const MostRecentWidget({
    super.key,
    required this.suraNameEn,
    required this.suraNameAr,
    required this.versusNumber,
  });
  final String suraNameAr;
  final String suraNameEn;
  final int versusNumber;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.r),
      // width: 284.w,
      height: 150.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.h,
            children: [
              Text(
                suraNameEn,
                style: textStyle.titleLarge?.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                suraNameAr,
                style: textStyle.titleLarge?.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                "${versusNumber.toString()} Verses",
                style: textStyle.titleLarge?.copyWith(
                  color: AppColors.secondaryColor,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          Image.asset(AppAssets.mostRecentImage),
        ],
      ),
    );
  }
}
