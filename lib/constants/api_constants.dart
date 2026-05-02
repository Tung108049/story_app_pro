class ApiConstants {
  // Máy ảo Android KHÔNG HIỂU 'localhost' là gì.
  // 10.0.2.2 là địa chỉ IP đặc biệt để máy ảo Android chọc được vào XAMPP trên máy tính.
  static const String baseUrl = 'http://10.0.2.2/story_api/';

  // Endpoint
  static const String getStories = '${baseUrl}get_stories.php';
}