import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_application/bloc/products/products_bloc.dart';
import 'package:store_application/bloc/products/products_states.dart';
import '../../bloc/products/products_events.dart';
import '../../main.dart';
import '../../model/category.dart';
import '../../shared/image_slider.dart';
import '../widgets/no_internet_page.dart';
import 'components/grid_view_products.dart';
import '../widgets/head_row.dart';
import 'components/list_view_categories.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    checkInternetAndNavigate();
    final bloc = context.read<ProductsBloc>();
      bloc.add(GetProductsEvent());
      bloc.add(GetCategoriesEvent());
  }
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
    return Scaffold(
      body: BlocBuilder<ProductsBloc, ProductsStates>(
        builder: (context, state) {
          if (state is SuccessState) {
            // print("state from bloc: ${state.products},${state.categories}}");
            return buildListView(context, state.products, state.categories);
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
    );
  }
}

Widget buildListView(context, products,List<Category>? categories) {
  List<String> images = [
    "https://crusher.fra1.cdn.digitaloceanspaces.com/photos/kiloa.jpeg",
    "https://crusher.fra1.cdn.digitaloceanspaces.com/photos/erin.jpeg",
    "https://crusher.fra1.cdn.digitaloceanspaces.com/photos/acatsuki.jpeg",
    "https://crusher.fra1.cdn.digitaloceanspaces.com/photos/bleach.jpeg",
    "https://crusher.fra1.cdn.digitaloceanspaces.com/photos/bts.jpeg",
    "https://crusher.fra1.cdn.digitaloceanspaces.com/photos/deathnote1.jpeg"
  ];
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          // const ListTile(
          //   leading: CircleAvatar(
          //     child: Icon(Icons.location_on_outlined),
          //   ),
          //   title: Text('Country'),
          //   subtitle: Text('address details'),
          //   trailing: Icon(Icons.chevron_right),
          // ),
          // TextField(
          //   decoration: InputDecoration(
          //     hintText: 'Search',
          //     prefixIcon: const Icon(Icons.search),
          //     suffixIcon: IconButton(
          //       icon: const Icon(Icons.clear),
          //       onPressed: () {},
          //     ),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(20),
          //       borderSide: BorderSide.none,
          //     ),
          //     filled: true,
          //     fillColor: Colors.grey[200],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child:ImageCarouselSlider(
              imageUrls: images,
            ),
          ),
          headRow(text: "Category"),
          const SizedBox(
            height: 20,
          ),
          listViewCategories(categories),
          const SizedBox(
            height: 15,
          ),
          headRow(text: "Popular"),
          gridViewProducts(products,context),
        ],
      ),
    ),
  );
}
