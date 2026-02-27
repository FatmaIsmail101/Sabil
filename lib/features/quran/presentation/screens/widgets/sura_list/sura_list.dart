import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami1/config/caching/caching_helper.dart';
import 'package:islami1/features/quran/data/model/sura_identity.dart';
import 'package:islami1/features/quran/presentation/screens/widgets/sura_list/widget/sura_item.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/di/di.dart';
import '../../../view_model/quran_view_model.dart';
import '../../quran_details_screen.dart';

class SuraList extends StatelessWidget {
  const SuraList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      // يخبر القائمة أن تأخذ مساحة العناصر فقط
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: () async {
          final sura = SuraIdentity(
            suraNameAr: SuraIdentity.quranSuras[index].suraNameAr,
            suraNameEn: SuraIdentity.quranSuras[index].suraNameEn,
            versusNumber: SuraIdentity.quranSuras[index].versusNumber,
          );

          // تحويل الكائن لنص JSON
          final String jsonString = jsonEncode(sura);

          // إذا كانت الدالة تتطلب List:
          await CachingHelper.setStringList("sura_details", jsonString);
          final vm = getIt<QuranViewModel>();
          vm.getQuranDetails(index + 1);
          Navigator.push(
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
