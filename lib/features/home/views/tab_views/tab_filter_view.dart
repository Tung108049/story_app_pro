import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/tab_controllers/tab_filter_controller.dart';

class TabFilter extends StatelessWidget {
  TabFilter({super.key});

  final TabFilterController controller = Get.put(TabFilterController());


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.manage_search, size: 64, color: Colors.blue),
          SizedBox(height: 16),
          Text('Bộ lọc nâng cao (Fuzzy Search) sắp ra mắt!', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}