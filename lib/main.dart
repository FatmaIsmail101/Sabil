import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/caching/caching_helper.dart';
import 'config/di/di.dart';
import 'core/routes/route_name.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/onboarding/screens/onboarding_screen.dart';
import 'features/quran/presentation/screens/quran_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachingHelper.init();
  configureDependencies();
  runApp(
    ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isSeen = CachingHelper.getBool("isSeen");
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.themeApp,
      initialRoute: isSeen ? RouteName.home : RouteName.onboarding,
      routes: {
        RouteName.onboarding: (context) => OnboardingScreen(),
        RouteName.home: (context) => HomeScreen(),
        RouteName.quranDetails: (context) => QuranDetailsScreen(),
      },
    );
  }
}
