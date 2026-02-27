import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami1/core/assets/app_assets.dart';
import 'package:islami1/core/colors/app_colors.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({
    super.key,
    required this.index,
    required this.suraNameAr,
    required this.suraNameEn,
    required this.versusNumber,
  });
  final int index;
  final String suraNameEn;
  final String suraNameAr;
  final int versusNumber;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Stack(
          alignment: .center,
          children: [
            Image.asset(AppAssets.quranSuraListIcon),
            Text(
              "$index",
              style: textTheme.titleMedium?.copyWith(
                color: AppColors.selectedWhiteColor,
              ),
            ),
          ],
        ),
        SizedBox(width: 10.w),
        Column(
          spacing: 10.h,
          crossAxisAlignment: .start,
          children: [
            Text(
              suraNameEn,
              style: textTheme.titleMedium?.copyWith(
                color: AppColors.selectedWhiteColor,
                fontSize: 14.sp,
              ),
            ),
            Text(
              "$versusNumber versus",
              style: textTheme.titleMedium?.copyWith(
                color: AppColors.selectedWhiteColor,
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          suraNameAr,
          style: textTheme.titleMedium?.copyWith(
            color: AppColors.selectedWhiteColor,
          ),
        ),
      ],
    );
  }
}
