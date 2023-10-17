// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'huyenthi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HuyenThiResponse _$HuyenThiResponseFromJson(Map<String, dynamic> json) =>
    HuyenThiResponse(
      status: json['Status'] as String,
      message: json['Messenge'] as String,
      data: (json['Data'] as List<dynamic>)
          .map((e) => DataHuyenThi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HuyenThiResponseToJson(HuyenThiResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'Messenge': instance.message,
      'Data': instance.data,
    };
