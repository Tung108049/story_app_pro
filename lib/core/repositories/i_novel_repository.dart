import '../models/story_model.dart';

abstract class INovelRepository {
  Future<List<StoryModel>> getNovelStories();
}