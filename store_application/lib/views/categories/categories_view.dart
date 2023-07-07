import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_application/model/product.dart';
import 'package:store_application/views/home_page.dart';
import 'package:store_application/views/products/components/grid_view_products.dart';

import '../../bloc/products/products_bloc.dart';
import '../../bloc/products/products_events.dart';
import '../../bloc/products/products_states.dart';
import '../../main.dart';
import '../widgets/no_internet_page.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});
  Future<void> checkInternetAndNavigate() async {
    bool isConnected = await checkInternetConnection();
    if (!isConnected) {
      navigateToNoInternetPage();
    }
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  void navigateToNoInternetPage() {
    navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => NoInternetPage(),
    ));
  }
  @override
  Widget build(BuildContext context) {
    checkInternetAndNavigate();
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    context
        .read<ProductsBloc>()
        .add(GetProductsByCategoryEvent(arguments['id'].id));
    return BlocBuilder<ProductsBloc, ProductsStates>(
      builder: (context, state) {
        if (state is SuccessState) {
          return buildListView(context, state.products, arguments);
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
    );
  }

  Widget buildListView(BuildContext context, List<Product>? products,
      Map<dynamic, dynamic> arguments) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['id'].name.toString()),
        leading: IconButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                ),
            icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: gridViewProducts(products, context),
        ),
      ),
    );
  }
}
