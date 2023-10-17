import 'package:dio/dio.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit_test/Api/api_service.dart';
import 'package:retrofit_test/main.dart';
// Import ApiService

void main() {
  testWidgets('Test your app functionality', (WidgetTester tester) async {
    // Create an instance of ApiService for testing
    final apiService = ApiService(Dio());

    // Build your app and trigger a frame.
    await tester.pumpWidget(MyApp(
      apiService: apiService,
    ));

    // Verify that the initial state of your app is as expected.
    expect(find.text('Login Demo'), findsOneWidget);
    expect(find.text('Đăng nhập thất bại:'), findsNothing);

    // You can write more test cases here to interact with your app's widgets.
    // For example, simulate button taps, text input, and verify expected outcomes.
  });
}
