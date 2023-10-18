import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  @JsonKey(name: 'Status')
  final String? status;

  @JsonKey(name: 'Messenge')
  final String? message; // Đổi tên thuộc tính này thành 'message'

  @JsonKey(name: 'Data')
  final String? data;

  ResetPasswordResponse({
    required this.status,
    required this.message, // Cập nhật tên thuộc tính này
    this.data,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);

  @override
  String toString() {
    return 'ResetPasswordResponseResponse { Status: $status, Message: $message, Data: $data }'; // Đổi tên ở đây cũng
  }
}
