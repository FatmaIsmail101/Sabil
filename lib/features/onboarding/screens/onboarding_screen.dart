import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami1/config/caching/caching_helper.dart';
import 'package:islami1/core/assets/app_assets.dart';
import 'package:islami1/features/onboarding/data/models/onboarding_model.dart';
import 'package:islami1/features/onboarding/screens/widgets/onboarding_widget.dart';
import 'package:islami1/features/onboarding/screens/widgets/page_indicator.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/routes/route_name.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0.w),
        child: Column(
          spacing: 50.h,
          children: [
            Image.asset(AppAssets.moseque),
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                controller: controller,
                itemCount: OnboardingModel.list.length,
                itemBuilder: (context, index) {
                  return OnboardingBody(model: OnboardingModel.list[index]);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    currentIndex == 0 ? "" : "Back",
                    style: theme.bodyMedium?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                PageIndicator(
                  activeIndex: currentIndex,
                  count: OnboardingModel.list.length,
                ),
                TextButton(
                  onPressed: () async {
                    if (currentIndex == OnboardingModel.list.length - 1) {
                      await CachingHelper.setBool("isSeen", true);
                      // كود الانتقال للشاشة التالية بعد الـ Onboarding
                      Navigator.pushNamed(context, RouteName.home);
                    } else {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    currentIndex == 4 ? "Finish" : "Next",
                    style: theme.bodyMedium?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
