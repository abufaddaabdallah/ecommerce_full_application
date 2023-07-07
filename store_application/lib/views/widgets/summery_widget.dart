import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/products/products_bloc.dart';

class SummeryWidget extends StatelessWidget {
  const SummeryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<ProductsBloc>();
    ProductsBloc bloc = context.read<ProductsBloc>();
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Billing Summery",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),
              const Divider(),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "# of Products",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    bloc.selectedProducts!.length.toString(),
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
                    "Sub Total",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    bloc.subTotal.toStringAsFixed(2),
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
                    "Tax",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    bloc.taxAmount.toStringAsFixed(2),
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
                    "Total",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    bloc.total.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        );
  }
}
