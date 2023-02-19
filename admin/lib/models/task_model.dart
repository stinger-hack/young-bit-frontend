class TaskModel {
  final String description;
  final String image;
  final int progress;

  TaskModel({
    required this.description,
    required this.image,
    required this.progress
});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        description: json["description"],
      image: json["image_url"] == "string"
          || json["image_url"] == null
          ? "https://storage.yandexcloud.net/onboarding/82a9723cbafd4fd5a1fd01dd6b126638.png"
          : json["image_url"],
      progress: json["progress"]
    );
  }
}