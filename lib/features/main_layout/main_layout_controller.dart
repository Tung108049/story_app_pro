import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainLayoutController extends GetxController {
  // Biến lưu trạng thái tab hiện tại (mặc định là 0 - Trang chủ)
  var currentTab = 0.obs;

  void changeTab(int index) {
    // Nếu bấm nút Dấu + (index 2) thì không chuyển trang, chỉ hiện thông báo
    if (index == 2) {
      Get.snackbar(
        'Thông báo',
        'Tính năng Đăng truyện sắp ra mắt!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
      return;
    }
    currentTab.value = index;
  }
}