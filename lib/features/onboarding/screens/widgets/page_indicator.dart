import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/app_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.activeIndex, required this.count});

  final int activeIndex; // الصفحة اللي واقفين عليها حالياً
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      children: List.generate(count, (index) {
        return AnimatedContainer(
          height: index == activeIndex ? 7.h : 7.h,
          width: index == activeIndex ? 18.w : 7.w,
          decoration: BoxDecoration(
            color: index == activeIndex
                ? AppColors.primaryColor
                : Color(0xff707070),
            borderRadius: BorderRadius.circular(
              index == activeIndex ? 28.r : 5.r,
            ),
          ),
          duration: const Duration(milliseconds: 300),
        );
      }),
    );
  }
}
