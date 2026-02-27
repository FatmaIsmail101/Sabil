import 'package:flutter/material.dart';

import '../../../../core/assets/app_assets.dart';
import '../../../../core/widgets/screen_widget.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [ScreenWidget(image: AppAssets.timeBG)]),
    );
  }
}
