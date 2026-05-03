import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app_pro/models/story_model.dart';
import 'package:story_app_pro/services/story_service.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;

  RxList<Story> dsTruyenDeCu = <Story>[].obs;
  RxList<Story> dsMoiCapNhat = <Story>[].obs;

  //chuyển đổi NavigationBar
  var currentBottomTab = 0.obs;

  void changeBottomTab(int index) {
    // Nếu người dùng bấm vào nút Dấu + ở giữa (Index = 2)
    if (index == 2) {
      // Thường nút này để mở Popup hoặc BottomSheet đăng truyện, chứ ko chuyển trang
      Get.snackbar(
          'Thông báo',
          'Tính năng Đăng truyện đang phát triển!',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.pinkAccent, colorText: Colors.white
      );
      return; // Dừng lại, ko đổi Tab
    }
    // Các nút khác thì cho phép đổi Tab bình thường
    currentBottomTab.value = index;
  }

  @override
  void onInit() {
    super.onInit();

    // GỌI HÀM BƠM DATA GIẢ VÀO ĐÂY ĐỂ HIỂN THỊ UI LÚC MỞ APP
    _loadFakeData();

    // Tạm thời comment hàm API lại
    // fetchStoriesFromApi();
  }

  void fetchStoriesFromApi() async {
    try {
      isLoading(true);
      var stories = await StoryService.fetchStories();
      if (stories.isNotEmpty) {
        // Tới lúc nối API thật thì gán: dsTruyenDeCu.value = stories;
      }
    } finally {
      isLoading(false);
    }
  }


  // HÀM BƠM DỮ LIỆU GIẢ
  void _loadFakeData() {
    dsTruyenDeCu.value = [
      const Story(
        id: 1,
        title: 'Cẩm Nang Build Đĩa ZZZ Cho Miyabi Trấn Phái',
        coverImageUrl: 'https://i.pinimg.com/736x/9a/8b/fc/9a8bfcc4eb554336950585d10c120403.jpg',
        contentType: 'guide',
        viewsCount: 6593000,
        averageRating: 4.9,
        isPaid: 0,
      ),
      const Story(
        id: 2,
        title: 'Sinh Tồn Trong NightfallCraft Cùng The Mimic',
        coverImageUrl: 'https://i.pinimg.com/736x/9a/8b/fc/9a8bfcc4eb554336950585d10c120403.jpg',
        contentType: 'novel',
        viewsCount: 13000,
        averageRating: 4.5,
        isPaid: 1,
      ),
      const Story(
        id: 3,
        title: 'Bí Mật Nguyên Tố Huyền Mặc Của Yixuan',
        coverImageUrl: 'https://i.pinimg.com/736x/9a/8b/fc/9a8bfcc4eb554336950585d10c120403.jpg',
        contentType: 'comic',
        viewsCount: 3200000,
        averageRating: 5.0,
        isPaid: 1,
      ),
      const Story(
        id: 4,
        title: 'Hành Trình Fix Bug GetX Lúc 2h Sáng',
        coverImageUrl: 'https://i.pinimg.com/736x/9a/8b/fc/9a8bfcc4eb554336950585d10c120403.jpg',
        contentType: 'novel',
        viewsCount: 999999,
        averageRating: 5.0,
        isPaid: 0,
      ),
    ];

    // 2. DATA CHO TAB MỚI CẬP NHẬT
    dsMoiCapNhat.value = [
      const Story(
        id: 11,
        title: 'Hành Trình Gõ Code Bằng Phím Cơ Xinmeng M87',
        coverImageUrl: 'https://i.pinimg.com/736x/9a/8b/fc/9a8bfcc4eb554336950585d10c120403.jpg',
        contentType: 'novel',
        viewsCount: 15400,
        averageRating: 4.8,
        isPaid: 0,
        latestChapter: 'Chương 12: Thẩm âm Switch Outemu Yellow',
        genres: 'Đời thường, Công nghệ',
      ),
      const Story(
        id: 12,
        title: 'Chiến Thần ZZZ: Dị Thường Trở Lại',
        coverImageUrl: 'https://i.pinimg.com/736x/9a/8b/fc/9a8bfcc4eb554336950585d10c120403.jpg',
        contentType: 'comic',
        viewsCount: 890000,
        averageRating: 4.9,
        isPaid: 1,
        latestChapter: 'Chương 88: Hư thú giáng lâm',
        genres: 'Hành động, Viễn tưởng',
      ),
      const Story(
        id: 13,
        title: 'Bí Quyết Skincare Cho Dev Chạy Deadline',
        coverImageUrl: 'https://i.pinimg.com/736x/9a/8b/fc/9a8bfcc4eb554336950585d10c120403.jpg',
        contentType: 'guide',
        viewsCount: 42000,
        averageRating: 4.5,
        isPaid: 0,
        latestChapter: 'Chương 5: Sức mạnh tẩy trang L\'Oreal',
        genres: 'Cẩm nang, Đời sống',
      ),
      const Story(
        id: 14,
        title: 'Trùng Sinh Về Cứu Lỗi BitLocker',
        coverImageUrl: 'https://i.pinimg.com/736x/9a/8b/fc/9a8bfcc4eb554336950585d10c120403.jpg',
        contentType: 'novel',
        viewsCount: 77000,
        averageRating: 4.2,
        isPaid: 1,
        latestChapter: 'Chương 30: Passcode thất lạc',
        genres: 'Hài hước, Kỹ năng',
      ),
    ];
  }
}