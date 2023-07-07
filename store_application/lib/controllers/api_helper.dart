import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import '../shared/constant.dart';


class ApiHelper {
  // final String DOMAIN = "192.168.1.41:3333";
  final String DOMAIN = AppRoutes.server;

  Future<String> getToken() async {
    var storage = const FlutterSecureStorage();
    bool check = await storage.containsKey(key: "token");
    if (check) {
      String result = await storage.read(key: "token") as String;
      return result;
    }
    return "";
  }

  Future<dynamic> getRequest(String path) async {
    try {
      Uri uriFunction = Uri.http(DOMAIN, path);
      var token = await getToken();
      var headers = {
        "Authorization": token,
      };
      http.Response response = await http.get(uriFunction, headers: headers);

      return responseFunction(response);
    } catch (ex) {
      print(ex);
      return (ex);
    }
  }

  Future<dynamic> getRequest2(String path, int categoryId) async {
    try {
      Uri uriFunction = Uri.http(DOMAIN, path);
      var token = await getToken();
      var headers = {
        "Authorization": token,
        "categoryId": categoryId.toString()
      };
      http.Response response = await http.get(uriFunction.replace(
          queryParameters: {'categoryId': categoryId.toString()}),
          headers: headers);

      return responseFunction(response);
    } catch (ex) {
      print(ex);
      return (ex);
    }
  }
  Future<dynamic> getRequest3(String path, int userId) async {
    try {
      Uri uriFunction = Uri.http(DOMAIN, path);
      var token = await getToken();
      var headers = {
        "Authorization": token,
        "userId": userId.toString()
      };
      http.Response response = await http.get(uriFunction.replace(
          queryParameters: {'userId': userId.toString()}),
          headers: headers);

      return responseFunction(response);
    } catch (ex) {
      print(ex);
      return (ex);
    }
  }
  Future<dynamic> getRequest4(String path, int orderId) async {
    try {
      Uri uriFunction = Uri.http(DOMAIN, path);
      var token = await getToken();
      var headers = {
        "Authorization": token,
        "orderId": orderId.toString()
      };
      http.Response response = await http.get(uriFunction.replace(
          queryParameters: {'orderId': orderId.toString()}),
          headers: headers);

      return responseFunction(response);
    } catch (ex) {
      print(ex);
      return (ex);
    }
  }
  Future<dynamic> postRequest(String path, Map body) async {
    Uri uriFunction = Uri.http(DOMAIN, path);
    http.Response response = await http.post(uriFunction, body: body);
    return responseFunction(response);
  }

  Future<dynamic> putRequest(String path, Map body) async {
    Uri uriFunction = Uri.http(DOMAIN, path);
    http.Response response = await http.put(uriFunction, body: body);
    return responseFunction(response);
  }

  Future<dynamic> deleteRequest(String path) async {
    Uri uriFunction = Uri.http(DOMAIN, path);
    http.Response response = await http.delete(uriFunction);
    return responseFunction(response);
  }

  dynamic responseFunction(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        dynamic jsonObject = jsonDecode(response.body);
        return jsonObject;
      case 400:
        throw "Bad Request";
      case 401:
        throw "Email or Password invalid";
      case 402:
        throw "Payment Required";
      case 403:
        throw "Forbidden";
      case 404:
        throw "Not Found";
      case 500:
        throw "Server Error :(";
      default:
        throw "Server Error :(";
    }
  }

  Future postDio(String path, Map body) async {
    final dio = Dio();

    var token = await getToken();
    var headers = {"Authorization": token};

    Response response = await dio.post(
      'http://$DOMAIN$path',
      data: body,
      options: Options(
        headers: headers,
      ),
    );
    print(response);
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw "Bad Request";
      case 401:
        throw "Unauthorized";
      case 402:
        throw "Payment Required";
      case 403:
        throw "Forbidden";
      case 404:
        throw "Not Found";
      case 500:
        throw "Server Error :(";
      default:
        throw "Server Error :(";
    }
  }
  Future postDio2(String path, Map body) async {
    final dio = Dio();

    Response response = await dio.post(
      'http://$DOMAIN$path',
      data: body,
      options: Options(),
    );
    print(response);
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw "Bad Request";
      case 401:
        throw "Unauthrizied";
      case 402:
        throw "Payment Required";
      case 403:
        throw "Forbidden";
      case 404:
        throw "Not Found";
      case 500:
        throw "Server Error :(";
      default:
        throw "Server Error :(";
    }
  }

  Future uploadImage(File file, urlPath) async {
    final dio = Dio();

    var token = await getToken();
    var headers = {"Authorization": token};

    FormData formData = FormData.fromMap({
      "image_file": await MultipartFile.fromFile(file.path,
          filename: file.path
              .split("/")
              .last)
    });
    Response response = await dio.post(
      'http://$DOMAIN$urlPath',
      data: formData,
      options: Options(
        headers: headers,
      ),
    );
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw "Bad Request";
      case 401:
        throw "Unauthorized";
      case 402:
        throw "Payment Required";
      case 403:
        throw "Forbidden";
      case 404:
        throw "Not Found";
      case 500:
        throw "Server Error :(";
      default:
        throw "Server Error :(";
    }
  }
}
