abstract class OrdersEvents{}

class GetOrdersEvents extends OrdersEvents {
  int userId;
  GetOrdersEvents(this.userId);
}

class GetProductsByOrderEvent extends OrdersEvents{
  int? orderId;
  GetProductsByOrderEvent(this.orderId);
}
