// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../bloc/products/products_bloc.dart';
// import '../../../bloc/products/products_events.dart';
//
// class PaymentMethodStep extends StatelessWidget {
//   const PaymentMethodStep({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<ProductsBloc>();
//     return Column(children: [
//       Card(
//         child: ListTile(
//             onTap: () {
//               buildAdd(bloc);
//             },
//             leading: const Icon(
//               Icons.attach_money_outlined,
//               color: Colors.green,
//             ),
//             title: const Text("Cash On Delivery"),
//             trailing: Radio<int>(
//               value: 1,
//               groupValue: bloc.paymentMethod,
//               onChanged: (value) {
//                 buildAddCash(bloc, value);
//                 print("Cash value: $value");
//               },
//             )),
//       ),
//       Card(
//         child: ListTile(
//             onTap: () {
//               buildAddEvent2(bloc);
//             },
//             leading: const Icon(
//               Icons.payment,
//               color: Colors.green,
//             ),
//             title: const Text("Debit Cart"),
//             trailing: Radio<int>(
//               value: 2,
//               groupValue: bloc.paymentMethod,
//               onChanged: (value) {
//                 buildAddCash(bloc, value);
//                 print("Dept value: $value");
//               },
//             )),
//       )
//     ]);
//   }
//
//   void buildAddEvent2(ProductsBloc bloc) => bloc.add(UpdatePaymentMethodEvent(2));
//
//   void buildAddCash(ProductsBloc bloc, int? value) => bloc.add(UpdatePaymentMethodEvent(value!));
//
//   void buildAdd(ProductsBloc bloc) => bloc.add(UpdatePaymentMethodEvent(1));
// }
