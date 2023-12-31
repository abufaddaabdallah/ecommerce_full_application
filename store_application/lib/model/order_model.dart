
class OrderModel {
  int id;
  int userId;
  int paymentMethodId;
  double total;
  double taxAmount;
  double subTotal;
  //late StatusModel status;
  String? createdAt;

  OrderModel(
      {required this.id,
        required this.userId,
        required this.paymentMethodId,
        required this.total,
        required this.taxAmount,
        required this.subTotal,
        //required this.status,
        this.createdAt});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json["id"],
      userId: json["user_id"],
      paymentMethodId: json["payment_method_id"],
      total: double.parse(json["total"].toString()),
      taxAmount: double.parse(json["tax_amount"].toString()),
      subTotal: double.parse(json["sub_total"].toString()),
     // status: StatusModel.fromJson(json['status']),
      createdAt: json["created_at"],
    );
  }


}
