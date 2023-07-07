import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:store_application/bloc/orders/order_bloc.dart';
import 'package:store_application/bloc/orders/order_events.dart';
import 'package:store_application/bloc/orders/order_states.dart';
import 'package:store_application/views/orders/order_details.dart';

class MyOrders extends StatefulWidget {
  MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  // int? userId;
  final storage = const FlutterSecureStorage();
  final bloc = OrdersBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<OrdersBloc, OrdersStates>(
          builder: (context, state) {
            if (state is SuccessState) {
              return buildListView(context, state.orders);
            }
            if (state is FailureState) {
              return const Center(child: Text("There are some errors"));
            }
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(
              child: Text('Please try again later'),
            );
          },
        ),
      ),
    );
  }

  ListView buildListView(context, orders) {
    final formattedDate = DateFormat('E,d MMM yyyy HH:mm:ss');
    return ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: orders!.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.red,
            child: ListTile(
              onTap: () {
                setState(() {
                  bloc.orderId = orders[index].id;
                });
                context
                    .read<OrdersBloc>()
                    .add(GetProductsByOrderEvent(bloc.orderId));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {

                      return const OrderDetailsPage();
                    },
                  ),
                );

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       context
                //           .read<OrdersBloc>()
                //           .add(GetProductsByOrderEvent(orders[index].id));
                //       return OrderDetailsPage();
                //     },
                //   ),
              },
              title: Text(
                "Order no: ${index + 1}",
              ),
              subtitle:
                  Text("Total: ${orders[index].total.toStringAsFixed(2)}\$"),
              trailing: Text(
                formattedDate
                    .format(DateTime.parse(orders[index].createdAt))
                    .toString(),
              ),
            ),
          );
        });
  }

  Future<void> UserId() async {
    final bloc = context.read<OrdersBloc>();

    String? id = await storage.read(key: 'userId');
    int userId = int.parse(id!);
    context.read<OrdersBloc>().add(GetOrdersEvents(userId));
    bloc.userId = userId;
  }
}
