import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:store_application/bloc/products/products_events.dart';

import '../../bloc/products/products_bloc.dart';
import '../../controllers/location_controller.dart';
import '../../model/product.dart';
import '../widgets/summery_widget.dart';
import '../signIn/login_page.dart';
import '../orders/order_checkout_page.dart';

class ViewCart extends StatelessWidget {
  const ViewCart({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductsBloc>();
    return Scaffold(

      body: BlocConsumer(
        bloc: context.read<ProductsBloc>(),
        builder: (context, child) {
          if (bloc.selectedProducts!.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: _productsListWidget(bloc),
              ),
              const SummeryWidget(),
              _buttonCheckoutWidget(context)
            ],
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }

  SizedBox _buttonCheckoutWidget(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              _handleBeginCheckoutAction(context);
            },
            child: const Text("Begin Checkout")),
      ),
    );
  }

  ListView _productsListWidget(ProductsBloc  bloc) {
    return ListView.builder(
      itemCount: bloc.selectedProducts!.length,
      itemBuilder: (context, index) {
        Product product = bloc.selectedProducts![index];
        return Dismissible(
          key: Key(index.toString()),
          background: Container(
            color: Colors.red,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ]),
          ),
          onDismissed: (direction) {
            bloc.add(RemoveProductEvent(index));
          },
          child: ListTile(
            title: Text(product.name),
            subtitle: Text("Total : ${product.total.toStringAsFixed(2)}"),
            trailing: SizedBox(
              width: 155,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        try {
                          bloc.updateQty;
                          bloc.add(GenerateTotalEvent());
                          context.read<ProductsBloc>().add(
                                UpdateQtyEvent(
                                    product, product.selectedQty + 1),
                              );
                        } catch (ex) {
                          print(ex);
                        }
                      },
                      child: const Text("+")),
                  Text("${product.selectedQty}"),
                  TextButton(
                      onPressed: () {
                        if (product.selectedQty == 1) {
                          bloc.add(RemoveProductEvent(index));
                          return;
                        }
                        bloc.updateQty;
                        bloc.add(GenerateTotalEvent());
                        bloc.add(
                            UpdateQtyEvent(product, product.selectedQty - 1));
                      },
                      child: product.selectedQty == 1
                          ? const Icon(Icons.delete)
                          : const Text("-"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _handleBeginCheckoutAction(BuildContext context) async {
    bool exists = await const FlutterSecureStorage().containsKey(key: "token");

    if (exists) {
      _handleGoToOrderCheckout(context);
    } else {
      var result = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));

      if (result != null) {
        _handleGoToOrderCheckout(context);
      }
    }
  }

  _handleGoToOrderCheckout(BuildContext context) async {
    try {
      EasyLoading.show(status: "Fetching location");
      Position location = await LocationController().determinePosition();
      EasyLoading.dismiss();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => OrderCheckoutPage(location)));
    } catch (ex) {
      EasyLoading.dismiss();
      EasyLoading.showError(ex.toString());
    }
  }
}
