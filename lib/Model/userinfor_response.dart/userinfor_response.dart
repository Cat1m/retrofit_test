import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:retrofit_test/Model/userinfor_response.dart/data_userinfor.dart';

part 'userinfor_response.g.dart';

@JsonSerializable()
class UserInforResponse {
  @JsonKey(name: 'Status')
  final String status;

  @JsonKey(name: 'Messenge')
  final String message;

  @JsonKey(name: 'Data')
  final List<DataUserInfor> data;

  UserInforResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserInforResponse.fromJson(Map<String, dynamic> json) {
    final dataJson = json['Data'];

    // Giải mã chuỗi JSON trong trường "Data" thành một Map<String, dynamic>.
    final dataMap = jsonDecode(dataJson);

    // Tạo một đối tượng DataUserInfor từ dataMap.
    final dataUserInfor = DataUserInfor.fromJson(dataMap);

    return UserInforResponse(
      status: json['Status'],
      message: json['Messenge'],
      data: [dataUserInfor], // Đặt đối tượng DataUserInfor vào danh sách.
    );
  }

  Map<String, dynamic> toJson() => _$UserInforResponseToJson(this);

  @override
  String toString() {
    return 'LoginResponse { Status: $status, Messenge: $message, Data: $data }';
  }
}
