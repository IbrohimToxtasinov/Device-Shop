class CategoryModel {
  final String categoryId;
  final String categoryName;
  final String description;
  final String imageUrl;
  final String createdAt;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['category_id'] as String? ?? "",
      categoryName: json['category_name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
      createdAt: json['created_at'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'description': description,
      'image_url': imageUrl,
      'created_at': createdAt,
    };
  }
}