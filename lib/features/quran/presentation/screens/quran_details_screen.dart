import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami1/core/assets/app_assets.dart';
import 'package:islami1/core/colors/app_colors.dart';
import 'package:islami1/features/quran/presentation/screens/widgets/quran_details_widgets/ayat_widget.dart';
import 'package:islami1/features/quran/presentation/screens/widgets/quran_details_widgets/ui_reusable.dart';
import 'package:provider/provider.dart';

import '../../../../config/states/states.dart';
import '../../data/model/sura_identity.dart';
import '../view_model/quran_state.dart';
import '../view_model/quran_view_model.dart';

class QuranDetailsScreen extends StatelessWidget {
  const QuranDetailsScreen({super.key, this.index, this.suraIdentityModel});

  final int? index;

  final SuraIdentity? suraIdentityModel;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final state = context.watch<QuranViewModel>().state;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          suraIdentityModel?.suraNameEn ?? "",
          style: textStyle.titleMedium?.copyWith(color: AppColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w),
        child: Column(
          children: [
            UiReusable(title: suraIdentityModel?.suraNameAr ?? ""),
            Expanded(
              child: _buildBody(state, suraNum: index),
            ), // أضيفي Expanded هنا,
            // Spacer(),
            Image.asset(AppAssets.quranDetailsMoseque),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(QuranState state, {int? suraNum}) {
    if (state.requestState == RequestState.loading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      );
    }

    if (state.requestState == RequestState.error) {
      return Center(child: Text(state.errorMessage ?? "حدث خطأ"));
    }

    if (state.quranDetails != null && state.quranDetails!.isNotEmpty) {
      // جربي الـ print ده هنا دلوقتي هيشتغل
      print("UI Rendering Lines: ${state.quranDetails!.length}");

      return ListView.separated(
        separatorBuilder: (context, index) =>
            Divider(height: 8.h, color: Colors.transparent),
        itemCount: state.quranDetails!.length,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        itemBuilder: (context, index) =>
            AyatWidget(index: index, state: state, suraNumber: suraNum ?? 0),
      );
    }
    return const Center(
      child: Text(
        "No Data",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
