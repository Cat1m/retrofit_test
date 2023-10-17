import 'package:json_annotation/json_annotation.dart';

part 'data_dantoc.g.dart';

@JsonSerializable()
class DataDanToc {
  final String ma;
  final String ten;
  final String trangthai;

  DataDanToc({
    required this.ma,
    required this.ten,
    required this.trangthai,
  });

  factory DataDanToc.fromJson(Map<String, dynamic> json) =>
      _$DataDanTocFromJson(json);
  Map<String, dynamic> toJson() => _$DataDanTocToJson(this);

  @override
  String toString() {
    return 'Data { ma: $ma, ten: $ten, trangthai: $trangthai }';
  }
}
