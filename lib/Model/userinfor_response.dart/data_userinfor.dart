import 'package:json_annotation/json_annotation.dart';

part 'data_userinfor.g.dart';

@JsonSerializable()
class DataUserInfor {
  // ignore: non_constant_identifier_names
  final String Ma;
  // ignore: non_constant_identifier_names
  final String UserName;
  // ignore: non_constant_identifier_names
  final String HinhAnh;
  // ignore: non_constant_identifier_names
  final String HoTen;
  // ignore: non_constant_identifier_names
  final String NgaySinh;
  // ignore: non_constant_identifier_names
  final int GioiTinh;
  // ignore: non_constant_identifier_names
  final int MaTinh;
  // ignore: non_constant_identifier_names
  final int MaHuyen;
  // ignore: non_constant_identifier_names
  final int MaPhuongXa;
  // ignore: non_constant_identifier_names
  final String? MaApKhuPho;
  // ignore: non_constant_identifier_names
  final String SoNha;
  // ignore: non_constant_identifier_names
  final int QuocTich;
  // ignore: non_constant_identifier_names
  final String HoChieu;
  // ignore: non_constant_identifier_names
  final String MaTheBHYT;
  // ignore: non_constant_identifier_names
  final String HinhBHYT;
  // ignore: non_constant_identifier_names
  final int DanToc;

  DataUserInfor({
    // ignore: non_constant_identifier_names
    required this.Ma,
    // ignore: non_constant_identifier_names
    required this.UserName,
    // ignore: non_constant_identifier_names
    required this.HinhAnh,
    // ignore: non_constant_identifier_names
    required this.HoTen,
    // ignore: non_constant_identifier_names
    required this.NgaySinh,
    // ignore: non_constant_identifier_names
    required this.GioiTinh,
    // ignore: non_constant_identifier_names
    required this.MaTinh,
    // ignore: non_constant_identifier_names
    required this.MaHuyen,
    // ignore: non_constant_identifier_names
    required this.MaPhuongXa,
    // ignore: non_constant_identifier_names
    this.MaApKhuPho,
    // ignore: non_constant_identifier_names
    required this.SoNha,
    // ignore: non_constant_identifier_names
    required this.QuocTich,
    // ignore: non_constant_identifier_names
    required this.HoChieu,
    // ignore: non_constant_identifier_names
    required this.MaTheBHYT,
    // ignore: non_constant_identifier_names
    required this.HinhBHYT,
    // ignore: non_constant_identifier_names
    required this.DanToc,
  });

  factory DataUserInfor.fromJson(Map<String, dynamic> json) =>
      _$DataUserInforFromJson(json);
  Map<String, dynamic> toJson() => _$DataUserInforToJson(this);

  @override
  String toString() {
    return 'DataUserInfor { Ma: $Ma, UserName: $UserName, HinhAnh: $HinhAnh, HoTen: $HoTen, NgaySinh: $NgaySinh, GioiTinh: $GioiTinh, MaTinh: $MaTinh, MaHuyen: $MaHuyen, MaPhuongXa: $MaPhuongXa, MaApKhuPho: $MaApKhuPho, SoNha: $SoNha, QuocTich: $QuocTich, HoChieu: $HoChieu, MaTheBHYT: $MaTheBHYT, HinhBHYT: $HinhBHYT, DanToc: $DanToc,}';
  }
}
