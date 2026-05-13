import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app_pro/features/home/controllers/tab_controllers/tab_novel_controller.dart';

class TabNovel extends StatelessWidget {
  TabNovel({super.key});

  final TabNovelController controller = Get.put(TabNovelController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator(color: Colors.blueAccent));
      }

      if (controller.novelList.isEmpty) {
        return const Center(child: Text('No novels found!'));
      }

      return ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: controller.novelList.length,
        separatorBuilder: (context, index) => const Divider(height: 24, color: Colors.transparent),
        itemBuilder: (context, index) {
          final story = controller.novelList[index];

          return SizedBox(
            height: 120,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Image.network(
                      story.coverImageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset('assets/images/no_image.jpg', fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // 2. Thông tin bên phải
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        story.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Author: ${story.authorName}',
                        style: const TextStyle(fontSize: 13, color: Colors.blueGrey),
                      ),
                      const SizedBox(height: 4),
                      // Hiển thị tóm tắt ngắn (Nếu có)
                      Expanded(
                        child: Text(
                          story.description ?? 'No description available for this novel...',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ),

                      // Row chứa View và Rating
                      Row(
                        children: [
                          Icon(Icons.star, size: 14, color: Colors.orange.shade400),
                          const SizedBox(width: 4),
                          Text('${story.averageRating}', style: const TextStyle(fontSize: 12)),
                          const SizedBox(width: 16),
                          const Icon(Icons.remove_red_eye, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text('${story.viewsCount}', style: const TextStyle(fontSize: 12)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}