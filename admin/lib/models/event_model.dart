class EventModel {
  final int id;
  final String title;
  final String image;
  final String createdAt;
  final UserModel? user;

  EventModel({
    required this.id,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.user
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json["id"],
        title: json["title"],
        image: json["image_url"] == "string"
            || json["image_url"] == null
            ? "https://storage.yandexcloud.net/onboarding/f3f5ba08b30c43c0bd8101da6a2576db.jpg"
            : json["image_url"],
      createdAt: json["created_at"],
      user: json["user"] == null
          ? null
          : UserModel.fromJson(json["user"])
    );
  }
}

class UserModel {
  final String firstName;
  final String lastName;
  final String image;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.image
});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        firstName: json["first_name"],
      lastName: json["last_name"],
      image: json["img_link"]
    );
  }
}