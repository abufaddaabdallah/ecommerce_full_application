import 'package:flutter/material.dart';
import 'package:store_application/shared/constant.dart';
import '../views/home_page.dart';

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initialPage:
        return MaterialPageRoute(
          builder: (context) =>  const HomePage(),
        );
      case AppRoutes.homePage:
        return MaterialPageRoute(
          builder: ((context) =>  const HomePage(
              )),
        );
    //   case createPage:
    //     return MaterialPageRoute(
    //       builder: ((context) => CreatePage()),
    //     );
    //   case loginPage:
    //     return MaterialPageRoute(
    //       builder: ((context) => LoginPage()),
    //     );
    //   case productsPage:
    //     return MaterialPageRoute(
    //       builder:(context)=> BlocProvider(
    //         create: (context) => ProductsBloc(),
    //         child: ProductsPage(),
    //       ),
    //     );

    //   case ordersPage:
    //     return MaterialPageRoute(
    //       builder: ((context) => OrdersPage()),
    //     );
    }
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(child: Text('no route define')),
            ));
  }
}
