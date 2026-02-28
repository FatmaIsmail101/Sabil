import '../../../../config/response_handling/response_handling.dart';
import '../model/tafser_response.dart';

abstract class QuranDataSourceContract {
  Future<BaseResponse<List<String>>> getQuranDetails(int index);
  Future<BaseResponse<TafserResponse>> getTafseer({
    required int tafseerId,
    required int suraNumber,
    required int ayahNumber,
  });
}
