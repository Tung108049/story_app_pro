import 'package:get/get.dart';
import 'package:story_app_pro/models/story_model.dart';
import 'package:story_app_pro/services/story_service.dart';

class HomeController extends GetxController{
  //.obs theo dõi thay đổi và cập nhật riêng lẻ
  var isLoading = true.obs;
  var storyList = <Story>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStoriesFromApi();
  }

  void fetchStoriesFromApi() async{
    try{
      isLoading(true);
      //Gọi fetchStories để lấy dữ liệu
      var stories = await StoryService.fetchStories();
      if(stories.isNotEmpty){
        storyList.value = stories;
      }
    } finally{
      isLoading(false);
    }
  }
}