import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit_test/Api/api_key_generator.dart';
import 'package:retrofit_test/Api/api_provider.dart';
import 'package:retrofit_test/Model/LoginResponse/login_response.dart';
import 'package:retrofit_test/Model/quocgia_response.dart/quocgia_response.dart';
// Import ApiProvider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApiProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Demo'),
      ),
      body: FutureBuilder<LoginResponse>(
        future: apiProvider.login(
            '84123456', 'abc@123456', 'chien', ApiKeyGenerator.getAPIKey()),
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
            final username = loginResponse.data.username;
            final appver = loginResponse.data.appver;
            final userToken = loginResponse.data.token;
            final deviceid = loginResponse.data.deviceid;

            return FutureBuilder<QuocgiaResponse>(
              future: apiProvider.getListQuocGia(userToken),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        'Lỗi khi lấy danh sách quốc gia: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  final quocGiaResponse = snapshot.data!;
                  final quocgia = quocGiaResponse.data;
                  print(quocgia);
                  return ListView(
                    children: [
                      ListTile(
                        title: Text('Data: $loginResponse'),
                      ),
                      ListTile(
                        title: Text(
                            'Đăng nhập thành công: ${loginResponse.status}'),
                      ),
                      ListTile(
                        title: Text('Username: $username'),
                      ),
                      ListTile(
                        title: Text('Appver: $appver'),
                      ),
                      ListTile(
                        title: Text('Token: $userToken'),
                      ),
                      ListTile(
                        title: Text('Device ID: $deviceid'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Xử lý sự kiện khi người dùng ấn vào nút
                          // ...
                        },
                        child: const Row(
                          children: [
                            Text(
                                'selectedQuocGia'), // Thay thế bằng selectedQuocGia từ dialog
                            Icon(Icons
                                .arrow_drop_down), // Biểu tượng mũi tên xuống
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text('Không có dữ liệu quốc gia.'),
                  );
                }
              },
            );
          } else {
            return const Center(
              child: Text('Không có dữ liệu.'),
            );
          }
        },
      ),
    );
  }
}
