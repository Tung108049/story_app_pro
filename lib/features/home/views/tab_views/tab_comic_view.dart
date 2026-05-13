import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app_pro/features/home/controllers/tab_controllers/tab_comic_controller.dart';
import '../../controllers/home_controller.dart';

class TabComic extends StatelessWidget {
  TabComic({super.key});

  final TabComicController controller = Get.put(TabComicController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // 1. Loading State
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.pinkAccent),
        );
      }

      // 2. Empty StateSSSS
      if (controller.comicList.isEmpty) {
        return const Center(
          child: Text('No comics found!', style: TextStyle(color: Colors.grey)),
        );
      }

      // 3. Data Rendering [cite: 50, 54]
      return GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: controller.comicList.length,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final story = controller.comicList[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Hiển thị ảnh bìa từ URL [cite: 27, 50]
                      Image.network(
                        story.coverImageUrl,
                        fit: BoxFit.cover,
                        // TRƯỜNG HỢP LỖI: Dùng ảnh local asset của m
                        errorBuilder: (context, error, stackTrace) => Image.asset(
                          'assets/images/no_image.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Payment Badge [cite: 24, 50]
                      Positioned(
                        top: 6,
                        left: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: story.isPaid ? Colors.orange : Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            story.isPaid ? 'Paid' : 'Free',
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      // View Count [cite: 28, 50]
                      Positioned(
                        bottom: 6,
                        right: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.remove_red_eye, color: Colors.white, size: 10),
                              const SizedBox(width: 4),
                              Text(
                                '${story.viewsCount}',
                                style: const TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Story Title [cite: 26, 50]
              Text(
                story.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, height: 1.2),
              ),

              const SizedBox(height: 4),

              // First Genre Tag [cite: 21]
              if (story.genres.isNotEmpty)
                Text(
                  story.genres.first,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
            ],
          );
        },
      );
    });
  }
}