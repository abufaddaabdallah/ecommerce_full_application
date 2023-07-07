import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_application/bloc/orders/order_events.dart';
import 'package:store_application/bloc/orders/order_states.dart';
import 'package:store_application/controllers/order_controller.dart';

import '../../model/order_model.dart';
import '../../model/order_product.dart';

class OrdersBloc extends Bloc<OrdersEvents, OrdersStates> {
  List<OrderModel>? orders;
  List<OrderProduct>? orderProducts;
  int? orderId;
int? userId;
OrdersBloc() : super(InitialState()) {
    on<GetOrdersEvents>(_getOrders);
    on<GetProductsByOrderEvent>(_getProductsByOrder);
  }

  Future<FutureOr<void>> _getOrders(
      GetOrdersEvents event, Emitter<OrdersStates> emit) async {
    try {
      emit(LoadingState());
      orders = await OrderController().getAll(event.userId);
      emit(SuccessState(orders: orders));
    } catch (ex) {
      print(ex);
      emit(FailureState());
    }
  }

  FutureOr<void> _getProductsByOrder(GetProductsByOrderEvent event, Emitter<OrdersStates> emit) async {
    try {
      emit(LoadingState());
      orderProducts = await OrderController().getProductsByOrder(event.orderId!);
      emit(SuccessState(orderProducts: orderProducts,orders: orders!));
    } catch (ex) {
      print(ex);
      emit(FailureState());
    }
  }
}
