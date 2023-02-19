class ImportantModel {
  final String text;
  final String createdAt;

  ImportantModel({
    required this.text,
    required this.createdAt
});

  factory ImportantModel.fromJson(Map<String, dynamic> json) {
    return ImportantModel(
        text: json["main_text"],
      createdAt: json["created_at"]
    );
  }
}