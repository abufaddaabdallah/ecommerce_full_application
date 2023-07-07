import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/products/products_bloc.dart';
import '../../widgets/summery_widget.dart';

class SummeryStep extends StatelessWidget {
  const SummeryStep({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductsBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Summery",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        _addressWidget(bloc),
        const SizedBox(height: 20),
        const SummeryWidget(),
      ],
    );
  }
}

Widget _addressWidget(bloc ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Delivery Address",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 3),
      const Divider(),
      const SizedBox(height: 3),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Country",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(
            bloc!.address!.country??" ",
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          )
        ],
      ),
      const SizedBox(height: 3),
      const Divider(),
      const SizedBox(height: 3),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "City",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(
            bloc.address!.city!,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          )
        ],
      ),
      const SizedBox(height: 3),
      const Divider(),
      const SizedBox(height: 3),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Area",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(
            bloc.address!.area!,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          )
        ],
      ),
      const SizedBox(height: 3),
      const Divider(),
      const SizedBox(height: 3),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Street",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(
           bloc!.address!.street!,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          )
        ],
      ),
      const SizedBox(height: 3),
      const Divider(),
      const SizedBox(height: 3),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     const Text(
      //       "Building No.",
      //       style: TextStyle(fontSize: 14, color: Colors.grey),
      //     ),
      //     Text(
      //      bloc.address!.buildingNo!,
      //       style: const TextStyle(fontSize: 14, color: Colors.grey),
      //     )
      //   ],
      // )
    ],
  );
}
