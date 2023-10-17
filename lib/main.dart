import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit_test/Api/api_provider.dart';
import 'package:retrofit_test/home_screen.dart';

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
