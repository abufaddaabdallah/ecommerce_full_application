import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_application/shared/constant.dart';
import 'package:store_application/shared/pages.dart';
import 'package:store_application/views/home_page.dart';
import 'package:store_application/views/onBoarding/on_boarding_page.dart';
import 'package:store_application/views/signIn/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:store_application/views/widgets/no_internet_page.dart';

import 'bloc/products/products_bloc.dart';
import 'bloc/products/products_events.dart';
import 'bloc/users/users_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.Blocer(context)],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        builder: EasyLoading.init(),
        theme: FlexThemeData.light(
            appBarBackground: Colors.white,
            scheme: FlexScheme.red,
            textTheme: GoogleFonts.beVietnamProTextTheme()),
        darkTheme: FlexThemeData.dark(

            scheme: FlexScheme.red,
            textTheme: GoogleFonts.beVietnamProTextTheme()),
        themeMode: ThemeMode.system,
        onGenerateRoute: AppPages.generateRoute,
        initialRoute: AppRoutes.initialPage,
        // home: LoginPage(),
        supportedLocales: const [
          Locale("af"),
          Locale("am"),
          Locale("ar"),
          Locale("az"),
          Locale("be"),
          Locale("bg"),
          Locale("bn"),
          Locale("bs"),
          Locale("ca"),
          Locale("cs"),
          Locale("da"),
          Locale("de"),
          Locale("el"),
          Locale("en"),
          Locale("es"),
          Locale("et"),
          Locale("fa"),
          Locale("fi"),
          Locale("fr"),
          Locale("gl"),
          Locale("ha"),
          Locale("he"),
          Locale("hi"),
          Locale("hr"),
          Locale("hu"),
          Locale("hy"),
          Locale("id"),
          Locale("is"),
          Locale("it"),
          Locale("ja"),
          Locale("ka"),
          Locale("kk"),
          Locale("km"),
          Locale("ko"),
          Locale("ku"),
          Locale("ky"),
          Locale("lt"),
          Locale("lv"),
          Locale("mk"),
          Locale("ml"),
          Locale("mn"),
          Locale("ms"),
          Locale("nb"),
          Locale("nl"),
          Locale("nn"),
          Locale("no"),
          Locale("pl"),
          Locale("ps"),
          Locale("pt"),
          Locale("ro"),
          Locale("ru"),
          Locale("sd"),
          Locale("sk"),
          Locale("sl"),
          Locale("so"),
          Locale("sq"),
          Locale("sr"),
          Locale("sv"),
          Locale("ta"),
          Locale("tg"),
          Locale("th"),
          Locale("tk"),
          Locale("tr"),
          Locale("tt"),
          Locale("uk"),
          Locale("ug"),
          Locale("ur"),
          Locale("uz"),
          Locale("vi"),
          Locale("zh")
        ],
        localizationsDelegates: [
          CountryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? userId;
  final storage = const FlutterSecureStorage();
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _checkIfFirstTimeUser();
    UserId();
    context.read<ProductsBloc>().add(GetProductsEvent());
    context.read<ProductsBloc>().add(GetCategoriesEvent());
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();
      setState(() {
        connectionStatus = result;
      });
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      connectionStatus = result;
    });
  }

  _checkIfFirstTimeUser() {
    if (mounted) {
      Future.delayed(const Duration(milliseconds: 2000), () async {
        bool exists = await const FlutterSecureStorage()
            .containsKey(key: "firstTimeHere");
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            context.read<ProductsBloc>().add(GetProductsEvent());
            if (exists) {
              Future.delayed(const Duration(milliseconds: 2000), () async {
                bool exists2 = await const FlutterSecureStorage()
                    .containsKey(key: "token");
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return connectionStatus == ConnectivityResult.none
                        ? NoInternetPage()
                        : exists2
                            ? const HomePage()
                            : const LoginPage();
                  },
                ));
              });
            } else {
              return OnBoardingScreens();
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
      });
    }
  }

  // _checkLogin() {
  //   Future.delayed(const Duration(milliseconds: 2000), () async {
  //     bool exists =
  //         await const FlutterSecureStorage().containsKey(key: "token");
  //     Navigator.pushReplacement(context, MaterialPageRoute(
  //       builder: (context) {
  //         // context.read<ProductsBloc>().add(GetProductsEvent());
  //         return exists ? const HomePage() : const LoginPage();
  //       },
  //     ));
  //   });
  //   final bloc = context.read<ProductsBloc>();
  //   context.read<UserBloc>().add(GetUserEvent());
  //   bloc.add(GetProductsEvent());
  //   bloc.add(GetCategoriesEvent());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/logo.svg",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.1,
          ),
          Center(
            child: Text.rich(
              TextSpan(
                text: 'Swip',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: 'wide',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).scaffoldBackgroundColor ==
                              Colors.white
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> UserId() async {
    final bloc = context.read<UserBloc>();

    String? id = await storage.read(key: 'userId');
    int userId = int.parse(id!);
    print("$userId dsfffffffffff");
    bloc.userId = userId;
    print("$userId dsfffffffffff");
  }
}
