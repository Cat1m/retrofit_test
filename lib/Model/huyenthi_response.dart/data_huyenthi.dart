import 'package:json_annotation/json_annotation.dart';

part 'data_huyenthi.g.dart';

@JsonSerializable()
class DataHuyenThi {
  final String ma;
  final String ten;
  final String trangthai;

  DataHuyenThi({
    required this.ma,
    required this.ten,
    required this.trangthai,
  });

  factory DataHuyenThi.fromJson(Map<String, dynamic> json) =>
      _$DataHuyenThiFromJson(json);
  Map<String, dynamic> toJson() => _$DataHuyenThiToJson(this);

  @override
  String toString() {
    return 'Data { ma: $ma, ten: $ten, trangthai: $trangthai }';
  }
}
