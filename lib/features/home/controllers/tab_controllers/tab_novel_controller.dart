import 'package:get/get.dart';

import '../../../../core/models/story_model.dart';
import '../../../../core/repositories/i_novel_repository.dart';


class TabNovelController extends GetxController {
  final INovelRepository _storyRepo = Get.find<INovelRepository>();

  var novelList = <StoryModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNovelStories();
  }

  void fetchNovelStories() async {
    isLoading.value = true;
    try {
      var data = await _storyRepo.getNovelStories();
      novelList.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }
}