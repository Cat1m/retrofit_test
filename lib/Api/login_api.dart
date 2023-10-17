import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_test/Model/LoginResponse/login_response.dart';
import 'package:retrofit_test/Model/huyenthi_response.dart/huyenthi_response.dart';
import 'package:retrofit_test/Model/phuongxa_response.dart/phuongxa_response.dart';
import 'package:retrofit_test/Model/quocgia_response.dart/quocgia_response.dart';
import 'package:retrofit_test/Model/tinhthanh_response.dart/tinhthanh_response.dart';

part 'login_api.g.dart';

@RestApi(baseUrl: "https://his.dev.honghunghospital.com.vn/")
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST("/dkkb/login")
  @FormUrlEncoded()
  Future<LoginResponse> login(
    @Field("username") String username,
    @Field("password") String password,
    @Field("deviceid") String deviceid,
    @Header("token") String token,
  );

  @POST("/quocgia/GetListQuocGia")
  @FormUrlEncoded()
  Future<QuocgiaResponse> getListQuocGia(
    @Field("encrypt") String encrypt,
    @Field("allStatus") String allStatus,
  );

  @POST("/tinhthanh/GetListTinhThanhByQuocGiaAPI")
  @FormUrlEncoded()
  Future<TinhThanhResponse> getListTinhThanh(
    @Field("ID") String ma,
    @Field("encrypt") String encrypt,
    @Field("allStatus") String allStatus,
  );

  @POST("/huyenthi/GetListHuyenThiByTinhThanhAPI")
  @FormUrlEncoded()
  Future<HuyenThiResponse> getListHuyenThi(
    @Field("ID") String ma,
    @Field("encrypt") String encrypt,
    @Field("allStatus") String allStatus,
  );

  @POST("/phuongxa/GetListPhuongXaByHuyenThiAPI")
  @FormUrlEncoded()
  Future<PhuongXaResponse> getListPhuongXa(
    @Field("ID") String ma,
    @Field("encrypt") String encrypt,
    @Field("allStatus") String allStatus,
  );
}
