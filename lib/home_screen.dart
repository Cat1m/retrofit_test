import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:retrofit_test/Api/api_key_generator.dart';
import 'package:retrofit_test/Api/api_provider.dart';
import 'package:retrofit_test/Model/huyenthi_response.dart/data_huyenthi.dart';
import 'package:retrofit_test/Model/phuongxa_response.dart/data_phuongxa.dart';
import 'package:retrofit_test/Model/quocgia_response.dart/data_quocgia.dart';
import 'package:retrofit_test/Model/tinhthanh_response.dart/data_tinhthanh.dart';
import 'package:retrofit_test/Model/tinhthanh_response.dart/tinhthanh_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedQuocGia = "";
  String selectedMaQG = "";
  String selectedTinhThanh = "";
  String selectedMaTT = "";
  String selectedHuyenThi = "";
  String selectedMaHT = "";
  String selectedPhuongXa = "";
  String selectedMaPX = "";
  List<DataQuocGia> quocgia = [];
  List<DataTinhThanh> tinhthanh = [];
  List<DataHuyenThi> huyenthi = [];
  List<DataPhuongXa> phuongxa = [];

  bool dataLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchData(); // Gọi phương thức để tải dữ liệu khi màn hình được khởi tạo.
  }

  void fetchData() async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    try {
      final loginResponse = await apiProvider.login(
        '84123456',
        'abc@123456',
        'chien',
        ApiKeyGenerator.getAPIKey(),
      );

      final userToken = loginResponse.data.token;
      print(userToken);
      final quocGiaResponse = await apiProvider.getListQuocGia();

      // Cập nhật quocgia và selectedQuocGia
      setState(() {
        selectedQuocGia = '';
        selectedMaQG = '';
        quocgia = quocGiaResponse.data;
      });

      // Gọi phương thức để tải danh sách tỉnh thành
      fetchTinhThanhData();
      fetchHuyenThiData();
      fetchPhuongXaData();
    } catch (error) {
      print('Lỗi khi tải dữ liệu: $error');
    }
  }

  void fetchTinhThanhData() async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    try {
      final tinhThanhResponse =
          await apiProvider.getListTinhThanh(selectedMaQG);

      // Cập nhật tinhthanh và selectedTinhThanh
      setState(() {
        selectedTinhThanh = '';
        selectedMaTT = '';
        tinhthanh = tinhThanhResponse.data;
        dataLoaded = true; // Đã tải xong dữ liệu
      });
    } catch (error) {
      print('Lỗi khi tải dữ liệu tỉnh thành: $error');
    }
  }

  void fetchHuyenThiData() async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    try {
      final huyenThiResponse = await apiProvider.getListHuyenThi(selectedMaTT);

      // Cập nhật tinhthanh và selectedTinhThanh
      setState(() {
        selectedHuyenThi = '';
        selectedMaHT = '';
        huyenthi = huyenThiResponse.data;
        dataLoaded = true; // Đã tải xong dữ liệu
      });
    } catch (error) {
      print('Lỗi khi tải dữ liệu tỉnh thành: $error');
    }
  }

  void fetchPhuongXaData() async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    try {
      final phuongXaResponse = await apiProvider.getListPhuongXa(selectedMaTT);

      // Cập nhật tinhthanh và selectedTinhThanh
      setState(() {
        selectedPhuongXa = '';
        selectedMaPX = '';
        phuongxa = phuongXaResponse.data;
        dataLoaded = true; // Đã tải xong dữ liệu
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
        ElevatedButton(
          onPressed: () {
            _showHuyenThiDialog(context, huyenthi);
          },
          child: Row(
            children: [
              Text(selectedHuyenThi),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _showPhuongXaDialog(context, phuongxa);
          },
          child: Row(
            children: [
              Text(selectedPhuongXa),
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
                      fetchTinhThanhData();
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
                      fetchHuyenThiData();
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

  void _showHuyenThiDialog(BuildContext context, List<DataHuyenThi> provinces) {
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
                      selectedHuyenThi = province.ten;
                      selectedMaHT = province.ma;
                      fetchPhuongXaData();
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

  void _showPhuongXaDialog(BuildContext context, List<DataPhuongXa> provinces) {
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
                      selectedPhuongXa = province.ten;
                      selectedMaPX = province.ma;
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
