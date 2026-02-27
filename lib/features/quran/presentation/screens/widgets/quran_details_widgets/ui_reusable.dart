import 'package:flutter/material.dart';
import 'package:islami1/core/assets/app_assets.dart';

class UiReusable extends StatelessWidget {
  const UiReusable({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Image.asset(AppAssets.quranDetails1),
        Text(title, style: textStyle.titleMedium),
        Image.asset(AppAssets.quranDetails2),
      ],
    );
  }
}
