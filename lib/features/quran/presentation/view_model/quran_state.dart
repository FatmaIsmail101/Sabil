import 'package:islami1/config/states/states.dart';

import '../../data/model/tafser_response.dart';

class QuranState {
  RequestState? requestState;
  String? errorMessage;
  List<String>? quranDetails;
  //Tafseer
  List<TafserResponse>? tafseer;
  String? tafeerErrorMessage;
  RequestState? tafserState;

  QuranState({
    this.requestState,
    this.errorMessage,
    this.quranDetails,

    this.tafseer,
    this.tafeerErrorMessage,
    this.tafserState,
  });
  QuranState copyWith({
    RequestState? requestState,
    String? errorMessage,
    List<String>? quranDetails,
    //Tafseer
    List<TafserResponse>? tafseer,
    String? tafeerErrorMessage,
    RequestState? tafserState,
  }) {
    return QuranState(
      requestState: requestState ?? this.requestState,
      errorMessage: errorMessage ?? this.errorMessage,
      quranDetails: quranDetails ?? this.quranDetails,
      //Tafseer
      tafseer: tafseer ?? this.tafseer,
      tafeerErrorMessage: tafeerErrorMessage ?? this.tafeerErrorMessage,
      tafserState: tafserState ?? this.tafserState,
    );
  }

  QuranState initial() {
    return QuranState(requestState: RequestState.initial);
  }
}
