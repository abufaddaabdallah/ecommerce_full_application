import '../model/category.dart';
import 'api_helper.dart';

class CategoryController {
  Future<List<Category>> getAll() async {
    try {
      dynamic jsonObject = await ApiHelper().getRequest("/api/categories");
      List<Category> categories = [];
      jsonObject.forEach((v) {
        categories.add(Category.fromJson(v));
      });
      return categories;
    } catch (ex) {
      rethrow;
    }
  }
  Future<List<Category>> getById() async {
    try {
      dynamic jsonObject = await ApiHelper().getRequest("/api/categories/1");
      List<Category> categories = [];
      jsonObject.forEach((v) {
        categories.add(Category.fromJson(v));
      });
      return categories;
    } catch (ex) {
      rethrow;
    }
  }
}