class ShopModel {
  final String title;
  final String description;
  final String image;
  final int cost;

  ShopModel({
    required this.title,
    required this.description,
    required this.image,
    required this.cost
});

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
        title: json["title"],
      description: json["description"],
      image: json["img_link"],
      cost: json["cost"]
    );
  }
}