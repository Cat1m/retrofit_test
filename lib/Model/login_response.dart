import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit_test/Model/data.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'Status')
  final String status;

  @JsonKey(name: 'Messenge')
  final String message;

  @JsonKey(name: 'Data')
  final Data data;

  LoginResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final dataJsonString = json['Data']; // Lấy chuỗi JSON từ trường "Data"
    final dataMap = jsonDecode(dataJsonString); // Giải mã chuỗi JSON thành Map
    final data = Data.fromJson(dataMap); // Chuyển đổi Map thành mô hình Data
    return LoginResponse(
      status: json['Status'],
      message: json['Messenge'],
      data: data,
    );
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  String toString() {
    return 'LoginResponse { Status: $status, Messenge: $message, Data: $data }';
  }
}
