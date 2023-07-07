import 'package:store_application/model/product.dart';

import 'address.dart';

class Order {
  List<Product>? products;
  Address address;
  int paymentMethodId;
  double total;
  double taxAmount;
  double subTotal;
  int userId;
  String createdAt;

// String createdAt;
  Order({
    required this.createdAt,
    required this.userId,
    required this.products,
    required this.address,
    required this.paymentMethodId,
    required this.total,
    required this.taxAmount,
    required this.subTotal,
  });
  // factory Order.fromJson(Map<String, dynamic> json) {
  //   double parsedTotal;
  //   double parsedTaxAmount;
  //   double parsedSubTotal;
  //   try {
  //     parsedTotal = double.parse(json['total'].toString());
  //   } catch (e) {
  //     parsedTotal = 0.0;
  //   }try {
  //     parsedTaxAmount = double.parse(json['tax_amount'].toString());
  //   } catch (e) {
  //     parsedTaxAmount = 0.0;
  //   }try {
  //     parsedSubTotal = double.parse(json['sub_total'].toString());
  //   } catch (e) {
  //     parsedSubTotal = 0.0;
  //   }return Order(
  //     userId: json["user_id"],
  //     total: parsedTotal,
  //     taxAmount: parsedTaxAmount,
  //     subTotal: parsedSubTotal,
  //     // products: json['Product'] != null
  //     //     ? Product.fromJson(json['Product'] as Map<String, dynamic>)
  //     //     : null,
  //     // products: Product.fromJson(json['Product']),
  //     address: Address.fromJson(json['Address']),
  //     paymentMethodId: json['payment_method_id'],
  //     createdAt: json['created_at'],
  //   );
  // }
  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "sub_total": subTotal,
        "tax_amount": taxAmount,
        "total": total,
        // "created_at": createdAt,
        "payment_method_id": paymentMethodId,
        "products": products!.map((e) => e.toJson()).toList(),
        "address": address.toJson(),
      };
}
