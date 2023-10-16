import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit_test/Model/LoginResponse/data.dart';
import 'package:retrofit_test/Model/quocgia_response.dart/data_quocgia.dart';

part 'quocgia_response.g.dart';

@JsonSerializable()
class QuocgiaResponse {
  @JsonKey(name: 'Status')
  final String status;

  @JsonKey(name: 'Messenge')
  final String message;

  @JsonKey(name: 'Data')
  final List<DataQuocGia> data;

  QuocgiaResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory QuocgiaResponse.fromJson(Map<String, dynamic> json) {
    final dataJson = json['Data'];
    final List<dynamic> dataJsonList =
        jsonDecode(dataJson); // Phân tích chuỗi JSON
    final data =
        dataJsonList.map((dataMap) => DataQuocGia.fromJson(dataMap)).toList();
    return QuocgiaResponse(
      status: json['Status'],
      message: json['Messenge'],
      data: data,
    );
  }

  Map<String, dynamic> toJson() => _$QuocgiaResponseToJson(this);

  @override
  String toString() {
    return 'LoginResponse { Status: $status, Messenge: $message, Data: $data }';
  }
}
