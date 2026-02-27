import '../../../../config/response_handling/response_handling.dart';
import '../../data/model/tafser_response.dart';

abstract class QuranRepoContract {
  Future<BaseResponse<List<String>>> getQuranDetails(int index);
  Future<BaseResponse<List<TafserResponse>>> getTafseer({
    required int tafseerId,
    required int suraNumber,
    required int ayahNumber,
  });
}
