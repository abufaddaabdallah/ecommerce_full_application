import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:store_application/views/signIn/login_page.dart';

import '../../controllers/user_controller.dart';
import '../../main.dart';
import '../widgets/no_internet_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _controllerEmail = TextEditingController();
  final _controllerPhoneNumber = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerConfirmPassword = TextEditingController();
  final _controllerUsername = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  String countryCode = "+962";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 80),
        child: SingleChildScrollView(
          child: Form(
              key: _keyForm,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image(
                          image: const AssetImage("assets/images/img.png"),
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.1,
                        ),
                        const Text("Register",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.04,
                        ),
                        const Text(
                          "Create new account",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.15,
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller: _controllerUsername,
                            maxLength: 24,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Username'),
                                hintText: "John Man"),
                            validator: (text) {
                              if (text!.isEmpty) {
                                return "Please add username";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.03,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _controllerEmail,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Email address'),
                                hintText: "example@.com"),
                            validator: (text) {
                              if (!EmailValidator.validate(text!) ||
                                  _controllerEmail.text.isEmpty) {
                                return "Please add correct email address";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.08,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _controllerPhoneNumber,
                            maxLength: 9,
                            // onChanged: (v){
                            //   print("$print$v");
                            // },
                            decoration: InputDecoration(
                              suffixIcon: CountryCodePicker(
                                padding: EdgeInsets.zero,
                                onChanged: (v) {
                                  countryCode = v.toString();
                                  print(countryCode);
                                },
                                initialSelection: 'JO',
                                favorite: ['+962', 'JO'],
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                              ),
                              border: OutlineInputBorder(),
                              label: Text('Phone number'),
                            ),
                            validator: (text) {
                              if (text!.isEmpty || text.length < 9) {
                                return "Please add correct phone number";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.03,
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
                                  hintText: "Password",
                                  label: const Text('password')),
                              validator: (text) {
                                if (text!.length < 8) {
                                  return "Please add a valid password with minimum length 8 character";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.08,
                          ),
                          TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !_confirmPasswordVisible,
                              controller: _controllerConfirmPassword,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        _confirmPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _confirmPasswordVisible =
                                              !_confirmPasswordVisible;
                                        });
                                      }),
                                  border: const OutlineInputBorder(),
                                  hintText: "Confirm Password",
                                  label: const Text('confirm password')),
                              validator: (text) {
                                if (text!.length < 8 ||
                                    _controllerPassword.text != text) {
                                  return "Please add a valid confirm password";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.1,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width / 5,
                                  vertical:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ),
                            onPressed: () {
                              print(countryCode + _controllerPhoneNumber.text);
                              checkInternetAndNavigate();

                              if (_keyForm.currentState!.validate()) {
                                _handleSubmitAction();
                              }
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          15),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account?'),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage(),
                                        ));
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  _handleSubmitAction() {
    if (_keyForm.currentState!.validate()) {
      EasyLoading.show(status: "Loading");
      UserController()
          .create(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
        username: _controllerUsername.text,
        phone: "$countryCode${_controllerPhoneNumber.text}",
      )
          .then((value) {
        EasyLoading.dismiss();
        EasyLoading().backgroundColor = Colors.green;
        EasyLoading.showSuccess("Account has been created successfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }).catchError((ex) {
        EasyLoading.dismiss();
        EasyLoading.showError("email and phone already exits");
      });
    }
  }
}
