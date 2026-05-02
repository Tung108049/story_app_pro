import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Nhớ phải import Get
import 'views/home_view.dart'; // Import cái View mình vừa code

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. ĐỔI MaterialApp thành GetMaterialApp
    // (Để GetX nó có quyền điều khiển việc chuyển trang sau này)
    return GetMaterialApp(
      title: 'Story App Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeView(), // 2. Khai báo màn hình mở lên đầu tiên là HomeView
    );
  }
}