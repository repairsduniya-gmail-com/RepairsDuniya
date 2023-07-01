// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class UserData {

//   final String email;
//   final String username;
//   final String phoneNumber;

//   UserData({
//     required this.email,
//     required this.username,
//     required this.phoneNumber,
//   });
// }

// class UserDataProvider extends ChangeNotifier {
//   UserData? _userData;

//   UserData? get userData => _userData;

//   Future<void> storeUserData(
//       String userId, String email, String username, String phoneNumber) async {
//     try {
//       final userData = UserData(

//           email: email,
//           username: username,
//           phoneNumber: phoneNumber);

//       // Store user data in Firebase
//       await FirebaseFirestore.instance.collection('user').add({
//         'userId': userId,
//         'email': email,
//         'username': username,
//         'phoneNumber': phoneNumber,
//       });

//       // Update the local user data
//       _userData = userData;

//       // Notify listeners of the change
//       notifyListeners();
//     } catch (e) {
//       // An error occurred while storing user data
//     }
//   }

//   Future<void> fetchUserData(String userId) async {
//     try {
//       DocumentSnapshot snapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userId)
//           .get();

//       if (snapshot.exists) {
//         _userData = snapshot.data() as UserData;
//         notifyListeners();
//       }
//     } catch (error) {
//       // Handle the error
//       print('Error fetching user data: $error');
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class User {
  final String userId;
  final String email;
  final String username;
  final String phoneNumber;

  User({
    required this.userId,
    required this.email,
    required this.username,
    required this.phoneNumber,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }
}

class UserDataProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _userData;

  User? get userData => _userData;

  Future<void> storeUserData(
    String email,
    String username,
    String phoneNumber,
  ) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final userId = user?.uid;

      if (userId != null) {
        final userData = User(
          userId: userId,
          email: email,
          username: username,
          phoneNumber: phoneNumber,
        );

        await _firestore.collection('user').doc(userId).set({
          'email': email,
          'username': username,
          'phoneNumber': phoneNumber,
        });
      }
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('user')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();
      // Save order document to Firestore
      await _firestore
          .collection('user')
          .doc(phoneNumber)
          .collection('userData')
          .doc(phoneNumber)
          .set({
        'email': email,
        'username': username,
        'phoneNumber': phoneNumber,
      });
      await _firestore
          .collection('user')
          // .doc(phoneNumber)
          // .collection('userData')
          .doc(phoneNumber)
          .set({
        'email': email,
        'username': username,
        'phoneNumber': phoneNumber,
      });

      // Store user data in Firestore
      // await FirebaseFirestore.instance.collection('user').doc(userId).set({
      //   'email': email,
      //   'username': username,
      //   'phoneNumber': phoneNumber,
      // });

      // Update the local user data
      _userData = userData;

      // Notify listeners of the change
      notifyListeners();
    } catch (error) {
      // Handle the error
      print('Error storing user data: $error');
    }
  }
  // Future<void> storeUserData(
  //   String email,
  //   String username,
  //   String phoneNumber,
  // ) async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;
  //     final userId = user?.uid;

  //     if (userId != null) {
  //       final userData = User(
  //         userId: userId,
  //         email: email,
  //         username: username,
  //         phoneNumber: phoneNumber,
  //       );

  //       await _firestore
  //           .collection('user')
  //           // .doc(phoneNumber)
  //           // .collection('userData')
  //           .doc(userData.phoneNumber)
  //           .set({
  //         'email': email,
  //         'username': username,
  //         'phoneNumber': phoneNumber,
  //       });
  //     }

  //     // Update the local user data
  //     _userData = userData;

  //     // Notify listeners of the change
  //     notifyListeners();
  //   } catch (error) {
  //     // Handle the error
  //     print('Error storing user data: $error');
  //   }
  // }

  Future<User?> fetchUserDetails() async {
    User? currentUser = FirebaseAuth.instance.currentUser as User?;
    final uuid = Uuid();
    final userId = uuid.v4();

    if (currentUser != null) {
      // User details fetched successfully
      String? email = currentUser.email;
      String? username = currentUser.username;
      String? phoneNumber = currentUser.phoneNumber;

      // Create a User object or return the necessary information
      User userDetails = User.fromMap({
        'userId': userId,
        'email': email,
        'username': username,
        'phoneNumber': phoneNumber,
      });

      return userDetails;
    } else {
      // User not logged in
      return null;
    }
  }

  Future<User?> getUserByPhoneNumber(String phoneNumber) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('user')
              .doc(phoneNumber)
              .collection('userData')
              .where('phoneNumber', isEqualTo: phoneNumber)
              .limit(1)
              .get();

      if (snapshot.docs.isNotEmpty) {
        final userData = snapshot.docs.first.data();
        return User.fromMap(userData);
      }
    } catch (error) {
      print('Error getting user by phone number: $error');
    }

    return null;
  }
}

  // Future<User?> getUserByPhoneNumber(String phoneNumber) async {
  //   try {
  //     // Perform the query to search for the user with the given phone number
  //     final QuerySnapshot<Map<String, dynamic>> snapshot =
  //         await FirebaseFirestore.instance
  //             .collection('user')
  //             .where('phoneNumber', isEqualTo: phoneNumber)
  //             .get();

  //     if (snapshot.docs.isNotEmpty) {
  //       // Return the first user found (or handle multiple matches)
  //       final userDoc = snapshot.docs.first;
  //       final user = User.fromMap(userDoc.data());
  //       return user;
  //     } else {
  //       // Return null if no user with the given phone number is found
  //       return null;
  //     }
  //   } catch (e) {
  //     // Handle any errors that occur during the query
  //     print('Error querying user by phone number: $e');
  //     return null;
  //   }
  // }

