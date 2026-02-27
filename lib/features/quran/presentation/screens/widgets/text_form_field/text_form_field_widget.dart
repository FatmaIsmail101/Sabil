import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami1/core/assets/app_assets.dart';
import 'package:islami1/core/colors/app_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({super.key, required this.textEditingController});
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      controller: textEditingController,
      style: theme.bodyMedium?.copyWith(color: AppColors.selectedWhiteColor),
      decoration: InputDecoration(
        hintText: "Sura Name",
        hintStyle: theme.bodyMedium?.copyWith(
          color: AppColors.selectedWhiteColor,
        ),
        prefixIcon: Image.asset(AppAssets.searchIC),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        focusColor: AppColors.primaryColor,
      ),
    );
  }
}
