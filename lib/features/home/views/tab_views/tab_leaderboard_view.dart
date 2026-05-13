import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/tab_controllers/tab_leaderboard_controller.dart';

class TabLeaderboard extends StatelessWidget {
  TabLeaderboard({super.key});

  // Khởi tạo bộ não riêng cho BXH
  final TabLeaderboardController controller = Get.put(TabLeaderboardController());

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.emoji_events, size: 64, color: Colors.orange),
          SizedBox(height: 16),
          Text('Bảng Xếp Hạng đang được thi công...', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

