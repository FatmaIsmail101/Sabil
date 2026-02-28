import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../config/values/endpoints.dart';
import '../model/tafser_response.dart';

part 'quran_client.g.dart';

@RestApi()
@injectable
abstract class QuranClient {
  @factoryMethod
  factory QuranClient(Dio dio) = _QuranClient;
  //http://api.quran-tafseer.com/tafseer/1/1/1
  @GET("${Endpoints.tafser}/{tafseer_id}/{sura_number}/{ayah_number}")
  Future<TafserResponse> getTafseer({
    @Path("tafseer_id") required int tafseerId,
    @Path("sura_number") required int suraNumber,
    @Path("ayah_number") required int ayahNumber,
  });
}
