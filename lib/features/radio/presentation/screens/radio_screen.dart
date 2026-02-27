import 'package:flutter/material.dart';

import '../../../../core/assets/app_assets.dart';
import '../../../../core/widgets/screen_widget.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [ScreenWidget(image: AppAssets.radioBG)]),
    );
  }
}
