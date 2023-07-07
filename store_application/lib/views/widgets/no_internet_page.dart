import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:store_application/main.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({super.key});

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please check your internet",
              style: TextStyle(
                fontSize: MediaQuery
                    .of(context)
                    .textScaleFactor * 15,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _retryConnection(context);
                });
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  void _retryConnection(BuildContext context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const SplashScreen(),),);
    } else {
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("No Internet Connection"),duration: Duration(seconds: 2),));
    }
  }
}