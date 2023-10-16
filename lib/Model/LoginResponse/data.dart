import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  final String username;
  final String appver;
  final String token;
  final String deviceid;

  Data({
    required this.username,
    required this.appver,
    required this.token,
    required this.deviceid,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  String toString() {
    return 'Data { username: $username, appver: $appver, token: $token, deviceid: $deviceid }';
  }
}
