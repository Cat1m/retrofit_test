import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../Model/login_response.dart';

part 'login_api.g.dart';

@RestApi(baseUrl: "https://his.dev.honghunghospital.com.vn/")
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST("/dkkb/login")
  @FormUrlEncoded()
  Future<LoginResponse> login(@Field("username") String username,
      @Field("password") String password, @Header("token") String token);
}
