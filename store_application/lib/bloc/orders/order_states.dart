


import '../../model/order_model.dart';
import '../../model/order_product.dart';

abstract class OrdersStates {}

class InitialState extends OrdersStates {}

class SuccessState extends OrdersStates {
  List<OrderModel>? orders;
  List<OrderProduct>? orderProducts;
  SuccessState({ this.orders,  this.orderProducts});
}

class FailureState extends OrdersStates {}

class LoadingState extends OrdersStates {}

