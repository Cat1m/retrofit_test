// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quocgia_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuocgiaResponse _$QuocgiaResponseFromJson(Map<String, dynamic> json) =>
    QuocgiaResponse(
      status: json['Status'] as String,
      message: json['Messenge'] as String,
      data: (json['Data'] as List<dynamic>)
          .map((e) => DataQuocGia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuocgiaResponseToJson(QuocgiaResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'Messenge': instance.message,
      'Data': instance.data,
    };
