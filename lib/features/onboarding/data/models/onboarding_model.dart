import 'package:islami1/core/assets/app_assets.dart';

class OnboardingModel {
  String image;
  String title;
  String? description;
  bool? isLast;

  OnboardingModel({
    required this.image,
    required this.title,
    this.description,
    this.isLast,
  });

  static List<OnboardingModel> list = [
    OnboardingModel(
      image: AppAssets.onboarding1,
      title: "Welcome To Islmi App",
    ),
    OnboardingModel(
      image: AppAssets.onboarding2,
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community",
      isLast: false,
    ),
    OnboardingModel(
      image: AppAssets.onboarding3,
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
      isLast: false,
    ),
    OnboardingModel(
      image: AppAssets.onboarding4,
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
    ),
    OnboardingModel(
      image: AppAssets.onboarding5,
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
      isLast: false,
    ),
  ];
}
