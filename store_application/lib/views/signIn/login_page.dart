import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:store_application/shared/constant.dart';
import 'package:store_application/views/signIn/components/forget_password_page.dart';

import '../../bloc/products/products_bloc.dart';
import '../../bloc/products/products_events.dart';
import '../../bloc/users/users_bloc.dart';
import '../../bloc/users/users_events.dart';
import '../../controllers/user_controller.dart';
import '../../main.dart';
import '../home_page.dart';
import '../widgets/no_internet_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetAndNavigate();
    context.read<UserBloc>().add(GetUserEvent());
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
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 80),
        child: SingleChildScrollView(
          child: Form(
              key: _keyForm,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: const AssetImage("assets/images/img.png"),
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                    ),
                    const Text("Welcome Back",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.04,
                    ),
                    const Text(
                      "Login to your account",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _controllerEmail,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Email address'),
                          hintText: "example@.com"),
                      validator: (text) {
                        if (!EmailValidator.validate(text!)) {
                          return "Please add correct email address";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.08,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !_passwordVisible,
                        controller: _controllerPassword,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                }),
                            border: const OutlineInputBorder(),
                            hintText: "**********",
                            label: const Text('password')),
                        validator: (text) {
                          if (text!.length < 8) {
                            return "Please add a valid password";
                          }
                          return null;
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPasswordPage()));
                          },
                          child: Text(
                            'Forget Password ?',
                            style: TextStyle(
                              color:
                                  DefaultSelectionStyle.of(context).cursorColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 5,
                            vertical: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                      ),
                      onPressed: () {
                        checkInternetAndNavigate();
                        if (_keyForm.currentState!.validate()) {
                          _handleSignInAction();
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 15),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don’t have an account?'),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.signUpPage);
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 15,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  _handleSignInAction() {
    EasyLoading.show(status: "Loading");
    UserController()
        .login(_controllerEmail.text, _controllerPassword.text)
        .then((value) {
      EasyLoading.dismiss();
      const FlutterSecureStorage().write(
        key: "token",
        value: "${value.type} ${value.token} ",
      );
      UserController().getUser().then((value) {
        const FlutterSecureStorage().write(
          key: "userId",
          value: "${value.id}",
        );
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }).catchError((ex) {
      EasyLoading.dismiss();
      EasyLoading.showError(ex);
    });
  }
}
