import '../model/product.dart';
import 'api_helper.dart';

class ProductController {
  Future<List<Product>> getAll() async {
    try {
      dynamic jsonObject = await ApiHelper().getRequest("/api/products");
      List<Product> products = [];
      jsonObject.forEach((v) {
        products.add(Product.fromJson(v));
      });
      // print("from controller: $products");
      return products;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<List<Product>> getProductByCategoryId(int categoryId) async {
    try {
      dynamic jsonObject =
          await ApiHelper().getRequest2("api/products",categoryId);
      List<Product> products = [];
      jsonObject.forEach((v) {
        products.add(Product.fromJson(v));
      });
      return products;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
}
// Future<Product?> getByBarcode(String barcode) async {
//   try {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString("token");
//     print("Token: $token");
//     if (token == null) {
//       throw Exception('No Token Available');
//     }
//     dynamic response = await ApiHelper().getRequest(
//       "/v1/products/barcode/$barcode",
//       headers: {'Authorization': token},
//       token: token,
//     );
//     dynamic jsonObject = json.decode(response);
//     return Product.fromJson(jsonObject);
//   } on FormatException catch (e) {
//     print('Failed to parse response as JSON: $e');
//     return null;
//   } catch (e) {
//     print("Failed to get product with barcode $barcode: $e");
//     rethrow;
//   }
// }
