import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/repositories/i_comic_repository.dart';
import 'core/repositories/i_novel_repository.dart';
import 'core/repositories/mock_story_repository.dart';
import 'features/main_layout/main_layout_view.dart';

void main() {
  final mockRepo = MockStoryRepository();
  Get.put<IComicRepository>(mockRepo);
  Get.put<INovelRepository>(mockRepo);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Story App Pro',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        useMaterial3: true,

      ),
      home: MainLayoutView(), // NỐI VÀO ĐÂY
    );
  }
}