import 'package:injectable/injectable.dart';
import 'package:islami1/features/quran/domain/repo/quran_repo_contract.dart';

import '../../../../config/response_handling/response_handling.dart';
import '../../data/model/tafser_response.dart';

@injectable
class QuranUseCase {
  QuranRepoContract quranRepoContract;

  QuranUseCase(this.quranRepoContract);

  Future<BaseResponse<List<String>>> getQuranDetails(int index) async {
    final result = await quranRepoContract.getQuranDetails(index);
    return result;
  }

  Future<BaseResponse<TafserResponse>> getTafseer({
    required int tafseerId,
    required int suraNumber,
    required int ayahNumber,
  }) async {
    return quranRepoContract.getTafseer(
      tafseerId: tafseerId,
      suraNumber: suraNumber,
      ayahNumber: ayahNumber,
    );
  }
}
