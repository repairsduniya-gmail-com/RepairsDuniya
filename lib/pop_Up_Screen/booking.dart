import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import '../Model_Screens/Home_boarding_Screen/user.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Booking {
  String? service;
  String serviceName;
  DateTime? date;
  String time;
  String bookingId;
  String description;
  String? houseNumber;
  String? Address;
  String? houseName;
  String? username;
  String? phoneNumber;
  DateTime? CreatedDate;

  Booking(
      {required this.service,
      required this.serviceName,
      required this.date,
      required this.time,
      required this.bookingId,
      required this.houseNumber,
      required this.Address,
      required this.houseName,
      required this.phoneNumber,
      required this.username,
      required this.description,
      required this.CreatedDate});
  Map<String, dynamic> toJson() {
    return {
      'service': service,
      'serviceName': serviceName,
      'date': date,
      'time': time,
      'bookingId': bookingId,
      'description': description,
      'houseNumber': houseNumber,
      'address': Address,
      'appartmentName': houseName,
      'username': username,
      'phoneNumber': phoneNumber,
      'CreatedDate': CreatedDate
    };
  }
}

class BookingsProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Store the booking under the user collection

  CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('user');
  List<Booking> _bookings = [];

  List<Booking> get bookings => _bookings;

  void addBooking(Booking booking, String userName) async {
    final user = FirebaseAuth.instance.currentUser;
    _bookings.add(booking);
    notifyListeners();

    try {
      // Save the booking to the 'bookings' collection
      await _firestore
          .collection('bookings')
          .doc(booking.bookingId)
          .set(booking.toJson());

      // Get a reference to the user document
      final userDocRef = _usersCollection.doc(user!.phoneNumber);

      // Update the 'bookings' subcollection under the user's document
      // Store the booking under the user collection
      final userRef =
          FirebaseFirestore.instance.collection('user').doc(user.uid);
      await userRef
          .collection('bookings')
          .doc(user.phoneNumber)
          .set(booking.toJson());
      await userDocRef
          .collection('bookings')
          .doc(booking.bookingId)
          .set(booking.toJson());
    } catch (error) {
      // Handle the error appropriately
    }
  }
}

// e = TimeOfDay.now();
// class booking {
// //   final String bookingId;
//   final String service;
//   final String serviceName;
//   final DateTime date;
//   TimeOfDay time;
//   // UserDataProvider userProvider;

//   booking({
//     required this.bookingId,
//     required this.service,
//     required this.serviceName,
//     required this.date,
//     required this.time,
//     // required this.userProvider,
//   });
//   Map<String, dynamic> toJson() {
//     return {
//       'service': service,
//       'serviceName': serviceName,
//       'date': date.toIso8601String(),
//       'time': '${time.hour}:${time.minute}',
//       'bookingId': bookingId,
//     };
//   }
// }

// class bookingData with ChangeNotifier {
//   booking? _bookingData;
//   booking? get bookingData => _bookingData;
//   final _database = FirebaseDatabase.instance.reference();

//   Future<String> createBooking(
//     String service,
//     String serviceName,
//     DateTime date,
//     TimeOfDay time,
//     UserDataProvider userProvider,
//   ) async {
//     final bookingId = _database.child('bookings').push().key;
//     if (bookingId != null) {
//       final bookingData = booking(
//         service: service,
//         serviceName: serviceName,
//         date: date,
//         time: time,
//         bookingId: bookingId,
//       );

//       await _database.child('bookings/$bookingId').set(bookingData.toJson());

//       // Store the booking ID under the user's details in the "users" collection
//       await _database
//           .child('user')
//           .child(userProvider.userData!.username)
//           .child('bookings')
//           .child(bookingId)
//           .set(true);

//       return bookingId;
//     } else {
//       throw Exception('Failed to generate booking ID');
//     }

//   }
// }

// final firebaseService = FirebaseService();

// void createBooking(BuildContext context) async {
//   final service = 'serviceId';
//   final serviceName = 'Service Name';
//   final date = DateTime.now();
//   final tim
//   final userProvider = Provider.of<UserDataProvider>(context, listen: false);

//   try {
//     final bookingId = await firebaseService.createBooking(
//       service,
//       serviceName,
//       date,
//       time,
//       userProvider,
//     );
//     print('Booking created with ID: $bookingId');
//   } catch (error) {
//     print('Failed to create booking: $error');
//   }
// }
