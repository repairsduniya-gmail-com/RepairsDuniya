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
import 'package:provider/provider.dart';
import 'package:repair_duniya/Model_Screens/Home_Screen/serviceName.dart';
import 'package:repair_duniya/Model_Screens/Home_boarding_Screen/user.dart';
import 'package:repair_duniya/Model_Screens/Map_Screen/get_location.dart';
import 'package:repair_duniya/pop_Up_Screen/Date_Screen.dart';
import 'package:repair_duniya/pop_Up_Screen/Describe_Screen.dart';
import 'package:repair_duniya/pop_Up_Screen/bookingConfirmation.dart';
import 'package:uuid/uuid.dart';

import '../../pop_Up_Screen/Install_Screen.dart';
import '../../pop_Up_Screen/booking.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bookingsProvider =
        Provider.of<BookingsProvider>(context, listen: false);
    void createBooking() {
      final selectedserviceNameProvider =
          Provider.of<serviceIdprovider>(context, listen: false);
      final service = selectedserviceNameProvider.UserselectedService;

      final selectedServiceProvider =
          Provider.of<SelectedServiceProvider>(context, listen: false);
      final selectedService = selectedServiceProvider.selectedService;

      final descriptionProvider =
          Provider.of<DescriptionProvider>(context, listen: false);
      final Description = descriptionProvider.description;

      final selectedTimeProvider =
          Provider.of<SelectedTime>(context, listen: false);
      final selectedtime = selectedTimeProvider.selectedValue;

      final dateProvider = Provider.of<dateTime>(context, listen: false);
      final selectedDate = dateProvider.userSelectedDate;

      final userDataprovider =
          Provider.of<UserDataProvider>(context, listen: false);

      final housenumberProvider = Provider.of<Address>(context, listen: false);
      final HouseNumber = housenumberProvider.houseNumber;
      final address = housenumberProvider.address;
      final housename = housenumberProvider.houseName;
      if (selectedService == null) {
        // No service selected, handle the error
        return;
      }

      // Retrieve the corresponding serviceName based on the selected service
      String serviceName;
      String description;
      if (selectedService == 'installation') {
        serviceName = 'Installation';
        description = 'null';
      } else if (selectedService == 'repair') {
        serviceName = 'Repair';
        description = Description;
      } else {
        // Handle other cases if needed
        return;
      }
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      Future<int> getRowCount() async {
        QuerySnapshot snapshot = await firestore.collection('bookings').get();
        int rowCount = snapshot.size;
        return rowCount;
      }

      // Future<String> generateBookingId() async {
      //   final date = selectedDate!.day;
      //   final year = selectedDate.year;
      //   final uuid = Uuid();
      //   // final rowCount = getRowCount().then((rowCount) {}).toString();
      //   String bookinId;
      //   bookinId = '${date}RD${year}${uuid}';
      //   return bookinId;
      // }
      String generateBookingId() {
        final uuid = Uuid();
        return uuid.v4(); // Generate a version 4 (random) UUID
      }

      // Create a new Booking object with the form data
      final booking = Booking(
          description: Description,
          service: service,
          serviceName: selectedService,
          date: selectedDate,
          time: selectedtime,
          bookingId: generateBookingId().toString(),
          houseNumber: HouseNumber,
          Address: address,
          houseName: housename,
          phoneNumber: userDataprovider.userData?.phoneNumber,
          username: userDataprovider.userData?.username,
          CreatedDate: DateTime.now());

      // Add the booking to the BookingsProvider
      bookingsProvider.addBooking(booking, 'username');
    }

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
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                createBooking();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookingConfirmation(),
                                  ),
                                );
                              },
                              child: Text('Confirm Booking'),
                            ),
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
