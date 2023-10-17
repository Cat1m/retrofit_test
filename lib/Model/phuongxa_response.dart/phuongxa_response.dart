import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:retrofit_test/Model/phuongxa_response.dart/data_phuongxa.dart';

part 'phuongxa_response.g.dart';

@JsonSerializable()
class PhuongXaResponse {
  @JsonKey(name: 'Status')
  final String status;

  @JsonKey(name: 'Messenge')
  final String message;

  @JsonKey(name: 'Data')
  final List<DataPhuongXa> data;

  PhuongXaResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PhuongXaResponse.fromJson(Map<String, dynamic> json) {
    final dataJson = json['Data'];
    final List<dynamic> dataJsonList =
        jsonDecode(dataJson); // Phân tích chuỗi JSON
    final data =
        dataJsonList.map((dataMap) => DataPhuongXa.fromJson(dataMap)).toList();
    return PhuongXaResponse(
      status: json['Status'],
      message: json['Messenge'],
      data: data,
    );
  }

  Map<String, dynamic> toJson() => _$PhuongXaResponseToJson(this);

  @override
  String toString() {
    return 'LoginResponse { Status: $status, Messenge: $message, Data: $data }';
  }
}
