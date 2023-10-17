import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_test/Api/login_api.dart';
import 'package:retrofit_test/Model/LoginResponse/login_response.dart';
import 'package:retrofit_test/Model/quocgia_response.dart/quocgia_response.dart';

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

  Future<QuocgiaResponse> getListQuocGia(String userToken) async {
    try {
      final response =
          await loginApi.getListQuocGia('false', 'false', userToken);
      return response;
    } catch (e) {
      throw Exception('Lỗi khi lấy danh sách quốc gia: $e');
    }
  }
}
