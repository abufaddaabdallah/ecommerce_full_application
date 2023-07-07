import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _controllerNewPassword= TextEditingController();
  final _controllerConfirmPassword = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  bool _passwordVisible = false;

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
                      width: MediaQuery.of(context).size.width*0.2,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                    ),
                    const Text("Reset",
                        style:
                            TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.04,
                    ),
                    const Text(
                      "Reset your password",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.3,
                    ),
                    const Text(
                      "Enter Your New Password",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !_passwordVisible,
                        controller: _controllerNewPassword,
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
                            hintText: "New Password",
                            label: const Text('New password')),
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
                        obscureText: !_passwordVisible,
                        controller: _controllerConfirmPassword,
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
                            hintText: "Confirm Password",
                            label: const Text('Confirm password')),
                        validator: (text) {
                          if (text!.length < 8 ||
                              _controllerNewPassword.text != text) {
                            return "Please add a valid confirm password";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.08,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                           horizontal: MediaQuery.of(context).size.width/5 ,
                            vertical: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          setState(() {
                            // _handleSignInAction(context);
                          });
                        }
                      },
                      child:  Text(
                        "Continue",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).textScaleFactor*15),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
