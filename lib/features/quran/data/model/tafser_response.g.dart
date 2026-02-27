// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tafser_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TafserResponse _$TafserResponseFromJson(Map<String, dynamic> json) =>
    TafserResponse(
      tafseerId: (json['tafseer_id'] as num?)?.toInt(),
      tafseerName: json['tafseer_name'] as String?,
      ayahUrl: json['ayah_url'] as String?,
      ayahNumber: (json['ayah_number'] as num?)?.toInt(),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$TafserResponseToJson(TafserResponse instance) =>
    <String, dynamic>{
      'tafseer_id': instance.tafseerId,
      'tafseer_name': instance.tafseerName,
      'ayah_url': instance.ayahUrl,
      'ayah_number': instance.ayahNumber,
      'text': instance.text,
    };
