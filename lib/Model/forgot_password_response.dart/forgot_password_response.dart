import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_response.g.dart';

@JsonSerializable()
class ForgotPasswordResponse {
  @JsonKey(name: 'Status')
  final String? status;

  @JsonKey(name: 'Messenge')
  final String? message; // Đổi tên thuộc tính này thành 'message'

  @JsonKey(name: 'Data')
  final String? data;

  ForgotPasswordResponse({
    required this.status,
    required this.message, // Cập nhật tên thuộc tính này
    this.data,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);

  @override
  String toString() {
    return 'ForgotPasswordResponseResponse { Status: $status, Message: $message, Data: $data }'; // Đổi tên ở đây cũng
  }
}
