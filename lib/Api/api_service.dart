import 'package:dio/dio.dart';
import 'package:retrofit_test/Api/api_key_generator.dart';
import 'package:retrofit_test/Api/login_api.dart';
import 'package:retrofit_test/Model/LoginResponse/login_response.dart';
import 'package:retrofit_test/Model/quocgia_response.dart/quocgia_response.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<LoginResponse> loginToApi() async {
    try {
      final loginApi = LoginApi(dio);
      final token = ApiKeyGenerator.getAPIKey();
      final response =
          await loginApi.login('84123456', 'abc@123456', 'chien', token);

      if (response.status == 'OK') {
        return response;
      } else {
        print('Đăng nhập thất bại: ${response.message}');
        throw Exception('Đăng nhập thất bại');
      }
    } catch (e) {
      print('Đã xảy ra lỗi khi đăng nhập: $e');
      rethrow;
    }
  }

  Future<QuocgiaResponse> getListQuocGia(String userToken) async {
    try {
      final loginApi = LoginApi(dio);
      final response =
          await loginApi.getListQuocGia('false', 'false', userToken);

      return response;
    } catch (e) {
      print('Lỗi khi lấy danh sách quốc gia: $e');
      rethrow;
    }
  }
}
