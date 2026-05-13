class StoryModel {
  final int id;
  final String title;
  final String coverImageUrl;
  final String contentType; //novel|comic
  final List<String> genres; //thể loại
  final int viewsCount;
  final double averageRating;
  final bool isPaid;
  final int uploaderId;
  final String authorName;


  //chi tiêt
  final String? description;
  final String? status; //ongoing | completed | drop
  final int? price;
  final String? priceType; // full | chapter | mixed
  final String? uploaderName;
  final int? authorId;
  final DateTime? createdAt;

  StoryModel({
    required this.id,
    required this.title,
    required this.coverImageUrl,
    required this.contentType,
    required this.genres,
    required this.viewsCount,
    required this.averageRating,
    required this.isPaid,
    required this.uploaderId,
    required this.authorName,
    this.description,
    this.status,
    this.price,
    this.priceType,
    this.uploaderName,
    this.authorId,
    this.createdAt,
  });

  // đổi Json-> Object Dart
  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id']?.toInt() ?? 0,
      title: json['title'] ?? '',
      coverImageUrl: json['cover_image_url'] ?? '',
      contentType: json['content_type'] ?? 'comic',
      genres: json['genres'] != null ? List<String>.from(json['genres']) : [],
      viewsCount: json['views_count']?.toInt() ?? 0,
      averageRating: json['average_rating']?.toDouble() ?? 0.0,
      isPaid: json['is_paid'] == 1,
      uploaderId: json['uploader_id']?.toInt() ?? 0,
      authorName: json['author_name'] ?? 'N/A',
      description: json['description'],
      status: json['status'],
      price: json['price']?.toInt(),
      priceType: json['price_type'],
      uploaderName: json['uploader_name'],
      authorId: json['author_id']?.toInt(),
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null,
    );
  }
}
