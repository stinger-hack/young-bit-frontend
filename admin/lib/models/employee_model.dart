class EmployeeModel {
  final String image;
  final String firstName;
  final String lastName;
  final String role;
  final int score;
  final List cards;

  EmployeeModel({
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.score,
    required this.cards
});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
        image: json["img_link"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      role: json["role"],
      score: json["score"],
      cards: json["cards"]
    );
  }
}