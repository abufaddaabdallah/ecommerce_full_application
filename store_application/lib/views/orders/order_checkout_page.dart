import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:im_stepper/stepper.dart';

import '../../bloc/products/products_bloc.dart';
import '../../controllers/order_controller.dart';
import '../../main.dart';
import '../../model/order.dart';
import '../../shared/constant.dart';
import '../widgets/no_internet_page.dart';
import 'components/address_form_step.dart';
import 'components/google_maps_widget.dart';
import 'components/summery_step.dart';

class OrderCheckoutPage extends StatefulWidget {
  Position location;

  OrderCheckoutPage(this.location, {super.key});

  @override
  State<OrderCheckoutPage> createState() => _OrderCheckoutPageState();
}

class _OrderCheckoutPageState extends State<OrderCheckoutPage> {
  int activeStep = 0;
  int upperBound = 3;

  int? userId;
  final storage = const FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    UserId();
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
    final bloc= context.read<ProductsBloc>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Order Summery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconStepper(
              activeStepBorderColor: DefaultSelectionStyle.of(context).cursorColor,
              activeStepColor:DefaultSelectionStyle.of(context).cursorColor ,
              icons: const [
                Icon(Icons.location_on_rounded),
                Icon(Icons.home),
                // Icon(Icons.payment_rounded),
                Icon(Icons.summarize),
              ],
              enableNextPreviousButtons: false,
              lineLength: 35,
              activeStep: activeStep,
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
            ),
            Expanded(
                child: IndexedStack(
              index: activeStep,
              children: [
                GoogleMapStep(widget.location),
                AddressFormStep(),
                // const PaymentMethodStep(),
                  SummeryStep(),
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                previousButton(),
                nextButton(bloc),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget nextButton( bloc) {
    return ElevatedButton(
      onPressed: () {
        switch (activeStep) {
          case 0:
            setState(() {
              activeStep++;
            });
            break;
          case 1:
            if (bloc.keyForm.currentState.validate()) {
              setState(() {
                activeStep++;
              });
            }
            break;
          case 2:
            {
              checkInternetAndNavigate();
              OrderController()
                  .create(Order(
                userId: userId!,
                products: bloc.selectedProducts,
                address: bloc.address,
                paymentMethodId: bloc.paymentMethod,
                total: bloc.total,
                taxAmount: bloc.taxAmount,
                subTotal: bloc.subTotal,
                createdAt: bloc.createdAt,
              ))
                  .then((value) {
                EasyLoading.dismiss();
                EasyLoading.showSuccess("Order Sent");
              }).catchError((ex) {
                EasyLoading.dismiss();
                EasyLoading.showError(ex.toString());
              });
              print(
                  "from order page orderController: ${bloc.selectedProducts.asMap()}");
              Navigator.pushReplacementNamed(context, AppRoutes.homePage);
              bloc.selectedProducts.clear();
            }
            break;
        }
      },
      child: const Text('Next'),
    );
  }

  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: const Text('Prev'),
    );
  }

  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Preface';

      case 2:
        return 'Table of Contents';

      case 3:
        return 'About the Author';

      default:
        return 'Introduction';
    }
  }

  Future<void> UserId() async {
    String? id = await storage.read(key: 'userId');
    userId = int.parse(id!);
  }
}
