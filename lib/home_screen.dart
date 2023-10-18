import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit_test/Api/api_key_generator.dart';
import 'package:retrofit_test/Api/api_provider.dart';
import 'package:retrofit_test/Model/dantoc_response.dart/data_dantoc.dart';
import 'package:retrofit_test/Model/huyenthi_response.dart/data_huyenthi.dart';
import 'package:retrofit_test/Model/phuongxa_response.dart/data_phuongxa.dart';
import 'package:retrofit_test/Model/quocgia_response.dart/data_quocgia.dart';
import 'package:retrofit_test/Model/register_response.dart/register_response.dart';
import 'package:retrofit_test/Model/tinhthanh_response.dart/data_tinhthanh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
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
  List<DataQuocGia> quocGiaList = [];
  List<DataTinhThanh> tinhThanhList = [];
  List<DataHuyenThi> huyenThiList = [];
  List<DataPhuongXa> phuongXaList = [];
  List<DataDanToc> danTocList = [];
  List<String> selectedInfoList = [];

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
        quocGiaList = quocGiaResponse.data;
      });

      await fetchTinhThanhData();
      await fetchHuyenThiData();
      await fetchPhuongXaData();
      await fetchDanTocData();
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
        tinhThanhList = tinhThanhResponse.data;
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
        huyenThiList = huyenThiResponse.data;
        dataLoaded = true;
      });
    } catch (error) {
      print('Lỗi khi tải dữ liệu quận huyện: $error');
    }
  }

  Future<void> fetchPhuongXaData() async {
    final apiProvider = getApiProvider(context);

    try {
      final phuongXaResponse = await apiProvider.getListPhuongXa(selectedMaTT);

      setState(() {
        selectedPhuongXa = '';
        selectedMaPX = '';
        phuongXaList = phuongXaResponse.data;
        dataLoaded = true;
      });
    } catch (error) {
      print('Lỗi khi tải dữ liệu phường xã: $error');
    }
  }

  Future<void> fetchDanTocData() async {
    final apiProvider = getApiProvider(context);

    try {
      final danTocResponse = await apiProvider.getListDanToc();

      setState(() {
        selectedDanToc = '';
        selectedMaDT = '';
        danTocList = danTocResponse.data;
        dataLoaded = true;
      });
    } catch (error) {
      print('Lỗi khi tải dữ liệu dân tộc: $error');
    }
  }

  Future<void> registerNewAccount() async {
    final apiProvide = getApiProvider(context);

    try {
      final registerResponse = await apiProvide.registerNewAccount(
          '0359509251',
          'Chien1102',
          '...',
          'Lê Minh Chiến',
          '06/12/1997',
          '1',
          '190',
          '1',
          '1',
          '1',
          '1',
          '1',
          '1',
          '1',
          '...',
          '1',
          '...',
          ApiKeyGenerator.getAPIKey());
      print(registerResponse.toJson()); // In ra toàn bộ response để xem lỗi.

      if (registerResponse.status == "Success") {
        final message = registerResponse.message;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message!),
          ),
        );
      } else {
        final errorMessage = registerResponse.message;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi đăng ký: $errorMessage'),
          ),
        );
      }
    } catch (error) {
      print('Lỗi khi đăng ký tài khoản: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ứng dụng đăng nhập'),
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
              context, "Chọn một Quốc gia", quocGiaList, updateSelectedQuocGia),
          child: Row(
            children: [
              Text(selectedQuocGia),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => _showDialog(context, "Chọn một Tỉnh/Thành phố",
              tinhThanhList, updateSelectedTinhThanh),
          child: Row(
            children: [
              Text(selectedTinhThanh),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => _showDialog(context, "Chọn một Quận/Huyện",
              huyenThiList, updateSelectedHuyenThi),
          child: Row(
            children: [
              Text(selectedHuyenThi),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => _showDialog(context, "Chọn một Phường/Xã",
              phuongXaList, updateSelectedPhuongXa),
          child: Row(
            children: [
              Text(selectedPhuongXa),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => _showDialog(
              context, "Chọn Dân tộc", danTocList, updateSelectedDanToc),
          child: Row(
            children: [
              Text(selectedDanToc),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Điều hướng đến màn hình kiểm tra thông tin
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => buildConfirmationScreen()));
          },
          child: const Text('Kiểm tra lại thông tin'),
        ),
        ElevatedButton(
          onPressed: () {
            registerNewAccount(); // Gọi hàm đăng ký khi nút được bấm.
          },
          child: const Text('Đăng ký'), // Hiển thị chữ "Đăng ký" trên nút.
        )
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
      selectedInfoList.add("Quốc gia: $name");
    });
  }

  void updateSelectedTinhThanh(String name, String code) {
    setState(() {
      selectedTinhThanh = name;
      selectedMaTT = code;
      fetchHuyenThiData();
      selectedInfoList.add("Tỉnh Thành: $name");
    });
  }

  void updateSelectedHuyenThi(String name, String code) {
    setState(() {
      selectedHuyenThi = name;
      selectedMaHT = code;
      fetchPhuongXaData();
      selectedInfoList.add("Huyện Thị: $name");
    });
  }

  void updateSelectedPhuongXa(String name, String code) {
    setState(() {
      selectedPhuongXa = name;
      selectedMaPX = code;
      selectedInfoList.add("Phường xã: $name");
    });
  }

  void updateSelectedDanToc(String name, String code) {
    setState(() {
      selectedDanToc = name;
      selectedMaDT = code;
      selectedInfoList.add("Dân Tộc: $name");
    });
  }

  Widget buildConfirmationScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xác nhận thông tin'),
      ),
      body: ListView(
        children: [
          for (final info in selectedInfoList)
            ListTile(
              title: Text(info),
            ),
          ElevatedButton(
            onPressed: () {
              // Xử lý khi người dùng xác nhận
              // Điều này có thể bao gồm việc gửi thông tin đến máy chủ hoặc thực hiện hành động khác.
            },
            child: const Text('Xác nhận'),
          ),
        ],
      ),
    );
  }
}

ApiProvider getApiProvider(BuildContext context) {
  return Provider.of<ApiProvider>(context, listen: false);
}
