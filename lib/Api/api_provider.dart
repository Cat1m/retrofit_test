import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_test/Api/api_key_generator.dart';
import 'package:retrofit_test/Api/login_api.dart';
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
import 'package:retrofit_test/Model/userinfor_response.dart/data_userinfor.dart';
import 'package:retrofit_test/Model/userinfor_response.dart/userinfor_response.dart';

class ApiProvider with ChangeNotifier {
  final Dio dio = Dio();
  late LoginApi loginApi;

  ApiProvider() {
    loginApi = LoginApi(dio);
  }

  Future<LoginResponse> login(
      String username, String password, String deviceid, String token) async {
    try {
      final response =
          await loginApi.login(username, password, deviceid, token);
      if (response.status == 'OK') {
        return response;
      } else {
        throw Exception('Đăng nhập thất bại: ${response.message}');
      }
    } catch (e) {
      throw Exception('Lỗi khi đăng nhập: $e');
    }
  }

  Future<QuocgiaResponse> getListQuocGia() async {
    try {
      final response = await loginApi.getListQuocGia('false', 'false');
      return response;
    } catch (e) {
      throw Exception('Lỗi khi lấy danh sách quốc gia: $e');
    }
  }

  Future<TinhThanhResponse> getListTinhThanh(String ma) async {
    try {
      final response = await loginApi.getListTinhThanh(ma, 'false', 'false');
      return response;
    } catch (e) {
      throw Exception('Lỗi khi lấy danh sách tỉnh thành: $e');
    }
  }

  Future<HuyenThiResponse> getListHuyenThi(String ma) async {
    try {
      final response = await loginApi.getListHuyenThi(ma, 'false', 'false');
      return response;
    } catch (e) {
      throw Exception('Lỗi khi lấy danh sách huyen thi: $e');
    }
  }

  Future<PhuongXaResponse> getListPhuongXa(String ma) async {
    try {
      final response = await loginApi.getListPhuongXa(ma, 'false', 'false');
      return response;
    } catch (e) {
      throw Exception('Lỗi khi lấy danh sách phuong xa: $e');
    }
  }

  Future<DanTocResponse> getListDanToc() async {
    try {
      final response = await loginApi.getListDanToc('false', 'false');
      return response;
    } catch (e) {
      throw Exception('Lỗi khi lấy danh sách dan toc: $e');
    }
  }

  Future<RegisterResponse> registerNewAccount(
      String username,
      String password,
      String hinhanh,
      String hoten,
      String ngaysinh,
      String gioitinh,
      String maquocgia,
      String matinh,
      String mahuyen,
      String maphuongxa,
      String sonha,
      String quoctich,
      String hochieu,
      String mathebhyt,
      String hinhbhyt,
      String madantoc,
      String opt,
      String token) async {
    try {
      final response = await loginApi.registerNewAccount(
          username,
          password,
          hinhanh,
          hoten,
          ngaysinh,
          gioitinh,
          maquocgia,
          matinh,
          mahuyen,
          maphuongxa,
          sonha,
          quoctich,
          hochieu,
          mathebhyt,
          hinhbhyt,
          madantoc,
          opt,
          token);
      return response;
    } catch (e) {
      throw Exception('Lỗi khi đăng ký: $e');
    }
  }

  Future<UserInforResponse> getListUserInfor(String usertoken) async {
    try {
      final response = await loginApi.getListUserInfor(usertoken);
      return response;
    } catch (e) {
      throw Exception('Lỗi khi call userinfor: $e');
    }
  }

  Future<OtpResponse> getOTP(String usertoken) async {
    try {
      final response = await loginApi.getOTP(
        "0359509251",
        ApiKeyGenerator.getAPIKey(),
      );
      return response;
    } catch (e) {
      throw Exception('Lỗi khi gửi otp: $e');
    }
  }

  Future<UpdateUserResponse> updateUserInfor(
      String username,
      String hinhanh,
      String hoten,
      String ngaysinh,
      String gioitinh,
      String maquocgia,
      String matinh,
      String mahuyen,
      String maphuongxa,
      String sonha,
      String quoctich,
      String hochieu,
      String mathebhyt,
      String hinhbhyt,
      String madantoc,
      String status,
      String usertoken) async {
    try {
      final response = await loginApi.updateUserInfor(
          username,
          hinhanh,
          hoten,
          ngaysinh,
          gioitinh,
          maquocgia,
          matinh,
          mahuyen,
          maphuongxa,
          sonha,
          quoctich,
          hochieu,
          mathebhyt,
          hinhbhyt,
          madantoc,
          status,
          usertoken);
      return response;
    } catch (e) {
      throw Exception('Lỗi khi đăng ký: $e');
    }
  }

  Future<ResetPasswordResponse> getResetPassword(String username,
      String oldpassword, String newpassword, String usertoken) async {
    try {
      final response = await loginApi.getResetPassword(
        username,
        oldpassword,
        newpassword,
        usertoken,
      );
      return response;
    } catch (e) {
      throw Exception('Lỗi khi gửi otp: $e');
    }
  }

  Future<ForgotPasswordResponse> getForgotPassword(
    String username,
    String password,
    String otp,
    String token,
  ) async {
    try {
      final response = await loginApi.getForgotPassword(
        username,
        password,
        otp,
        token,
      );
      return response;
    } catch (e) {
      throw Exception('Lỗi lấy lại mật khẩu: $e');
    }
  }
}
