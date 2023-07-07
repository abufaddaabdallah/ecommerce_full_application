import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_application/bloc/users/users_bloc.dart';
import 'package:store_application/bloc/orders/order_bloc.dart';
import 'package:store_application/bloc/products/products_bloc.dart';
import 'package:store_application/bloc/signUp/sign_up_bloc.dart';
import 'package:store_application/exit_page.dart';
import 'package:store_application/main.dart';
import 'package:store_application/views/categories/categories_view.dart';
import 'package:store_application/views/orders/my_orders.dart';
import 'package:store_application/views/profile/profile_page.dart';
import 'package:store_application/views/products/products_page.dart';
import 'package:store_application/views/signUp/sign_up_page.dart';

import '../views/home_page.dart';
import 'constant.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObserver();
  static List history = [];

  static List<PageEntity> Routes() {
    return [
      PageEntity(
          path: AppRoutes.homePage,
          page: const HomePage(),
          bloc: BlocProvider(create: (_) => ProductsBloc())),
      PageEntity(
        path: AppRoutes.signUpPage,
        page: const SignUpPage(),
        bloc: BlocProvider(create: (_) => SignUpBloc()),
      ),
      PageEntity(
          path: AppRoutes.productsPage,
          page: const ProductsPage(),
          bloc: BlocProvider(create: (_) => ProductsBloc())),
      PageEntity(
        path: AppRoutes.ordersPage,
        page: MyOrders(),
        bloc: BlocProvider(
          create: (_) => OrdersBloc(),
        ),
      ),
      PageEntity(
        path: AppRoutes.categoriesPage,
        page: CategoryView(),
        bloc: BlocProvider(
          create: (_) => ProductsBloc(),
        ),
      ),
      PageEntity(
        path: AppRoutes.profilePage,
        page: ProfilePage(),
        bloc: BlocProvider(
          create: (_) => UserBloc(),
        ),
      ),
    ];
  }

  static List<dynamic> Blocer(BuildContext context) {
    List blocerList = [];
    for (var blocer in Routes()) {
      blocerList.add(blocer.bloc);
    }
    return blocerList;
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initialPage:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case AppRoutes.loginPage:
        return MaterialPageRoute(
          builder: ((context) => const ProductsPage()),
        );
      case AppRoutes.signUpPage:
        return MaterialPageRoute(
          builder: ((context) => const SignUpPage()),
        );
      case AppRoutes.profilePage:
        return MaterialPageRoute(
          builder: ((context) => ProfilePage()),
        );
      case AppRoutes.homePage:
        return MaterialPageRoute(
          builder: ((context) => const HomePage()),
        );
      case AppRoutes.productsPage:
        return MaterialPageRoute(
          builder: ((context) => const ProductsPage()),
        );
      case AppRoutes.ordersPage:
        return MaterialPageRoute(
          builder: ((context) => MyOrders()),
        );
      case AppRoutes.categoriesPage:
        return MaterialPageRoute(
            builder: ((context) => CategoryView()), settings: settings);
    }
    return null;
  }
}

class PageEntity {
  String path;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.path,
    required this.page,
    required this.bloc,
  });
}

// static MaterialPageRoute GenerateRouteSettings (RouteSettings settings){

//   if(settings.name!=null){
//     var result = Routes().where((element)=> element.path == settings.name);
//     if(result.isNotEmpty){
//       bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();

//     }
//   }
// }
