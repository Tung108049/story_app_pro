import '../models/story_model.dart';

abstract class IComicRepository {
  Future<List<StoryModel>> getComicStories();
// Sau này thêm: Future<StoryModel> getComicDetail(int id);
}
