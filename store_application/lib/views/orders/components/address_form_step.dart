import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/products/products_bloc.dart';

class AddressFormStep extends StatelessWidget {
  AddressFormStep({super.key});

  // String? country;
  // String? city;
  // String? street;
  // String? area;

  final _controllerCountry = TextEditingController();

  final _controllerCity = TextEditingController();

  final _controllerArea = TextEditingController();

  final _controllerStreet = TextEditingController();

  // final _controllerBuilding = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as
    final bloc= context.read<ProductsBloc>();
    return formWidget(bloc);
  }

  Widget formWidget(ProductsBloc bloc) {
    _controllerCountry.text = bloc.address.country;
    _controllerCity.text = bloc.address.city;
    _controllerArea.text = bloc.address.area;
    _controllerStreet.text = bloc.address.street;
// _controllerBuilding.text = bloc.address!.buildi  ngNo!;

    return Form(
        key: bloc.keyForm,
        child: Column(
      children: [
        // Text( bloc.address!.country!),
        TextFormField(
          controller: _controllerCountry,
          onChanged: (value){
            bloc.address.country=value;
          },
          decoration: const InputDecoration(hintText: "Country "),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return "This field is required";
            }
            return null;
          },
        ),
        TextFormField(
          onChanged: (value){
            bloc.address.city=value;
          },
            controller: _controllerCity,
          decoration: const InputDecoration(hintText: "City "),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return "This field is required";
            }
            return null;
          },
        ),
        TextFormField(
          controller: _controllerArea,
          onChanged: (value){
            bloc.address.area=value;
          },
          decoration: const InputDecoration(hintText: "Area "),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return "This field is required";
            }
            return null;
          },
        ),
        TextFormField(
          controller: _controllerStreet,
          onChanged: (value){
            bloc.address.street=value;
          },
          decoration: const InputDecoration(hintText: "Street "),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return "This field is required";
            }
            return null;
          },
        ),
        // TextFormField(
        //   controller: _controllerBuilding,
          // onChanged: (value) {
          //   print(bloc.address!.buildingNo!);
          //   bloc.address!.buildingNo = value;
          // // },
          // decoration: const InputDecoration(hintText: "Building No. "),
          // validator: (text) {
          //   if (text == null || text.isEmpty) {
          //     return "This field is required";
          //   }
        //     return null;
        //   },
        // ),
      ],
    ));
  }
}
