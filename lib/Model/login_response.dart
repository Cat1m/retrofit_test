import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String Status;
  final String Messenge;
  final String Data; // Trường Data là một chuỗi JSON

  LoginResponse({
    required this.Status,
    required this.Messenge,
    required this.Data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  String toString() {
    return 'LoginResponse { Status: $Status, Messenge: $Messenge, Data: $Data,}';
  }
}
