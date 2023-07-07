import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/orders/order_bloc.dart';
import '../../bloc/orders/order_states.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: BlocBuilder<OrdersBloc, OrdersStates>(
          builder: (context, state) {
            if (state is SuccessState) {
              return buildListView(context, state.orderProducts);
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

  ListView buildListView(context, orderProducts) {
    return ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: orderProducts!.length,
        itemBuilder: (context, index) {
          return Card(
            color: FlexColor.redDarkPrimary,
            child: ListTile(
              onTap: () {},
              leading: Image(image: NetworkImage(orderProducts[index].products.image)),
              title: Text(
                orderProducts[index].products.name.toString(),
              ),
              subtitle:
                  Text("Price: ${orderProducts[index].products.price.toStringAsFixed(2)}"),
              trailing: Text(
                "Qty: ${orderProducts[index].qty.toString()}",
              ),
            ),
          );
        });
  }
}
