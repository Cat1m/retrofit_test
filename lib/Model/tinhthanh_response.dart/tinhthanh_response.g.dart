// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tinhthanh_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TinhThanhResponse _$TinhThanhResponseFromJson(Map<String, dynamic> json) =>
    TinhThanhResponse(
      status: json['Status'] as String,
      message: json['Messenge'] as String,
      data: (json['Data'] as List<dynamic>)
          .map((e) => DataTinhThanh.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TinhThanhResponseToJson(TinhThanhResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'Messenge': instance.message,
      'Data': instance.data,
    };
