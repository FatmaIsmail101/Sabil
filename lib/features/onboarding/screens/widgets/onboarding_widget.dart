import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/onboarding_model.dart';

class OnboardingBody extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingBody({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        spacing: 50.h,
        children: [
          Image.asset(model.image),

          Text(
            model.title,
            style: theme.titleLarge, // اللي عملناه سوا!
          ),

          Text(
            model.description ?? "",
            style: theme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
