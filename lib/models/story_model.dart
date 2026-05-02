class Story {
  final int id;
  final String title;
  final String coverImageUrl;
  final String contentType;
  final int viewsCount;
  final double averageRating;
  final int isPaid;

  const Story({
    required this.id,
    required this.title,
    required this.coverImageUrl,
    required this.contentType,
    required this.viewsCount,
    required this.averageRating,
    required this.isPaid,
  });

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      id: int.tryParse(map['id'].toString()) ?? 0,
      title: map['title']?.toString() ?? 'Truyện chưa có tên',
      coverImageUrl: map['cover_image_url']?.toString() ?? '',
      contentType: map['content_type']?.toString() ?? 'novel',
      viewsCount: int.tryParse(map['views_count'].toString()) ?? 0,
      averageRating: double.tryParse(map['average_rating'].toString()) ?? 0.0,
      isPaid: int.tryParse(map['is_paid'].toString()) ?? 0,
    );
  }
}
