import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit_test/Model/dantoc_response.dart/data_dantoc.dart';

part 'dantoc_response.g.dart';

@JsonSerializable()
class DanTocResponse {
  @JsonKey(name: 'Status')
  final String status;

  @JsonKey(name: 'Messenge')
  final String message;

  @JsonKey(name: 'Data')
  final List<DataDanToc> data;

  DanTocResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DanTocResponse.fromJson(Map<String, dynamic> json) {
    final dataJson = json['Data'];
    final List<dynamic> dataJsonList =
        jsonDecode(dataJson); // Phân tích chuỗi JSON
    final data =
        dataJsonList.map((dataMap) => DataDanToc.fromJson(dataMap)).toList();
    return DanTocResponse(
      status: json['Status'],
      message: json['Messenge'],
      data: data,
    );
  }

  Map<String, dynamic> toJson() => _$DanTocResponseToJson(this);

  @override
  String toString() {
    return 'LoginResponse { Status: $status, Messenge: $message, Data: $data }';
  }
}
