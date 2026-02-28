import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:islami1/features/quran/presentation/view_model/quran_state.dart';

import '../../../../config/caching/caching_helper.dart';
import '../../../../config/response_handling/response_handling.dart';
import '../../../../config/states/states.dart';
import '../../data/model/sura_identity.dart';
import '../../data/model/tafser_response.dart';
import '../../domain/use_case/quran_use_case.dart';

@injectable
class QuranViewModel extends ChangeNotifier {
  QuranUseCase quranUseCase;
  QuranState state = QuranState().initial();
  List<SuraIdentity> recentSuras = [];

  QuranViewModel(this.quranUseCase);
  int selectedAyahIndex = -1; // -1 يعني مفيش حاجة مختارة في الأول

  Future<void> getQuranDetails(int index) async {
    // 1. تحديث الحالة للتحميل (يجب وضع علامة "=")
    state = state.copyWith(requestState: RequestState.loading);
    notifyListeners();

    final result = await quranUseCase.getQuranDetails(index);

    // استخدمي if checks لأن switch مع الأنواع في النسخ القديمة قد لا يتعرف على الـ data
    if (result is SuccessBaseResponse<List<String>>) {
      state = state.copyWith(
        requestState: RequestState.success,
        quranDetails: result.data,
      );
      print("تم تحديث الحالة بنجاح ونداء notifyListeners"); // <--- ضيفي ده
      notifyListeners();
    } else if (result is ErrorBaseResponse<List<String>>) {
      state = state.copyWith(
        requestState: RequestState.error,
        errorMessage: result.toString(),
      );
      print(
        "حدث خطأ أثناء تحميل البيانات: ${result.toString()}",
      ); // <--- طبع ده مهم جداً      notifyListeners();
    } else {
      print(
        "حدث خطأ أثناء تحميل البيانات: ${result.toString()}",
      ); // <--- طبع ده مهم جداً // <--- ضيفي ده
      state = state.copyWith(
        requestState: RequestState.error,
        errorMessage: "Something went wrong",
      );
      notifyListeners();
    }

    // 2. إرسال إشعار للـ UI بالتغيير النهائي
    notifyListeners();
  }

  void selectAyah(int index) {
    selectedAyahIndex = index;
    notifyListeners(); // ده السطر اللي بيخلي الـ UI يتلون
  }

  Future<void> getTafseer({
    required int tafseerId,
    required int suraNumber,
    required int ayahNumber,
  }) async {
    state = state.copyWith(tafserState: RequestState.loading);
    notifyListeners();
    final result = await quranUseCase.getTafseer(
      tafseerId: tafseerId,
      suraNumber: suraNumber,
      ayahNumber: ayahNumber,
    );
    if (result is SuccessBaseResponse<TafserResponse>) {
      state = state.copyWith(
        tafserState: RequestState.success,
        tafseer: result.data,
      );
      notifyListeners();
    } else if (result is ErrorBaseResponse<List<TafserResponse>>) {
      print(
        "GetTafseer Error: ${result.toString()} from ${state.errorMessage}",
      );

      state = state.copyWith(
        tafserState: RequestState.error,
        tafeerErrorMessage: result.toString(),
      );
      notifyListeners();
    } else {
      print(state.errorMessage);
      state = state.copyWith(
        tafserState: RequestState.error,
        tafeerErrorMessage: "Something went wrong",
      );
      notifyListeners();
    }
  }

  void loadRecentSuras() {
    List<String>? jsonList = CachingHelper.getStringList("sura_details");
    if (jsonList != null && jsonList.isNotEmpty) {
      recentSuras = jsonList
          .map((e) => SuraIdentity.fromJson(jsonDecode(e)))
          .toList();
      notifyListeners(); // دي اللي هتخلي الـ UI يتحدث فوراً
    } else {
      recentSuras = [];
      notifyListeners();
    }
  }
}
