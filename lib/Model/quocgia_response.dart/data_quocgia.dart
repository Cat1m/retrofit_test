import 'package:json_annotation/json_annotation.dart';

part 'data_quocgia.g.dart';

@JsonSerializable()
class DataQuocGia {
  final String ma;
  final String ten;
  final String trangthai;

  DataQuocGia({
    required this.ma,
    required this.ten,
    required this.trangthai,
  });

  factory DataQuocGia.fromJson(Map<String, dynamic> json) =>
      _$DataQuocGiaFromJson(json);
  Map<String, dynamic> toJson() => _$DataQuocGiaToJson(this);

  @override
  String toString() {
    return 'Data { ma: $ma, ten: $ten, trangthai: $trangthai }';
  }
}
