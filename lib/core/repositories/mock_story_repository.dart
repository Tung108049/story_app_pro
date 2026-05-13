import 'package:story_app_pro/core/repositories/i_novel_repository.dart';
import '../models/story_model.dart';
import 'i_comic_repository.dart';

class MockStoryRepository implements IComicRepository, INovelRepository {
  // Lấy 3 link m gửi làm hằng số cho dễ dùng lại
  final String imgAcheron = 'https://media.karousell.com/media/photos/products/2024/5/29/honkai_star_rail_hsr_acheron_c_1716981794_f8e413ac.jpg';
  final String imgKafka = 'https://i.pinimg.com/736x/e9/5c/29/e95c29c3d9188f89cffdac454c6e4edf.jpg';
  final String imgBingProxy = 'https://tse3.mm.bing.net/th/id/OIP.vqRZ9aEvDrO16FgjOirVdwHaLm?r=0&rs=1&pid=ImgDetMain&o=7&rm=3';

  @override
  Future<List<StoryModel>> getComicStories() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return [
      StoryModel(
        id: 1,
        title: '[HSR] Acheron: Hư Vô Tôn Giả',
        coverImageUrl: imgAcheron,
        contentType: 'comic',
        genres: ['Hành động', 'Viễn tưởng'],
        viewsCount: 2500000,
        averageRating: 5.0,
        isPaid: true,
        uploaderId: 10,
        authorName: 'HoYoverse',
        createdAt: DateTime.now().subtract(const Duration(minutes: 30)), // Vừa đăng 30 phút
      ),
      StoryModel(
        id: 2,
        title: '[HSR] Kafka - Lưới Nhện Thợ Săn',
        coverImageUrl: imgKafka,
        contentType: 'comic',
        genres: ['Tâm lý', 'Hành động', 'Drama'],
        viewsCount: 1800000,
        averageRating: 4.9,
        isPaid: false,
        uploaderId: 11,
        authorName: 'Stellaron Hunters',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      StoryModel(
        id: 3,
        title: '[WuWa] Yinlin - Con rối sấm sét',
        coverImageUrl: imgBingProxy,
        contentType: 'comic',
        genres: ['Phiêu lưu', 'Kỳ ảo'],
        viewsCount: 950000,
        averageRating: 4.8,
        isPaid: true,
        uploaderId: 15,
        authorName: 'Kuro Games',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      StoryModel(
        id: 4,
        title: '[ZZZ] Thanh kiếm của Miyabi',
        coverImageUrl: imgBingProxy,
        contentType: 'comic',
        genres: ['Hành động', 'Waifu'],
        viewsCount: 1200000,
        averageRating: 4.7,
        isPaid: false,
        uploaderId: 10,
        authorName: 'HoYoverse',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      StoryModel(
        id: 5,
        title: '[Genshin] Furina: Giọt Lệ Thủy Thần',
        coverImageUrl: imgBingProxy,
        contentType: 'comic',
        genres: ['Bi kịch', 'Phép thuật'],
        viewsCount: 3200000,
        averageRating: 5.0,
        isPaid: true,
        uploaderId: 10,
        authorName: 'HoYoverse',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
      StoryModel(
        id: 6,
        title: '[WuWa] Changli: Ngọn Lửa Bất Diệt',
        coverImageUrl: imgAcheron, // Dùng lại ảnh test
        contentType: 'comic',
        genres: ['Cổ trang', 'Hành động'],
        viewsCount: 880000,
        averageRating: 4.6,
        isPaid: false,
        uploaderId: 15,
        authorName: 'Kuro Games',
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
      ),
    ];
  }

  @override
  Future<List<StoryModel>> getNovelStories() async {
    await Future.delayed(const Duration(milliseconds: 800));

    return [
      StoryModel(
        id: 7,
        title: '[Star Rail] Nhật Ký Tàu Astral: Điểm đến Penacony',
        coverImageUrl: imgKafka,
        contentType: 'novel',
        genres: ['Sci-Fi', 'Trinh thám'],
        viewsCount: 660000,
        averageRating: 4.8,
        isPaid: false,
        uploaderId: 5,
        authorName: 'Pom-Pom',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      StoryModel(
        id: 8,
        title: '[ZZZ] Bí mật sau quán Mì',
        coverImageUrl: imgBingProxy,
        contentType: 'novel',
        genres: ['Đời thường', 'Hài hước'],
        viewsCount: 420000,
        averageRating: 4.5,
        isPaid: true,
        uploaderId: 12,
        authorName: 'General Chop',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      StoryModel(
        id: 9,
        title: '[WuWa] Nhật ký sinh tồn vùng Vũng Lầy',
        coverImageUrl: imgAcheron,
        contentType: 'novel',
        genres: ['Kinh dị', 'Sinh tồn'],
        viewsCount: 230000,
        averageRating: 4.3,
        isPaid: false,
        uploaderId: 18,
        authorName: 'Rover',
        createdAt: DateTime.now().subtract(const Duration(days: 4)),
      ),
      StoryModel(
        id: 10,
        title: '[Genshin] Lịch sử Đế Quân ở Liyue',
        coverImageUrl: imgKafka,
        contentType: 'novel',
        genres: ['Lịch sử', 'Kỳ ảo'],
        viewsCount: 1500000,
        averageRating: 4.9,
        isPaid: true,
        uploaderId: 10,
        authorName: 'Zhongli',
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
      ),
    ];
  }
}