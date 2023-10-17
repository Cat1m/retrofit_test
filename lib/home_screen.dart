import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit_test/Api/api_key_generator.dart';
import 'package:retrofit_test/Api/api_provider.dart';
import 'package:retrofit_test/Model/dantoc_response.dart/data_dantoc.dart';
import 'package:retrofit_test/Model/huyenthi_response.dart/data_huyenthi.dart';
import 'package:retrofit_test/Model/phuongxa_response.dart/data_phuongxa.dart';
import 'package:retrofit_test/Model/quocgia_response.dart/data_quocgia.dart';
import 'package:retrofit_test/Model/tinhthanh_response.dart/data_tinhthanh.dart';

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
  String selectedDanToc = "";
  String selectedMaDT = "";
  List<DataQuocGia> quocgia = [];
  List<DataTinhThanh> tinhthanh = [];
  List<DataHuyenThi> huyenthi = [];
  List<DataPhuongXa> phuongxa = [];
  List<DataDanToc> dantoc = [];

  bool dataLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final apiProvider = getApiProvider(context);

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

      setState(() {
        selectedQuocGia = '';
        selectedMaQG = '';
        selectedTinhThanh = "";
        selectedMaTT = "";
        selectedHuyenThi = "";
        selectedMaHT = "";
        selectedPhuongXa = "";
        selectedMaPX = "";
        selectedDanToc = "";
        selectedMaDT = "";
        quocgia = quocGiaResponse.data;
      });

      fetchTinhThanhData();
      fetchHuyenThiData();
      fetchPhuongXaData();
      fetchDanTocData();
    } catch (error) {
      print('Lỗi khi tải dữ liệu: $error');
    }
  }

  Future<void> fetchTinhThanhData() async {
    final apiProvider = getApiProvider(context);

    try {
      final tinhThanhResponse =
          await apiProvider.getListTinhThanh(selectedMaQG);

      setState(() {
        selectedTinhThanh = '';
        selectedMaTT = '';
        tinhthanh = tinhThanhResponse.data;
        dataLoaded = true;
      });
    } catch (error) {
      print('Lỗi khi tải dữ liệu tỉnh thành: $error');
    }
  }

  Future<void> fetchHuyenThiData() async {
    final apiProvider = getApiProvider(context);

    try {
      final huyenThiResponse = await apiProvider.getListHuyenThi(selectedMaTT);

      setState(() {
        selectedHuyenThi = '';
        selectedMaHT = '';
        huyenthi = huyenThiResponse.data;
        dataLoaded = true;
      });
    } catch (error) {
      print('Lỗi khi tải dữ liệu tỉnh thành: $error');
    }
  }

  Future<void> fetchPhuongXaData() async {
    final apiProvider = getApiProvider(context);

    try {
      final phuongXaResponse = await apiProvider.getListPhuongXa(selectedMaTT);

      setState(() {
        selectedPhuongXa = '';
        selectedMaPX = '';
        phuongxa = phuongXaResponse.data;
        dataLoaded = true;
      });
    } catch (error) {
      print('Lỗi khi tải dữ liệu tỉnh thành: $error');
    }
  }

  Future<void> fetchDanTocData() async {
    final apiProvider = getApiProvider(context);

    try {
      final danTocResponse = await apiProvider.getListDanToc();

      setState(() {
        selectedDanToc = '';
        selectedMaDT = '';
        dantoc = danTocResponse.data;
        dataLoaded = true;
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
          onPressed: () => _showDialog(
              context, "Select a Country", quocgia, updateSelectedQuocGia),
          child: Row(
            children: [
              Text(selectedQuocGia),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => _showDialog(context, "Select a Province/City",
              tinhthanh, updateSelectedTinhThanh),
          child: Row(
            children: [
              Text(selectedTinhThanh),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => _showDialog(context, "Select a Province/City",
              huyenthi, updateSelectedHuyenThi),
          child: Row(
            children: [
              Text(selectedHuyenThi),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => _showDialog(context, "Select a Province/City",
              phuongxa, updateSelectedPhuongXa),
          child: Row(
            children: [
              Text(selectedPhuongXa),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => _showDialog(
              context, "Select Dân Tộc", dantoc, updateSelectedDanToc),
          child: Row(
            children: [
              Text(selectedDanToc),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ],
    );
  }

  void _showDialog(
      BuildContext context, String title, List items, Function updateFunction) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: items.map((item) {
                return ListTile(
                  title: Text(item.ten),
                  onTap: () {
                    updateFunction(item.ten, item.ma);
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

  void updateSelectedQuocGia(String name, String code) {
    setState(() {
      selectedQuocGia = name;
      selectedMaQG = code;
      fetchTinhThanhData();
    });
  }

  void updateSelectedTinhThanh(String name, String code) {
    setState(() {
      selectedTinhThanh = name;
      selectedMaTT = code;
      fetchHuyenThiData();
    });
  }

  void updateSelectedHuyenThi(String name, String code) {
    setState(() {
      selectedHuyenThi = name;
      selectedMaHT = code;
      fetchPhuongXaData();
    });
  }

  void updateSelectedPhuongXa(String name, String code) {
    setState(() {
      selectedPhuongXa = name;
      selectedMaPX = code;
    });
  }

  void updateSelectedDanToc(String name, String code) {
    setState(() {
      selectedDanToc = name;
      selectedMaDT = code;
    });
  }
}

ApiProvider getApiProvider(BuildContext context) {
  return Provider.of<ApiProvider>(context, listen: false);
}
