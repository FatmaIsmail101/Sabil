import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:islami1/features/quran/data/data_source/quran_data_source_contract.dart';
import 'package:islami1/features/quran/data/model/tafser_response.dart';

import '../../../../config/di/di.dart';
import '../../../../config/response_handling/response_handling.dart';
import '../api/quran_client.dart';

@Injectable(as: QuranDataSourceContract)
class QuranDataSourceImpl implements QuranDataSourceContract {
  @override
  Future<BaseResponse<List<String>>> getQuranDetails(int index) async {
    try {
      print("جاري محاولة قراءة الملف: assets/sura_details/$index.txt");
      final quranDetails = await rootBundle.loadString(
        "assets/sura_details/$index.txt",
      );
      if (quranDetails.isEmpty) {
        print("الملف موجود بس فاضي!");
        return SuccessBaseResponse<List<String>>([]);
      }
      final quranList = quranDetails.trim().split("\n");
      print("تم قراءة الملف بنجاح، عدد الأسطر: ${quranList.length}");
      return SuccessBaseResponse<List<String>>(quranList);
    } catch (e) {
      print("خطأ في قراءة الملف: $e");
      return ErrorBaseResponse<List<String>>(e.toString());
    }
  }

  @override
  Future<BaseResponse<TafserResponse>> getTafseer({
    required int tafseerId,
    required int suraNumber,
    required int ayahNumber,
  }) async {
    try {
      final result = await getIt<QuranClient>().getTafseer(
        tafseerId: tafseerId,
        suraNumber: suraNumber,
        ayahNumber: ayahNumber,
      );
      return SuccessBaseResponse<TafserResponse>(result);
    } catch (e) {
      return ErrorBaseResponse<TafserResponse>(e.toString());
    }
  }
}
