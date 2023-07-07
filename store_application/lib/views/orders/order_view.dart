// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:store_application/bloc/orders/order_bloc.dart';
// import 'package:store_application/bloc/orders/order_events.dart';
// import 'package:store_application/bloc/orders/order_states.dart';
//
// class OrderView extends StatefulWidget {
//   OrderView({Key? key}) : super(key: key);
//
//   @override
//   State<OrderView> createState() => _OrderViewState();
// }
//
// class _OrderViewState extends State<OrderView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 30.0),
//         child: BlocBuilder<OrdersBloc, OrdersStates>(
//           builder: (context, state) {
//             if (state is SuccessState) {
//               return buildListView(context, state.orders);
//             }
//             if (state is FailureState) {
//               return const Center(child: Text("There are some errors"));
//             }
//             if (state is LoadingState) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             return const Center(
//               child: Text('Please try again later'),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   ListView buildListView(context, orders) {
//     return ListView.separated(
//         separatorBuilder: (context, index) => const SizedBox(
//               height: 25,
//             ),
//         itemCount: orders!.length,
//         itemBuilder: (context, index) {
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     color: Colors.grey.shade200,
//                     width: 175,
//                     height: 150,
//                   ),
//                   Positioned(
//                     top: 30,
//                     right: 30,
//                     bottom: 30,
//                     left: 30,
//                     child: Image(
//                       image: NetworkImage(orders![index].products!.image),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     orders![index].products!.name,
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     "Qty: ${orders![index].qty.toString()}",
//                     style: const TextStyle(fontSize: 18, color: Colors.black45),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     "\$${orders![index].products!.price.toStringAsFixed(2).toString()}",
//                     style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   ElevatedButton(
//                       onPressed: () {}, child: const Text('Track Order'))
//                 ],
//               )
//             ],
//           );
//         });
//   }
//
//   // Future<String> readData() async{
//   //   var userId = FlutterSecureStorage().read(key: "userId").toString();
//   //   setState(() async {
//   //     userId = FlutterSecureStorage().read(key: "userId").toString();
//   //   });
//   //   return userId;
//   // }
//
// }
