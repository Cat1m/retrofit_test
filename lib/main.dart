import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_test/Api/api_service.dart';
import 'package:retrofit_test/Model/LoginResponse/login_response.dart';
import 'package:retrofit_test/Model/quocgia_response.dart/quocgia_response.dart';

void main() {
  final dio = Dio();
  final apiService = ApiService(dio);

  runApp(MyApp(
    apiService: apiService,
  ));
}

class MyApp extends StatefulWidget {
  final ApiService apiService;

  const MyApp({Key? key, required this.apiService}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedQuocGia = "Việt Nam";
  int selectedMa = 190;

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
          future: widget.apiService.loginToApi(),
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
              final userToken = loginResponse.data.token;
              final deviceid = loginResponse.data.deviceid;

              return FutureBuilder<QuocgiaResponse>(
                future: widget.apiService.getListQuocGia(userToken),
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
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      TextField(
                                        decoration: const InputDecoration(
                                          labelText: 'Tìm kiếm quốc gia',
                                        ),
                                        onChanged: (value) {
                                          // Xử lý sự kiện tìm kiếm dựa trên giá trị người dùng nhập
                                        },
                                      ),
                                      const Text('Danh sách Quốc gia'),
                                      Expanded(
                                        child: ListView(
                                          children:
                                              quocGiaResponse.data.map((data) {
                                            return ListTile(
                                              title: Text(data.ten),
                                              onTap: () {
                                                setState(() {
                                                  selectedQuocGia = data.ten;
                                                });
                                                Navigator.of(context).pop();
                                                print(data.ma);
                                              },
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Đóng'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              Text(selectedQuocGia),
                              const Icon(Icons
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
      ),
    );
  }
}
