class LoginModel {
  String type;
  String token;

  // int id;

  LoginModel(
    this.type,
    this.token,
    // this.id,
  );

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      json['type'],
      json['token'],
      // json['id'],
    );
  }
}
