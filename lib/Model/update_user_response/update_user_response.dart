import 'package:json_annotation/json_annotation.dart';

part 'update_user_response.g.dart';

@JsonSerializable()
class UpdateUserResponse {
  @JsonKey(name: 'Status')
  final String? status;

  @JsonKey(name: 'Messenge')
  final String? message; // Đổi tên thuộc tính này thành 'message'

  @JsonKey(name: 'Data')
  final String? data;

  UpdateUserResponse({
    required this.status,
    required this.message, // Cập nhật tên thuộc tính này
    this.data,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserResponseToJson(this);

  @override
  String toString() {
    return 'Response { Status: $status, Message: $message, Data: $data }'; // Đổi tên ở đây cũng
  }
}
