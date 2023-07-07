import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../bloc/products/products_bloc.dart';
import '../../../model/address.dart';

class GoogleMapStep extends StatefulWidget {
  Position location;

  GoogleMapStep(this.location, {super.key});

  @override
  State<GoogleMapStep> createState() => _GoogleMapStepState();
}

class _GoogleMapStepState extends State<GoogleMapStep> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late CameraPosition _initalPostion;
  late LatLng _requiredLocation;

  @override
  void initState() {
    super.initState();
    _initalPostion = CameraPosition(
      target: LatLng(widget.location.latitude, widget.location.longitude),
      zoom: 16,
    );
    _requiredLocation =
        LatLng(widget.location.latitude, widget.location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductsBloc>();
    return mapWidget( bloc);
  }

  Widget mapWidget(bloc) {
    double mapWidth = MediaQuery.of(context).size.width;
    double mapHeight = MediaQuery.of(context).size.height - 215;
    return Stack(alignment: const Alignment(0.0, 0.0), children: <Widget>[
      SizedBox(
          width: mapWidth,
          height: mapHeight,
          child: GoogleMap(
            mapType: MapType.hybrid,
            myLocationEnabled: true,
            initialCameraPosition: _initalPostion,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onCameraMove: (CameraPosition position) {
              _requiredLocation = position.target;
            },
            onCameraIdle: () {
              _getAddressFromLatLng(bloc);
            },
          )),
      Positioned(
        top: (mapHeight - 50) / 2,
        right: (mapWidth - 50) / 2,
        child: const Icon(
          Icons.location_on,
          size: 50,
          color: Colors.red,
        ),
      ),
    ]);
  }

  Future<void> _getAddressFromLatLng(bloc) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        _requiredLocation.latitude, _requiredLocation.longitude);

    Placemark first = placemarks.first;

    Address address = Address();
    address.latitude = _requiredLocation.latitude;
    address.longitude = _requiredLocation.longitude;
    address.country = first.country!;
    address.city = first.locality!;
    address.area = first.subLocality!;
    address.street = first.street!;
    // address.buildingNo = "";
    bloc.updateAddress(address);
    // context.read<ProductsBloc>().updateAddress(address);
    // print(address.country);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => AddressFormStep(),
    //     settings: RouteSettings(
    //       arguments: {
    //         "country": address.country!,
    //         "city": address.city,
    //         "area": address.area,
    //         "street": address.street
    //       },
    //     ),
    //   ),
    // );
  }

  // updateAddress(address) {
  //   context.read<ProductsBloc>().add(UpdateAddressEvent(address));
  // }
}
