import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:retrofit_test/Model/tinhthanh_response.dart/data_tinhthanh.dart';

part 'tinhthanh_response.g.dart';

@JsonSerializable()
class TinhThanhResponse {
  @JsonKey(name: 'Status')
  final String status;

  @JsonKey(name: 'Messenge')
  final String message;

  @JsonKey(name: 'Data')
  final List<DataTinhThanh> data;

  TinhThanhResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TinhThanhResponse.fromJson(Map<String, dynamic> json) {
    final dataJson = json['Data'];
    final List<dynamic> dataJsonList =
        jsonDecode(dataJson); // Phân tích chuỗi JSON
    final data =
        dataJsonList.map((dataMap) => DataTinhThanh.fromJson(dataMap)).toList();
    return TinhThanhResponse(
      status: json['Status'],
      message: json['Messenge'],
      data: data,
    );
  }

  Map<String, dynamic> toJson() => _$TinhThanhResponseToJson(this);

  @override
  String toString() {
    return 'LoginResponse { Status: $status, Messenge: $message, Data: $data }';
  }
}
