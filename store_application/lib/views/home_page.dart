import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:store_application/views/orders/my_orders.dart';
import 'package:store_application/views/products/products_page.dart';
import 'package:store_application/views/profile/profile_page.dart';
import 'package:store_application/views/signIn/login_page.dart';

import '../bloc/products/products_bloc.dart';
import '../bloc/products/products_events.dart';
import '../main.dart';
import 'cart/cart_view.dart';
import 'widgets/no_internet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  ConnectivityResult connectionStatus = ConnectivityResult.none;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetAndNavigate();
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

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm'),
        content: const Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }
  @override
  Widget build(BuildContext context) {
    checkInternetAndNavigate();
    List<Widget> pages = [
      const ProductsPage(),
      MyOrders(),
      const ViewCart(),
      const ProfilePage(),
    ];
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title:  Text.rich(
            TextSpan(
              text: 'Swip',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 24,
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: 'wide',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Theme.of(context).scaffoldBackgroundColor==Colors.white?Colors.black:Colors.white),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                  const FlutterSecureStorage().delete(key: "token");
                },
                icon: const Icon(Icons.logout)),
            // Stack(
            //   children: [
            //     IconButton(
            //       icon: const Icon(Icons.shopping_cart),
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => const ViewCart(),
            //           ),
            //         );
            //       },
            //     ),
            //     if (bloc.cartItemCount > 0)
            //       Positioned(
            //         right: MediaQuery.of(context).size.width * .02,
            //         top: MediaQuery.of(context).size.height * .005,
            //         child: Container(
            //           padding: const EdgeInsets.all(4),
            //           decoration: const BoxDecoration(
            //             color: Colors.red,
            //             shape: BoxShape.circle,
            //           ),
            //           child: Text(
            //             bloc.cartItemCount.toString(),
            //             style: const TextStyle(
            //               color: Colors.white,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //       ),
            //   ],
            // ),
          ],
        ),
        body: pages[_index],
        bottomNavigationBar: BottomNavigationBar(
          useLegacyColorScheme: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopify,
              ),
              label: "My Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
              ),
              label: "Account",
            ),
          ],
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
        ),
      ),
    );
  }
}





