// To parse this JSON data, do
//
//     final tafserResponse = tafserResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'tafser_response.g.dart';

@JsonSerializable()
class TafserResponse {
  @JsonKey(name: "tafseer_id")
  final int? tafseerId;
  @JsonKey(name: "tafseer_name")
  final String? tafseerName;
  @JsonKey(name: "ayah_url")
  final String? ayahUrl;
  @JsonKey(name: "ayah_number")
  final int? ayahNumber;
  @JsonKey(name: "text")
  final String? text;

  TafserResponse({
    this.tafseerId,
    this.tafseerName,
    this.ayahUrl,
    this.ayahNumber,
    this.text,
  });

  factory TafserResponse.fromJson(Map<String, dynamic> json) =>
      _$TafserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TafserResponseToJson(this);
}
