// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phuongxa_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhuongXaResponse _$PhuongXaResponseFromJson(Map<String, dynamic> json) =>
    PhuongXaResponse(
      status: json['Status'] as String,
      message: json['Messenge'] as String,
      data: (json['Data'] as List<dynamic>)
          .map((e) => DataPhuongXa.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PhuongXaResponseToJson(PhuongXaResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'Messenge': instance.message,
      'Data': instance.data,
    };
