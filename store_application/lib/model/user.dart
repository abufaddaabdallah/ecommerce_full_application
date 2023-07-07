class User {
  int id;
  String username;
  String email;
  String? password;
  String? phone;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 1,
      username: json['username'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
    );
  }
}
