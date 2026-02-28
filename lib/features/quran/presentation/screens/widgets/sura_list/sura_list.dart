import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami1/config/caching/caching_helper.dart';
import 'package:islami1/features/quran/data/model/sura_identity.dart';
import 'package:islami1/features/quran/presentation/screens/widgets/sura_list/widget/sura_item.dart';
import 'package:provider/provider.dart';

import '../../../view_model/quran_view_model.dart';
import '../../quran_details_screen.dart';

class SuraList extends StatelessWidget {
  const SuraList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: .zero,
      shrinkWrap: true,
      // يخبر القائمة أن تأخذ مساحة العناصر فقط
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: () async {
          final sura = SuraIdentity(
            suraNameAr: SuraIdentity.quranSuras[index].suraNameAr,
            suraNameEn: SuraIdentity.quranSuras[index].suraNameEn,
            versusNumber: SuraIdentity.quranSuras[index].versusNumber,
            index: SuraIdentity
                .quranSuras[index]
                .index, // تأكدي إنك بتسحبي الـ index المخزن في القائمة (1, 2, 3...)
          );

          // 2. استرجاع اللستة القديمة من الـ Shared Preferences
          List<String> savedSurasJson =
              CachingHelper.getStringList("sura_details") ?? [];

          // 3. تحويل السورة الحالية لـ JSON String
          String currentSuraJson = jsonEncode(sura.toJson());

          // 4. (اختياري) لمنع التكرار: لو السورة موجودة فعلاً، امسحيها عشان تتحط في الأول كأحدث حاجة
          savedSurasJson.remove(currentSuraJson);

          // 5. إضافة السورة الجديدة في أول القائمة (Index 0)
          savedSurasJson.insert(0, currentSuraJson);

          // 6. التأكد إن القائمة لا تزيد عن 5 عناصر
          if (savedSurasJson.length > 5) {
            savedSurasJson = savedSurasJson.sublist(0, 5);
          }

          // إذا كانت الدالة تتطلب List:
          await CachingHelper.setStringList("sura_details", savedSurasJson);
          final vm = Provider.of<QuranViewModel>(context, listen: false);
          vm.loadRecentSuras();
          vm.getQuranDetails(index + 1);

          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider.value(
                value: vm,
                //create: (context) => getIt<QuranViewModel>(),
                child: QuranDetailsScreen(
                  index: index + 1,
                  suraIdentityModel: SuraIdentity(
                    suraNameAr: SuraIdentity.quranSuras[index].suraNameAr,
                    suraNameEn: SuraIdentity.quranSuras[index].suraNameEn,
                    versusNumber: SuraIdentity.quranSuras[index].versusNumber,
                  ),
                ), // ابعتي الـ index
              ),
            ),
          );
          vm.loadRecentSuras();
        },
        child: SuraItem(
          suraNameAr: SuraIdentity.quranSuras[index].suraNameAr,
          suraNameEn: SuraIdentity.quranSuras[index].suraNameEn,
          versusNumber: SuraIdentity.quranSuras[index].versusNumber,
          index: index + 1,
        ),
      ),
      separatorBuilder: (context, index) =>
          Divider(endIndent: 64.w, indent: 64.w),
      itemCount: SuraIdentity.quranSuras.length,
    );
  }
}
