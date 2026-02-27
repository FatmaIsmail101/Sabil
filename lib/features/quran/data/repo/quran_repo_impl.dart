import 'package:injectable/injectable.dart';
import 'package:islami1/config/response_handling/response_handling.dart';
import 'package:islami1/features/quran/data/data_source/quran_data_source_contract.dart';
import 'package:islami1/features/quran/data/model/tafser_response.dart';

import '../../domain/repo/quran_repo_contract.dart';

@Injectable(as: QuranRepoContract)
class QuranRepoImpl implements QuranRepoContract {
  final QuranDataSourceContract quranDataSourceContract;

  QuranRepoImpl(this.quranDataSourceContract);

  @override
  Future<BaseResponse<List<String>>> getQuranDetails(int index) async {
    try {
      final result = await quranDataSourceContract.getQuranDetails(index);
      return result;
    } catch (e) {
      print(e.toString());
      return ErrorBaseResponse<List<String>>("Something went wrong");
    }
  }

  @override
  Future<BaseResponse<List<TafserResponse>>> getTafseer({
    required int tafseerId,
    required int suraNumber,
    required int ayahNumber,
  }) async {
    try {
      final result = await quranDataSourceContract.getTafseer(
        tafseerId: tafseerId,
        suraNumber: suraNumber,
        ayahNumber: ayahNumber,
      );
      print(result.toString());
      return result;
    } catch (e) {
      print(e.toString());
      return ErrorBaseResponse<List<TafserResponse>>("Something went wrong");
    }
  }
}
