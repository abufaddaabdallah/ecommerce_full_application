import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:store_application/bloc/users/users_bloc.dart';
import 'package:store_application/bloc/users/users_events.dart';

import '../../bloc/users/users_states.dart';
import '../../controllers/user_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final storage = const FlutterSecureStorage();
  final _controllerEmail = TextEditingController();
  final _controllerPhoneNumber = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerConfirmPassword = TextEditingController();
  final _controllerUsername = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  String countryCode = "";
  var _isLoggedIn;
  var checkEmail;
  var oldEmail;
  var oldUsername;
  var oldPhoneNumber;
  var userId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserBloc>().add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    String getLastNineDigits(String? input) {
      RegExp pattern = RegExp(r'\d{9}$');
      Match? match = pattern.firstMatch(input!);

      if (match != null) {
        return match.group(0)!;
      } else {
        return '';
      }
    }
    return Scaffold(
      body: BlocBuilder<UserBloc, UserStates>(
        builder: (context, state) {
          if (state is SuccessState) {
            _controllerUsername.text = state.user.username;
            oldUsername = state.user.username;
            _controllerEmail.text = state.user.email;
            oldEmail = state.user.email;
            oldPhoneNumber = getLastNineDigits(state.user.phone);
            _controllerPhoneNumber.text = oldPhoneNumber;
            print(oldPhoneNumber);
                // .substring(state.user.phone!.length-1,9);
            userId = state.user.id.toString();
            print(state.user.id);
            const FlutterSecureStorage()
                .write(key: 'userId', value: state.user.id.toString());
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          const AssetImage('assets/images/profile.png'),
                      radius: MediaQuery.of(context).size.width * 0.2,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Text(
                      "Hello, ${state.user.username}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.04,
                    ),
                    SingleChildScrollView(
                      child: Form(
                        key: _keyForm,
                        onChanged: () {},
                        child: Column(
                          children: [
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                              controller: _controllerEmail,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Email address'),
                                  hintText: "example@.com"),
                              validator: (text) {
                                if (_controllerEmail.text.isEmpty ||
                                    text == null) {
                                  return "Please add your email address";
                                } else if (!EmailValidator.validate(text)) {
                                  return "Please add correct email address";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.08,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                            // TextFormField(
                            //     keyboardType: TextInputType.visiblePassword,
                            //     obscureText: !_passwordVisible,
                            //     controller: _controllerPassword,
                            //     decoration: InputDecoration(
                            //         suffixIcon: IconButton(
                            //             icon: Icon(
                            //               _passwordVisible
                            //                   ? Icons.visibility
                            //                   : Icons.visibility_off,
                            //             ),
                            //             onPressed: () {
                            //               setState(() {
                            //                 _passwordVisible = !_passwordVisible;
                            //               });
                            //             }),
                            //         border: const OutlineInputBorder(),
                            //         hintText: "Password",
                            //         label: const Text('password')),
                            //     validator: (text) {
                            //       if (text!.length < 8) {
                            //         return "Please add a valid password with minimum length 8 character";
                            //       }
                            //       return null;
                            //     }),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.width * 0.08,
                            // ),
                            // TextFormField(
                            //     keyboardType: TextInputType.visiblePassword,
                            //     obscureText: !_confirmPasswordVisible,
                            //     controller: _controllerConfirmPassword,
                            //     decoration: InputDecoration(
                            //         suffixIcon: IconButton(
                            //             icon: Icon(
                            //               _confirmPasswordVisible
                            //                   ? Icons.visibility
                            //                   : Icons.visibility_off,
                            //             ),
                            //             onPressed: () {
                            //               setState(() {
                            //                 _confirmPasswordVisible = !_confirmPasswordVisible;
                            //               });
                            //             }),
                            //         border: const OutlineInputBorder(),
                            //         hintText: "Confirm Password",
                            //         label: const Text('confirm password')),
                            //     validator: (text) {
                            //       if (_controllerPassword.text != text) {
                            //         return "Please add a valid confirm password";
                            //       }
                            //       return null;
                            //     }),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.width * 0.1,
                            // ),
                            ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 5,
                                    vertical:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                print(
                                    countryCode + _controllerPhoneNumber.text);
                                if (_keyForm.currentState!.validate()) {
                                  _handleUpdateAction();
                                }
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          15,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.05,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
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

  Future<void> UserId() async {
    final bloc = context.read<UserBloc>();

    String? id = await storage.read(key: 'userId');
    int userId = int.parse(id!);
    bloc.userId = userId;
  }

  _handleUpdateAction() {
    if (_keyForm.currentState!.validate()) {
      if (_controllerEmail.text != oldEmail) {
        EasyLoading.show(status: "Loading");
        UserController()
            .update(
          id: userId,
          email: _controllerEmail.text,
          username: _controllerUsername.text,
          phone: _controllerPhoneNumber.text,
        )
            .then((value) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess(
              "Your Information has been updated successfully1");
        }).catchError((ex) {
          EasyLoading.dismiss();
          EasyLoading.showError("Email already exits");
        });
      }
      if (_controllerUsername.text != oldUsername) {
        EasyLoading.show(status: "Loading");
        print(oldUsername);
        print(userId);
        print(_controllerUsername.text);
        UserController()
            .update(
          id: userId,
          email: _controllerEmail.text,
          username: _controllerUsername.text,
          phone: _controllerPhoneNumber.text,
        )
            .then((value) {
          print(value.username);
          EasyLoading.dismiss();
          EasyLoading.showSuccess(
              "Your Information has ${value.username} been updated successfully2");
        }).catchError((ex) {
          EasyLoading.dismiss();
          EasyLoading.showError("Username already exits");
        });
      }
      if (_controllerPhoneNumber.text != oldPhoneNumber) {
        EasyLoading.show(status: "Loading");
        UserController()
            .update(
          id: userId,
          email: _controllerEmail.text,
          username: _controllerUsername.text,
          phone: _controllerPhoneNumber.text,
        )
            .then((value) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess(
              "Your Information has been updated successfully3");
        }).catchError((ex) {
          EasyLoading.dismiss();
          EasyLoading.showError("Phone Number already exits");
        });
      }
      EasyLoading.dismiss();
      return null;
    }
    EasyLoading.dismiss();
    return null;
  }
}
