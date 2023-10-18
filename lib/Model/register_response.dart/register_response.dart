import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: 'Status')
  final String? status;

  @JsonKey(name: 'Messenge')
  final String? message; // Đổi tên thuộc tính này thành 'message'

  @JsonKey(name: 'Data')
  final String? data;

  RegisterResponse({
    required this.status,
    required this.message, // Cập nhật tên thuộc tính này
    this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  @override
  String toString() {
    return 'RegisterResponse { Status: $status, Message: $message, Data: $data }'; // Đổi tên ở đây cũng
  }
}
