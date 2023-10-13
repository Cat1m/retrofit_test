import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_test/Api/api_key_generator.dart';
import 'package:retrofit_test/Api/login_api.dart';

import 'Model/login_response.dart';

void main() {
  final dio = Dio();
  runApp(MyApp(dio: dio));
}

class MyApp extends StatelessWidget {
  final Dio dio;

  const MyApp({Key? key, required this.dio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login Demo'),
        ),
        body: FutureBuilder<LoginResponse>(
          future: loginToApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Đăng nhập thất bại: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final loginResponse = snapshot.data!;
              print('loginResponse: $loginResponse');
              print('data: ${loginResponse.data}');

              final username = loginResponse.data.username;
              final appver = loginResponse.data.appver;
              final token = loginResponse.data.token;
              final deviceid = loginResponse.data.deviceid;

              return ListView(
                children: [
                  ListTile(
                    title: Text('Data: $loginResponse'),
                  ),
                  ListTile(
                    title:
                        Text('Đăng nhập thành công: ${loginResponse.status}'),
                  ),
                  ListTile(
                    title: Text('Username: $username'),
                  ),
                  ListTile(
                    title: Text('Appver: $appver'),
                  ),
                  ListTile(
                    title: Text('Token: $token'),
                  ),
                  ListTile(
                    title: Text('Device ID: $deviceid'),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('Không có dữ liệu.'),
              );
            }
          },
        ),
      ),
    );
  }

  Future<LoginResponse> loginToApi() async {
    try {
      final loginApi = LoginApi(dio);
      final token = ApiKeyGenerator.getAPIKey();
      final response =
          await loginApi.login('84123456', 'abc@123456', 'chien', token);

      return response;
    } catch (e) {
      print('Đã xảy ra lỗi khi đăng nhập: $e');
      rethrow;
    }
  }
}
