import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami1/features/quran/presentation/screens/quran_details_screen.dart';
import 'package:islami1/features/quran/presentation/screens/widgets/most_recent/widget/most_recent_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/caching/caching_helper.dart';
import '../../../../../../config/di/di.dart';
import '../../../../data/model/sura_identity.dart';
import '../../../view_model/quran_view_model.dart';

class MostRecent extends StatelessWidget {
  const MostRecent({super.key});

  @override
  Widget build(BuildContext context) {
    final recentSuras = context.watch<QuranViewModel>().recentSuras;

    // 2. لو القائمة فاضية م تعرضيش حاجة
    if (recentSuras.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
        //padding: EdgeInsets.symmetric(horizontal: 16.w), // تحسين الشكل
        scrollDirection: .horizontal,
        itemBuilder: (context, index) {
          final currentSura = recentSuras[index];
          return InkWell(
            onTap: () {
              final vm = getIt<QuranViewModel>();
              // نستخدم رقم السورة الحقيقي (ولو null نخليه 1 كـ default)
              int suraIndex = currentSura.index ?? 1;
              vm.getQuranDetails(suraIndex);
              // نستخدم رقم السورة الحقيقي المخزن في الموديل
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider.value(
                    value: vm,

                    child: QuranDetailsScreen(
                      index: suraIndex,

                      suraIdentityModel: currentSura,
                    ),
                  ),
                ),
              );
            },
            child: MostRecentWidget(
              suraNameEn: currentSura.suraNameEn,
              suraNameAr: currentSura.suraNameAr,
              versusNumber: currentSura.versusNumber,
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemCount: recentSuras.length,
      ),
    );
  }

  List<SuraIdentity> getRecentSuras() {
    try {
      // حاول تجيب اللستة
      List<String>? jsonList = CachingHelper.getStringList("sura_details");
      if (jsonList == null || jsonList.isEmpty) return [];

      return jsonList.map((suraJson) {
        return SuraIdentity.fromJson(jsonDecode(suraJson));
      }).toList();
    } catch (e) {
      // لو حصل مشكلة (زي مشكلة الـ Type دي) امسح الكاش القديم ورجع لستة فاضية
      CachingHelper.remove("sura_details");
      return [];
    }
  }
}
