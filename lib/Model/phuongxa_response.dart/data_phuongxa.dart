import 'package:json_annotation/json_annotation.dart';

part 'data_phuongxa.g.dart';

@JsonSerializable()
class DataPhuongXa {
  final String ma;
  final String ten;
  final String trangthai;

  DataPhuongXa({
    required this.ma,
    required this.ten,
    required this.trangthai,
  });

  factory DataPhuongXa.fromJson(Map<String, dynamic> json) =>
      _$DataPhuongXaFromJson(json);
  Map<String, dynamic> toJson() => _$DataPhuongXaToJson(this);

  @override
  String toString() {
    return 'Data { ma: $ma, ten: $ten, trangthai: $trangthai }';
  }
}
