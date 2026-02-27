import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami1/features/quran/presentation/screens/widgets/reusable_widget.dart';
import 'package:islami1/features/quran/presentation/screens/widgets/sura_list/sura_list.dart';
import 'package:islami1/features/quran/presentation/screens/widgets/text_form_field/text_form_field_widget.dart';

import '../../../../core/assets/app_assets.dart';
import '../../../../core/widgets/screen_widget.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenWidget(image: AppAssets.quranBG),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                spacing: 20.h,
                children: [
                  SizedBox(height: 220.h),
                  TextFormFieldWidget(textEditingController: controller),
                  ReusableWidget(text: "Most Recently", widget: Placeholder()),
                  ReusableWidget(text: "Suras List", widget: SuraList()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
