import 'package:store_application/model/product.dart';

class OrderProduct {
  int id;
  int orderId;
  int productId;
  int qty;
  double price;
  Product? products;

  OrderProduct({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.qty,
    required this.price,
    required this.products,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) {
    try {
      return OrderProduct(
          id: json["id"],
          orderId: int.parse(json["order_id"].toString()),
          productId: int.parse(json["product_id"].toString()),
          qty: int.parse(json["qty"].toString()),
          price: double.parse(json["price"].toString()),
          // products: Product.fromJson(json['product']));
      products: json['Product'] != null
          ? Product.fromJson(json['Product'] as Map<String, dynamic>)
          : null,);
    } catch (er) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": orderId,
        "sub_total": productId,
        "qty": qty,
        "price": price,
        "product": products!.toJson()
      };
}
