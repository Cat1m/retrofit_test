import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit_test/Api/api_key_generator.dart';
import 'package:retrofit_test/Api/api_provider.dart';
import 'package:retrofit_test/Model/dantoc_response.dart/data_dantoc.dart';
import 'package:retrofit_test/Model/huyenthi_response.dart/data_huyenthi.dart';
import 'package:retrofit_test/Model/phuongxa_response.dart/data_phuongxa.dart';
import 'package:retrofit_test/Model/quocgia_response.dart/data_quocgia.dart';
import 'package:retrofit_test/Model/tinhthanh_response.dart/data_tinhthanh.dart';
import 'package:retrofit_test/Model/userinfor_response.dart/data_userinfor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userToken;
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
  List<DataUserInfor> userInforList = [];

  bool dataLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void handleApiError(dynamic error) {
    print("Lỗi khi tải dữ liệu: $error");
    if (error is ApiError) {
      // Xử lý lỗi API theo cách bạn muốn ở đây
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi API: ${error.message}'),
        ),
      );
    } else {
      // Xử lý lỗi khác
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi: $error'),
        ),
      );
    }
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

      userToken = loginResponse.data.token;
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
      handleApiError(error);
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
      handleApiError(error);
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
      handleApiError(error);
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
      handleApiError(error);
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
      handleApiError(error);
    }
  }

  Future<void> getOTP() async {
    final apiProvider = getApiProvider(context);

    try {
      final otpResponse = await apiProvider.getOTP(userToken!);
      if (otpResponse.status == "Success") {
        // ignore: use_build_context_synchronously
        showApiMessage(context, otpResponse.message!);
      } else {
        // ignore: use_build_context_synchronously
        showApiMessage(context, otpResponse.message!);
      }

      setState(() {});
    } catch (error) {
      handleApiError(error);
    }
  }

  Future<void> getResetPassword() async {
    final apiProvider = getApiProvider(context);

    try {
      final resetPassword = await apiProvider.getResetPassword(
        '0123456',
        'abc@123456',
        'abc@123456',
        userToken!,
      );
      if (resetPassword.status == "Success") {
        // ignore: use_build_context_synchronously
        showApiMessage(context, resetPassword.message!);
      } else {
        // ignore: use_build_context_synchronously
        showApiMessage(context, resetPassword.message!);
      }
    } catch (error) {
      handleApiError(error);
    }
  }

  Future<void> getForgotPassword() async {
    final apiProvider = getApiProvider(context);

    try {
      final forgotPassword = await apiProvider.getForgotPassword(
        '0123456',
        'abc@1234',
        '123456',
        ApiKeyGenerator.getAPIKey(),
      );
      if (forgotPassword.status == "Success") {
        // ignore: use_build_context_synchronously
        showApiMessage(context, forgotPassword.message!);
      } else {
        // ignore: use_build_context_synchronously
        showApiMessage(context, forgotPassword.message!);
      }
    } catch (error) {
      handleApiError(error);
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
        // ignore: use_build_context_synchronously
        showApiMessage(context, registerResponse.message!);
      } else {
        // ignore: use_build_context_synchronously
        showApiMessage(context, registerResponse.message!);
      }
    } catch (error) {
      handleApiError(error);
    }
  }

  Future<void> fetchUserInfor() async {
    final apiProvider = getApiProvider(context);

    try {
      print('token người dùng$userToken');
      final userInforResponse = await apiProvider.getListUserInfor(userToken!);

      setState(() {
        userInforList = userInforResponse.data;
      });
      print('đây là trả về từ call api userinfo $userInforResponse');
    } catch (error) {
      handleApiError(error);
    }
  }

  Future<void> updateUserInfor() async {
    final apiProvide = getApiProvider(context);
    print("update: $userToken");

    try {
      final updateUserInfor = await apiProvide.updateUserInfor(
          '84123456',
          '...',
          'Lê Minh Chiến',
          '06/12/1997',
          '1',
          '190',
          '1',
          '1',
          '1',
          'Số 38,...',
          '1',
          'AFASKDJASDJSAK',
          'ADSKJDSAADS;',
          '...',
          '1',
          '1',
          userToken!);
      print(updateUserInfor.toJson()); // In ra toàn bộ response để xem lỗi.

      if (updateUserInfor.status == "OK") {
        // ignore: use_build_context_synchronously
        showApiMessage(context, updateUserInfor.message!);
      } else {
        // ignore: use_build_context_synchronously
        showApiMessage(context, updateUserInfor.message!);
      }
    } catch (error) {
      handleApiError(error);
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
        ),
        ElevatedButton(
          onPressed: () {
            fetchUserInfor();
            print(
                'đây là userinfor: $userInforList'); // Gọi hàm đăng ký khi nút được bấm.
          },
          child: const Text(
              'Thông tin tài khoảng'), // Hiển thị chữ "Đăng ký" trên nút.
        ),
        ElevatedButton(
          onPressed: () {
            getOTP(); // Gọi hàm đăng ký khi nút được bấm.
          },
          child:
              const Text('quên mật khẩu'), // Hiển thị chữ "Đăng ký" trên nút.
        ),
        ElevatedButton(
          onPressed: () {
            getResetPassword(); // Gọi hàm đăng ký khi nút được bấm.
          },
          child:
              const Text('Reset mật khẩu'), // Hiển thị chữ "Đăng ký" trên nút.
        ),
        ElevatedButton(
          onPressed: () {
            getForgotPassword(); // Gọi hàm đăng ký khi nút được bấm.
          },
          child:
              const Text('fogot password'), // Hiển thị chữ "Đăng ký" trên nút.
        ),
        ElevatedButton(
          onPressed: () {
            updateUserInfor(); // Gọi hàm đăng ký khi nút được bấm.
          },
          child: const Text(
              'Cập nhật thông tin'), // Hiển thị chữ "Đăng ký" trên nút.
        ),

        // Hiển thị danh sách thông tin người dùng
        if (userInforList.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: userInforList.length,
            itemBuilder: (context, index) {
              final user = userInforList[index];
              return Card(
                child: ListTile(
                  title: Text('Họ và tên: ${user.UserName}'),
                  subtitle: Text('Ngày sinh: ${user.NgaySinh}'),
                  // Hiển thị các thông tin khác ở đây tương tự
                ),
              );
            },
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

  void showApiMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
              color: Colors.white), // Đặt màu chữ thành màu trắng
        ),
        duration: const Duration(milliseconds: 200),
        backgroundColor: Colors.red, // Đặt màu nền thành màu đỏ
      ),
    );
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

class ApiError {
  final String message;

  ApiError(this.message);
}
