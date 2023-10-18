import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_test/Model/LoginResponse/login_response.dart';
import 'package:retrofit_test/Model/dantoc_response.dart/dantoc_response.dart';
import 'package:retrofit_test/Model/forgot_password_response.dart/forgot_password_response.dart';
import 'package:retrofit_test/Model/huyenthi_response.dart/huyenthi_response.dart';
import 'package:retrofit_test/Model/otp_response.dart/otp_response.dart';
import 'package:retrofit_test/Model/phuongxa_response.dart/phuongxa_response.dart';
import 'package:retrofit_test/Model/quocgia_response.dart/quocgia_response.dart';
import 'package:retrofit_test/Model/register_response.dart/register_response.dart';
import 'package:retrofit_test/Model/reset_password_response.dart/reset_password_response.dart';
import 'package:retrofit_test/Model/tinhthanh_response.dart/tinhthanh_response.dart';
import 'package:retrofit_test/Model/update_user_response/update_user_response.dart';
import 'package:retrofit_test/Model/userinfor_response.dart/userinfor_response.dart';

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

  @POST("/dantoc/GetListDanToc")
  @FormUrlEncoded()
  Future<DanTocResponse> getListDanToc(
    @Field("encrypt") String encrypt,
    @Field("allStatus") String allStatus,
  );

  @POST("/dkkb/RegisterDKKBAccount")
  @FormUrlEncoded()
  Future<RegisterResponse> registerNewAccount(
    @Field("Username") String username,
    @Field("Password") String password,
    @Field("HinhAnh") String hinhanh,
    @Field("HoTen") String hoten,
    @Field("NgaySinh") String ngaysinh,
    @Field("GioiTinh") String gioitinh,
    @Field("MaQuocGia") String maquocgia,
    @Field("MaTinh") String matinh,
    @Field("MaHuyen") String mahuyen,
    @Field("MaPhuongXa") String maphuongxa,
    @Field("SoNha") String sonha,
    @Field("QuocTich") String quoctich,
    @Field("HoChieu") String hochieu,
    @Field("MaTheBhyt") String mathebhyt,
    @Field("HinhBhyt") String hinhbhyt,
    @Field("MaDanToc") String madantoc,
    @Field("OPT") String otp,
    @Header("token") String token,
  );

  @POST("/dkkb/CurrentUserInfo")
  @FormUrlEncoded()
  Future<UserInforResponse> getListUserInfor(
    @Header("token") String usertoken,
  );

  @POST("/dkkb/GetOTP")
  @FormUrlEncoded()
  Future<OtpResponse> getOTP(
    @Field("phonenumber") String phonenumber,
    @Header("token") String usertoken,
  );

  @POST("/dkkb/UpdateDKKBAccount")
  @FormUrlEncoded()
  Future<UpdateUserResponse> updateUserInfor(
    @Field("Username") String username,
    @Field("HinhAnh") String hinhanh,
    @Field("HoTen") String hoten,
    @Field("NgaySinh") String ngaysinh,
    @Field("GioiTinh") String gioitinh,
    @Field("MaQuocGia") String maquocgia,
    @Field("MaTinh") String matinh,
    @Field("MaHuyen") String mahuyen,
    @Field("MaPhuongXa") String maphuongxa,
    @Field("SoNha") String sonha,
    @Field("QuocTich") String quoctich,
    @Field("HoChieu") String hochieu,
    @Field("MaTheBhyt") String mathebhyt,
    @Field("HinhBhyt") String hinhbhyt,
    @Field("MaDanToc") String madantoc,
    @Field("Status") String status,
    @Header("token") String usertoken,
  );

  @POST("/dkkb/ResetPassword")
  @FormUrlEncoded()
  Future<ResetPasswordResponse> getResetPassword(
    @Field("Username") String username,
    @Field("OldPassword") String oldpassword,
    @Field("NewPassword") String newpassword,
    @Header("token") String usertoken,
  );

  @POST("/dkkb/ResetForgotPassword")
  @FormUrlEncoded()
  Future<ForgotPasswordResponse> getForgotPassword(
    @Field("Username") String username,
    @Field("NewPassword") String newpassword,
    @Field("Otp") String otp,
    @Header("token") String token,
  );
}
