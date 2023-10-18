// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userinfor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInforResponse _$UserInforResponseFromJson(Map<String, dynamic> json) =>
    UserInforResponse(
      status: json['Status'] as String,
      message: json['Messenge'] as String,
      data: (json['Data'] as List<dynamic>)
          .map((e) => DataUserInfor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserInforResponseToJson(UserInforResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'Messenge': instance.message,
      'Data': instance.data,
    };
