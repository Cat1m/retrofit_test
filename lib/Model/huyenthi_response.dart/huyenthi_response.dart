import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit_test/Model/huyenthi_response.dart/data_huyenthi.dart';

part 'huyenthi_response.g.dart';

@JsonSerializable()
class HuyenThiResponse {
  @JsonKey(name: 'Status')
  final String status;

  @JsonKey(name: 'Messenge')
  final String message;

  @JsonKey(name: 'Data')
  final List<DataHuyenThi> data;

  HuyenThiResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HuyenThiResponse.fromJson(Map<String, dynamic> json) {
    final dataJson = json['Data'];
    final List<dynamic> dataJsonList =
        jsonDecode(dataJson); // Phân tích chuỗi JSON
    final data =
        dataJsonList.map((dataMap) => DataHuyenThi.fromJson(dataMap)).toList();
    return HuyenThiResponse(
      status: json['Status'],
      message: json['Messenge'],
      data: data,
    );
  }

  Map<String, dynamic> toJson() => _$HuyenThiResponseToJson(this);

  @override
  String toString() {
    return 'LoginResponse { Status: $status, Messenge: $message, Data: $data }';
  }
}
