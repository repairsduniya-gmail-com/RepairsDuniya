// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
// import 'package:repair_duniya/pop_Up_Screen/confirm_booking.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:repair_duniya/Model_Screens/Home_Screen/home.dart';

Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are disabled
    return Future.error('Location services are disabled.');
  }

  // Check location permission
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      // Location permission denied
      return Future.error('Location permission denied.');
    }
  }

  // Get current location
  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}

Future<String?> getCityNameFromCoordinates(
    double latitude, double longitude) async {
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      String cityName = placemark.postalCode ?? '';
      return cityName;
    }
  } catch (e) {
    print('Error: $e');
  }
  return null;
}

class DeliveryStatusScreen extends StatelessWidget {
  bool isDeliveryPossible = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
      future: getCurrentLocation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final userLocation = snapshot.data;
        if (userLocation != null) {
          return FutureBuilder<String?>(
              future: getCityNameFromCoordinates(
                  userLocation.latitude, userLocation.longitude),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final cityName = snapshot.data ?? '';

                return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('delivery_cities')
                        .where('name', isEqualTo: cityName)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      final deliveryCities = snapshot.data?.docs ?? [];
                      isDeliveryPossible = deliveryCities.isNotEmpty &&
                          deliveryCities.first['deliveryAvailable'];

                      if (isDeliveryPossible) {
                        // Delivery is possible, allow the user to proceed
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate to the next screen or perform desired action
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Done'),
                                    content: Text('Your booking has been done'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                      ),
                                      // TextButton(
                                      //   child: Text('No'),
                                      //   onPressed: () {
                                      //     Navigator.of(context)
                                      //         .pop(); // Close the dialog
                                      //   },
                                      // ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('Confirm Booking'),
                          ),
                        );
                      } else {
                        // Delivery is not possible, stop the user and display a message
                        return Center(
                          child: Text(
                            'Sorry! Services unavailable here. We are coming soon',
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        );
                      }
                    });
              });
        } else {
          return Center(child: Text('Unable to retrieve user location.'));
        }
      },
    );
  }
}
