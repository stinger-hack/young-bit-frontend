class LibraryModel {
  final String name;
  final String image;
  final int progress;

  LibraryModel({
    required this.name,
    required this.image,
    required this.progress
});

  factory LibraryModel.fromJson(Map<String, dynamic> json) {
    return LibraryModel(
        name: json["name"],
      image: json["img_link"],
      progress: json["progress"]
    );
  }
}