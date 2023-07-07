import 'package:store_application/model/login.dart';

import '../model/user.dart';
import 'api_helper.dart';

class UserController {
  Future<LoginModel> login(String email, String password) async {
    try {
      var result = await ApiHelper().postRequest("/api/users/login", {
        "email": email,
        "password": password,
      });
      return LoginModel.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUser() async {
    try {
      var result = await ApiHelper().getRequest("/api/users/getMe");
      return User.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> create({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) async {
    try {
      var result = await ApiHelper().postDio2("/api/users", {
        "email": email,
        "password": password,
        "username": username,
        "phone": phone,
      });
      return User.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> update({
    String? id,
    String? email,
    // String? password,
    String? username,
    String? phone,
  }) async {
    try {
      var result = await ApiHelper().putRequest("/api/users", {
        "id": id,
        "email": email,
        // "password": password,
        "username": username,
        "phone": phone,
      });
      return User.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }
}
