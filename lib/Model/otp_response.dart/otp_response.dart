import 'package:json_annotation/json_annotation.dart';

part 'otp_response.g.dart';

@JsonSerializable()
class OtpResponse {
  @JsonKey(name: 'Status')
  final String? status;

  @JsonKey(name: 'Messenge')
  final String? message;

  @JsonKey(name: 'Data')
  final dynamic data;

  OtpResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OtpResponseToJson(this);

  @override
  String toString() {
    return 'otpResponse { Status: $status, Message: $message, Data: $data }';
  }
}
