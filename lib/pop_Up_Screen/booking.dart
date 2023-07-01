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
  String? description;
  String? houseNumber;
  String? address;
  String? houseName;
  String? username;
  String? phoneNumber;
  DateTime? createdDate;

  Booking({
    this.service,
    required this.serviceName,
    this.date,
    required this.time,
    required this.bookingId,
    this.description,
    this.houseNumber,
    this.address,
    this.houseName,
    this.username,
    this.phoneNumber,
    this.createdDate,
  });

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      service: map['service'],
      serviceName: map['serviceName'],
      date: (map['date'] as Timestamp?)?.toDate(),
      time: map['time'],
      bookingId: map['bookingId'],
      description: map['description'],
      houseNumber: map['houseNumber'],
      address: map['address'],
      houseName: map['appartmentName'],
      username: map['username'],
      phoneNumber: map['phoneNumber'],
      createdDate: (map['CreatedDate'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service': service,
      'serviceName': serviceName,
      'date': date,
      'time': time,
      'bookingId': bookingId,
      'description': description,
      'houseNumber': houseNumber,
      'address': address,
      'appartmentName': houseName,
      'username': username,
      'phoneNumber': phoneNumber,
      'CreatedDate': createdDate,
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

  void addBooking(Booking booking, String phoneNumber) async {
    final user = FirebaseAuth.instance.currentUser;
    _bookings.add(booking);
    notifyListeners();

    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('user')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();
      // Save order document to Firestore
      await _firestore
          .collection('user')
          .doc(phoneNumber)
          .collection('bookings')
          .doc(booking.bookingId)
          .set(booking.toJson());
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
