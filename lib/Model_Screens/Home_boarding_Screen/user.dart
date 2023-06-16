import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserData {
  final String email;
  final String username;
  final String phoneNumber;

  UserData({
    required this.email,
    required this.username,
    required this.phoneNumber,
  });
}

class UserDataProvider extends ChangeNotifier {
  UserData? _userData;

  UserData? get userData => _userData;

  Future<void> storeUserData(
      String email, String username, String phoneNumber) async {
    try {
      final userData =
          UserData(email: email, username: username, phoneNumber: phoneNumber);

      // Store user data in Firebase
      await FirebaseFirestore.instance.collection('user').add({
        'email': email,
        'username': username,
        'phoneNumber': phoneNumber,
      });

      // Update the local user data
      _userData = userData;

      // Notify listeners of the change
      notifyListeners();
    } catch (e) {
      // An error occurred while storing user data
    }
  }
}
