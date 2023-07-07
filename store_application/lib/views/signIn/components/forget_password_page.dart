import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:store_application/views/signIn/components/reset_password_page.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _controllerEmail = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

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
                    const Text("Forget",
                        style:
                            TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.04,
                    ),
                    const Text(
                      "Forget your password",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.3,
                    ),
                    const Text(
                      'Please enter your email address below you will receive a link to create a new password via email',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.2,
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
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.of(context).size.width/5 ,
                            vertical: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          setState(() {
                            // _handleSignInAction(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ResetPasswordPage()));
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
