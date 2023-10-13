// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      username: json['username'] as String,
      appver: json['appver'] as String,
      token: json['token'] as String,
      deviceid: json['deviceid'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'username': instance.username,
      'appver': instance.appver,
      'token': instance.token,
      'deviceid': instance.deviceid,
    };
