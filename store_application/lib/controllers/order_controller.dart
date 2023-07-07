import 'package:store_application/model/order_product.dart';

import '../model/order.dart';
import '../model/order_model.dart';
import 'api_helper.dart';

class OrderController {
  Future<List<OrderProduct>> getProductsByOrder(int orderId) async {
    try {
      dynamic jsonObject =
          await ApiHelper().getRequest4("api/orderProducts", orderId);
      List<OrderProduct> orderProducts = [];
      jsonObject.forEach((v) {
        orderProducts.add(OrderProduct.fromJson(v));
      });
      return orderProducts;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<List<OrderModel>> getAll(int userId) async {
    try {
      dynamic jsonObject = await ApiHelper().getRequest3("/api/orders", userId);
      List<OrderModel> orders = [];
      jsonObject.forEach((v) {
        orders.add(OrderModel.fromJson(v));
      });
      // print ("from controller: $OrderProduct");
      return orders;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<dynamic> create(Order order) async {
    try {
      var result = await ApiHelper().postDio("/api/orders", order.toJson());
      print(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
