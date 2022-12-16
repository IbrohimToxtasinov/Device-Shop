class UserModel {
  final String userId;
  final String fullName;
  final String email;
  final String imageUrl;
  final int age;
  final String createdAt;
  final String fcmToken;
  final String firebaseUid;

  UserModel({
    required this.firebaseUid,
    required this.userId,
    required this.imageUrl,
    required this.fullName,
    required this.email,
    required this.age,
    required this.createdAt,
    required this.fcmToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
      fullName: json['full_name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      age: json['age'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? "",
      fcmToken: json['fcm_token'] as String? ?? "",
      firebaseUid: json['firebaseUid'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'full_name': fullName,
      'email': email,
      'image_url': imageUrl,
      'age': age,
      'created_at': createdAt,
      'fcm_token': fcmToken,
      'firebaseUid': firebaseUid,
    };
  }
}
