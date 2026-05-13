import 'package:get/get.dart';

import '../../../../core/models/story_model.dart';
import '../../../../core/repositories/i_comic_repository.dart';


class TabComicController extends GetxController {
  final IComicRepository _storyRepo = Get.find<IComicRepository>();

  var comicList = <StoryModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchComicStories();
  }

  void fetchComicStories() async {
    isLoading.value = true;
    try {
      var data = await _storyRepo.getComicStories();
      comicList.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }
}