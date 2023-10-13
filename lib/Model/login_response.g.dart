// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      Status: json['Status'] as String,
      Messenge: json['Messenge'] as String,
      Data: json['Data'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'Status': instance.Status,
      'Messenge': instance.Messenge,
      'Data': instance.Data,
    };
