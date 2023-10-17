import 'package:json_annotation/json_annotation.dart';

part 'data_tinhthanh.g.dart';

@JsonSerializable()
class DataTinhThanh {
  final String ma;
  final String ten;
  final String trangthai;

  DataTinhThanh({
    required this.ma,
    required this.ten,
    required this.trangthai,
  });

  factory DataTinhThanh.fromJson(Map<String, dynamic> json) =>
      _$DataTinhThanhFromJson(json);
  Map<String, dynamic> toJson() => _$DataTinhThanhToJson(this);

  @override
  String toString() {
    return 'Data { ma: $ma, ten: $ten, trangthai: $trangthai }';
  }
}
