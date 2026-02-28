import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami1/features/quran/presentation/screens/widgets/most_recent/most_recent.dart';
import 'package:islami1/features/quran/presentation/screens/widgets/reusable_widget.dart';
import 'package:islami1/features/quran/presentation/screens/widgets/sura_list/sura_list.dart';
import 'package:islami1/features/quran/presentation/screens/widgets/text_form_field/text_form_field_widget.dart';
import 'package:provider/provider.dart';

import '../../../../config/di/di.dart';
import '../../../../core/assets/app_assets.dart';
import '../../../../core/widgets/screen_widget.dart';
import '../view_model/quran_view_model.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<QuranViewModel>()..loadRecentSuras(),
      builder: (context, child) => Scaffold(
        body: Consumer<QuranViewModel>(
          builder: (context, vm, child) => Stack(
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
                      ReusableWidget(
                        text: vm.recentSuras.isEmpty ? "" : "Most Recently",
                        widget: vm.recentSuras.isEmpty
                            ? SizedBox.shrink()
                            : MostRecent(),
                      ),

                      ReusableWidget(text: "Suras List", widget: SuraList()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
