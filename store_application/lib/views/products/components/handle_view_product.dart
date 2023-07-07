import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_application/bloc/products/products_bloc.dart';
import 'package:store_application/bloc/products/products_events.dart';

Future<void> handleViewProduct(BuildContext context, product) {
  final bloc = context.read<ProductsBloc>();
  print("from handleView : $product");
  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: 230,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      product!.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product!.category!.name.toString(),
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                product!.selectedQty++;
                              });
                            },
                            icon: const Icon(Icons.add)),
                        const SizedBox(width: 30),
                        Text(
                          "${product.selectedQty}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 18),
                        ),
                        const SizedBox(width: 30),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                product.selectedQty--;
                              });
                            },
                            icon: const Icon(Icons.remove)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      child:  Text('Add to cart',style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor*15),),
                      onPressed: () {
                        setState(() {
                          bloc.add(GetCartItemCount(++bloc.cartItemCount));
                          print(bloc.cartItemCount);
                          bloc.add(AddToCartEvent(product));
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      });
}
