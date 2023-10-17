// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dantoc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DanTocResponse _$DanTocResponseFromJson(Map<String, dynamic> json) =>
    DanTocResponse(
      status: json['Status'] as String,
      message: json['Messenge'] as String,
      data: (json['Data'] as List<dynamic>)
          .map((e) => DataDanToc.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DanTocResponseToJson(DanTocResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'Messenge': instance.message,
      'Data': instance.data,
    };
