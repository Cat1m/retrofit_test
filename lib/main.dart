import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit_test/Api/api_key_generator.dart';
import 'package:retrofit_test/Api/api_provider.dart';
import 'package:retrofit_test/Model/quocgia_response.dart/data_quocgia.dart';
import 'package:retrofit_test/Model/tinhthanh_response.dart/data_tinhthanh.dart';
import 'package:retrofit_test/Model/tinhthanh_response.dart/tinhthanh_response.dart';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedQuocGia = "";
  String selectedMaQG = "";
  String selectedTinhThanh = "";
  String selectedMaTT = "";
  List<DataQuocGia> quocgia = []; // Define quocgia variable
  List<DataTinhThanh> tinhthanh = []; // Define tinhthanh variable

  bool dataLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    try {
      final loginResponse = await apiProvider.login(
          '84123456', 'abc@123456', 'chien', ApiKeyGenerator.getAPIKey());
      final userToken = loginResponse.data.token;

      final quocGiaResponse = await apiProvider.getListQuocGia(userToken);

      setState(() {
        selectedQuocGia = '';
        quocgia = quocGiaResponse.data;
        dataLoaded = true;
      });
    } catch (error) {
      print('Lỗi khi tải dữ liệu: $error');
    }
  }

  Future<void> fetchTinhThanhData(String userToken) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    try {
      final tinhThanhResponse =
          await apiProvider.getListTinhThanh(selectedMaQG, userToken);

      setState(() {
        selectedTinhThanh = '';
        selectedMaTT = '';
        tinhthanh = tinhThanhResponse.data;
      });
    } catch (error) {
      print('Lỗi khi tải dữ liệu tỉnh thành: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Demo'),
      ),
      body: dataLoaded
          ? buildMainContent()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget buildMainContent() {
    return ListView(
      children: [
        ElevatedButton(
          onPressed: () {
            _showCountryDialog(context, quocgia);
          },
          child: Row(
            children: [
              Text(selectedQuocGia),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _showTinhThanhDialog(context, tinhthanh);
          },
          child: Row(
            children: [
              Text(selectedTinhThanh),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ],
    );
  }

  void _showCountryDialog(BuildContext context, List<DataQuocGia> countries) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select a Country"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: countries.map((country) {
                return ListTile(
                  title: Text(country.ten),
                  onTap: () {
                    setState(() {
                      selectedQuocGia = country.ten;
                      selectedMaQG = country.ma;
                      fetchTinhThanhData(selectedMaQG);
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void _showTinhThanhDialog(
      BuildContext context, List<DataTinhThanh> provinces) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select a Province/City"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: provinces.map((province) {
                return ListTile(
                  title: Text(province.ten),
                  onTap: () {
                    setState(() {
                      selectedTinhThanh = province.ten;
                      selectedMaTT = province.ma;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
