import 'dart:async';
// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:repair_duniya/Model_Screens/Map_Screen/location_service.dart';
import 'package:repair_duniya/components.dart/location_list_tile.dart';
import 'package:repair_duniya/components.dart/network_utility.dart';
import 'package:repair_duniya/models/autocomplate_prediction.dart';
import 'package:repair_duniya/models/constant.dart';
// import 'package:repair_duniya/components.dart/location_list_tile.dart';
// import 'package:repair_duniya/models/constant.dart';
// import 'package:repair_duniya/models/place_auto_complate_response.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:repair_duniya/pop_Up_Screen/address.dart';

class SearchlocationScreen extends StatefulWidget {
  // final DeliveryStatusScreen widgetA;
  // const SearchlocationScreen(this.widgetA);

  @override
  State<SearchlocationScreen> createState() => _SearchlocationScreenState();
}

class _SearchlocationScreenState extends State<SearchlocationScreen> {
  Position? _currentPosition;
  String? _currentAddress;
  bool isLoading1 = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _storeAddressToFirebase(String address) async {
    try {
      setState(() {
        final docRecord = FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid);
        docRecord.set({
          'address': _currentAddress,
        });
      });
    } catch (e) {
      print('Error storing address in Firestore: $e');
    }
  }

  Future<Position> _getPosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location not available');
      }
    } else {
      print('Location not available');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> _getAddress(double latitude, double longitude) async {
    try {
      final List<Placemark> placemarks = await GeocodingPlatform.instance
          .placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks[0];
        setState(() {
          _currentAddress =
              '${place.subLocality},${place.locality}, ${place.postalCode},${place.administrativeArea}';
        });
        _storeAddressToFirebase(_currentAddress!);
      } else {
        setState(() {
          _currentAddress = 'Address not found';
        });
      }
    } catch (e) {
      print(e);
    }
  }

  List<AutocompletePrediction> placePredictions = [];

  void PlaceAutocomplate(String query) async {
    Uri uri =
        Uri.https("maps.googleapis.com", 'maps/api/place/autocomplete/json', {
      "input": query, //query parameter
      "key": google_api_key,
    });
    //Now Get request
    String? response = await NetworkUtility.fetchUrl(uri);

    if (response != null) {
      // PlaceAutocompleteResponse result =
      //     PlaceAutocompleteResponse.parseAutocompleteResult(response);
      // if (result.predictions != null) {
      //   setState(() {
      //     placePredictions = result.predictions!;
      //   });
      // }
      print(response);
    }
  }

  // bool isDeliveryPossible = false;
  // bool get _isDeliveryPossible => isDeliveryPossible;
  @override
  Widget build(BuildContext context) {
    // DeliveryStatusScreen widgetB =
    //     DeliveryStatusScreen(_isDeliveryPossible: isDeliveryPossible);
    // bool isDeliveyPossible = widget.widgetA.isDeliveryPossible;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: defaultPadding),
      //     child: CircleAvatar(
      //       backgroundColor: secondaryColor10LightTheme,
      //       child: SvgPicture.asset(
      //         "assets/location.svg",
      //         height: 20.h,
      //         width: 5.w,
      //         color: secondaryColor40LightTheme,
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //   ),
      //   title: const Text(
      //     "Set Delivery Location",
      //     style: TextStyle(color: textColorLightTheme),
      //   ),
      //   actions: [
      //     CircleAvatar(
      //       backgroundColor: secondaryColor10LightTheme,
      //       child: IconButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         icon: const Icon(Icons.close, color: Colors.black),
      //       ),
      //     ),
      //     const SizedBox(width: defaultPadding)
      //   ],
      // ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: SizedBox(
              height: 40.h,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  // PlaceAutocomplate('Dubai');
                  setState(() {
                    isLoading1 = true;
                  });
                  _currentPosition = await _getPosition();
                  _getAddress(
                      _currentPosition!.latitude, _currentPosition!.longitude);
                  setState(() {
                    isLoading1 = false;
                  });
                },
                icon: SvgPicture.asset(
                  "assets/location.svg",
                  height: 16.h,
                ),
                label: const Text("Use my Current Location"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor10LightTheme,
                  foregroundColor: textColorLightTheme,
                  elevation: 0,
                  fixedSize: const Size(double.infinity, double.infinity),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
          ),
          isLoading1
              ? const CircularProgressIndicator()
              : _currentAddress != null
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        Text(
                          _currentAddress!,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        DeliveryStatusScreen()
                      ]))
                  : const Divider(
                      height: 4,
                      thickness: 3,
                      // color: Colors.grey.shade300,
                    ),
          Expanded(
            child: ListView.builder(
              itemCount: placePredictions.length,
              itemBuilder: (context, index) => LocationListTile(
                press: () {},
                location: placePredictions[index].description!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
