import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../bloc/products/products_bloc.dart';
import '../../bloc/products/products_events.dart';
import '../../model/product.dart';

class ProductDetails extends StatelessWidget {
  Product product;

  ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductsBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Color',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 12,
                  //     letterSpacing: 0.15,
                  //   ),
                  // ),
                  // Row(
                  //   children: [
                  //     for (final color in [
                  //       Colors.blue,
                  //       Colors.grey,
                  //       Colors.red,
                  //       Colors.lightBlue,
                  //       Colors.green,
                  //       Colors.amber,
                  //     ])
                  //       Container(
                  //         width: 40,
                  //         height: 40,
                  //         margin: EdgeInsets.only(right: 8),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20),
                  //           color: color,
                  //         ),
                  //         child: Radio(
                  //           value: color,
                  //           groupValue: null,
                  //           // TODO: Provide the actual group value
                  //           onChanged: null,
                  //           // TODO: Provide the onChanged callback
                  //           activeColor: color,
                  //           // overlayColor: Color(0xffffffff),
                  //           // overlayColor: Colors.white,
                  //           materialTapTargetSize:
                  //               MaterialTapTargetSize.shrinkWrap,
                  //         ),
                  //       ),
                  //   ],
                  // ),
                  // SizedBox(height: 16),
                  // Text(
                  //   'Size',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     // textTransform: TextTransform.uppercase,
                  //     fontSize: 12,
                  //     letterSpacing: 0.15,
                  //   ),
                  // ),
                  // Row(
                  //   children: [
                  //     for (final size in ['XS', 'S', 'M', 'L', 'XL'])
                  //       Container(
                  //         width: 40,
                  //         height: 40,
                  //         margin: EdgeInsets.only(right: 8),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20),
                  //           border: Border.all(
                  //             width: 2,
                  //             color: Colors
                  //                 .grey, // TODO: Provide the correct color
                  //           ),
                  //         ),
                  //         child: Radio(
                  //           value: size,
                  //           groupValue: null,
                  //           // TODO: Provide the actual group value
                  //           onChanged: null,
                  //           // TODO: Provide the onChanged callback
                  //           activeColor: Colors.transparent,
                  //           // overlayColor: Colors.white,
                  //           materialTapTargetSize:
                  //               MaterialTapTargetSize.shrinkWrap,
                  //         ),
                  //       ),
                  //   ],
                  // ),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Size: ${product.size}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Color: ${product.color}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // bloc.cartItemCount++;
                          bloc.add(GetCartItemCount(++bloc.cartItemCount));
                          bloc.add(AddToCartEvent(product));
                          EasyLoading.showSuccess("Product Added To Cart");

                          // bloc.add(GetCartItemCount(++bloc.cartItemCount));
                          // print(bloc.cartItemCount);
                          // handleViewProduct(context, product);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
