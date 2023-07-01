import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String? _token;
  String? _userId;

  String? get token => _token;
  bool get isAuthenticated => _isAuthenticated;
  String? get userId => _userId;

  void setAuthenticated(String token, String userId) {
    _token = token;
    _isAuthenticated = true;
    _userId = userId;
    notifyListeners();
  }

  void clearAuthentication() {
    _token = null;
    _isAuthenticated = false;
    _userId = null;
    notifyListeners();
  }
}

class AuthProvider extends ChangeNotifier {
  Future<bool> checkPhoneNumberExists(String phoneNumber) async {
    final QuerySnapshot result = await _firestore
        .collection('user')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .limit(1)
        .get();

    return result.docs.isNotEmpty;
  }
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
void _verifyPhoneNumber(BuildContext context, String phoneNumber) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        final String userId = _auth.currentUser!.uid;

        Provider.of<UsersProvider>(context, listen: false)
            .setAuthenticated(userId, phoneNumber);

        ;
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        final String token = await userCredential.user!.getIdToken();
        final SharedPreferences prefs = await SharedPreferences.getInstance();

// ...

        await prefs.setString('authToken', token);
        // Navigate to the home screen or perform other actions upon successful authentication
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save the verification ID and navigate to the sign-up screen
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => SignUpScreen(verificationId: verificationId),
        //   ),
        // );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle code auto-retrieval timeout
      });
}

Future<void> logout() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('authToken');
  // Perform any additional logout logic here
}






// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:provider/provider.dart';
// // import 'package:repair_duniya/Model_Screens/Home_Screen/home.dart';
// // import 'package:repair_duniya/SplashView.dart';

// // class UserProvider extends ChangeNotifier {
// //   String? email;
// //   String? username;
// //   String? phoneNumber;

// //   void setUserDetails(String email, String username, String phoneNumber) {
// //     this.email = email;
// //     this.username = username;
// //     this.phoneNumber = phoneNumber;
// //     notifyListeners();
// //   }
// // }
// import 'dart:convert';
// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
// import 'package:repair_duniya/models/constant.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class HttpException implements Exception {
//   final String message;

//   HttpException(this.message);

//   @override
//   String toString() {
//     return message;
//     // return super.toString(); // Instance of HttpException
//   }
// }

// final FirebaseAuth _auth = FirebaseAuth.instance;

// class Auth with ChangeNotifier {
//   String? _token;
//   DateTime? _expiryDate;
//   String? _userId;
//   Timer? _authTimer;

//   bool get isAuth {
//     return token != null;
//   }

//   String? get token {
//     if (_expiryDate != null &&
//         _expiryDate!.isAfter(DateTime.now()) &&
//         _token != null) {
//       return _token;
//     }
//     return null;
//   }

//   String? get userId {
//     return _userId;
//   }

//   String generateRandomPassword({int length = 8}) {
//     const String chars =
//         'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
//     const String Specialchar = '@#\$%*';
//     final random = Random();
//     String password = '';

//     for (int i = 0; i < length; i++) {
//       password += chars[random.nextInt(chars.length)];
//       password += chars[random.nextInt(Specialchar.length)];
//     }

//     return password;
//   }

//   Future<void> _authenticate(
//       String email, String password, String UrlSegment) async {
//     final url = google_api_key;
//     try {
//       final response = await http.post(
//         url as Uri,
//         body: json.encode(
//           {
//             'email': email,
//             'password': generateRandomPassword(),
//             'returnSecureToken': true,
//           },
//         ),
//       );
//       final responseData = json.decode(response.body);
//       if (responseData['error'] != null) {
//         throw HttpException(responseData['error']['message']);
//       }
//       _token = responseData['idToken'];
//       _userId = responseData['localId'];
//       _expiryDate = DateTime.now().add(
//         Duration(
//           seconds: int.parse(
//             responseData['expiresIn'],
//           ),
//         ),
//       );
//       _autoLogout();
//       notifyListeners();
//       final prefs = await SharedPreferences.getInstance();
//       final userData = json.encode(
//         {
//           'token': _token,
//           'userId': _userId,
//           'expiryDate': _expiryDate!.toIso8601String(),
//         },
//       );
//       prefs.setString('userData', userData);
//     } catch (error) {
//       throw error;
//     }
//   }

//   Future<void> signup(String email, String password) async {
//     return _authenticate(email, password, 'signupNewUser');
//   }

//   Future<void> login(String email, String password) async {
//     return _authenticate(email, password, 'verifyPassword');
//   }

//   Future<bool> tryAutoLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (!prefs.containsKey('userData')) {
//       return false;
//     }
//     final extractedUserData =
//         json.decode(prefs.getString('userData') ?? " ") as Map<String, dynamic>;
//     final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

//     if (expiryDate.isBefore(DateTime.now())) {
//       return false;
//     }
//     _token = extractedUserData['token'];
//     _userId = extractedUserData['userId'];
//     _expiryDate = expiryDate;
//     notifyListeners();
//     _autoLogout();
//     return true;
//   }

//   Future<void> logout() async {
//     _token = null;
//     _userId = null;
//     _expiryDate = null;
//     if (_authTimer != null) {
//       _authTimer!.cancel();
//       _authTimer = null;
//     }
//     notifyListeners();
//     final prefs = await SharedPreferences.getInstance();
//     // prefs.remove('userData');
//     prefs.clear();
//   }

//   void _autoLogout() {
//     if (_authTimer != null) {
//       _authTimer!.cancel();
//     }
//     final timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
//     _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
//   }
// }

// class AuthProvider extends ChangeNotifier {

// Future<void> signup() async {
//   final email = _emailController.text;
//   final username = _usernameController.text;
//   final phoneNumber = _phoneNumberController.text;

//   try {
//     // Create a new user with email and password
//     final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//       password: generateRandomPassword(), // Replace with your logic to generate a password
//     );

//     // Get the generated user ID
//     final userId = userCredential.user.uid;

//     // Save user details to Firebase Realtime Database
//     final DatabaseReference userRef = FirebaseDatabase.instance.reference().child('users/$userId');
//     userRef.set({
//       'email': email,
//       'username': username,
//       'phoneNumber': phoneNumber,
//     });

//     // Generate and send OTP
//     final otp = generateOTP(); // Replace with your logic to generate an OTP
//     await sendOTP(phoneNumber, otp); // Replace with your logic to send OTP using an SMS gateway

//     // Proceed with OTP verification
//     // ...
//   } catch (error) {
//     print('Signup error: $error');
//     // Handle signup error
//   }
// }

// //   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// //   final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference().child('users');
// //   User? _user;
// //   User? get user => _user;

// //   Future<void> verifyPhoneNumber(String phoneNumber, BuildContext context) async {
// //     await _firebaseAuth.verifyPhoneNumber(
// //       phoneNumber: phoneNumber,
// //       verificationCompleted: (PhoneAuthCredential credential) async {
// //         // Automatically sign in the user if verification is completed instantly
// //         final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
// //         _user = userCredential.user;
// //         notifyListeners();

// //         // Navigate to a different page if authentication is successful
// //         if (_user != null) {
// //           Navigator.pushReplacement(
// //             context,
// //             MaterialPageRoute(builder: (context) => Myhome()),
// //           );
// //         }
// //       },
// //       verificationFailed: (FirebaseAuthException e) {
// //         // Handle verification failure
// //         print('Verification failed: $e');
// //       },
// //       codeSent: (String verificationId, int? resendToken) {
// //         // Save the verification ID for later use
// //         // For example, you can store it in a variable or a provider
// //         // and then use it when the user enters the received OTP code
// //         // to manually complete the authentication
// //         // You can also navigate to a screen where the user can enter the OTP
// //         // by passing the verificationId to that screen.
// //         // Example:
// //         // Navigator.push(
// //         //   context,
// //         //   MaterialPageRoute(builder: (context) => OtpScreen(verificationId)),
// //         // );
// //         print('Code sent. Verification ID: $verificationId');
// //       },
// //       timeout: const Duration(seconds: 60),
// //       codeAutoRetrievalTimeout: (String verificationId) {
// //         // Handle code auto-retrieval timeout
// //         print('Code auto-retrieval timed out. Verification ID: $verificationId');
// //       },
// //     );
// //   }

// //   Future<void> signInWithOTP(String verificationId, String smsCode) async {
// //     try {
// //       final AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
// //       final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
// //       _user = userCredential.user;
// //       notifyListeners();
// //     } catch (e) {
// //       // Handle sign-in errors
// //       print('Error signing in with OTP: $e');
// //     }
// //   }

// //     Future<void> saveUserData(String userId,String username, String email, String phoneNumber) {
// //     final userData = {
// //       'userId':
// //       'username': username,
// //       'email': email,
// //       'phoneNumber': phoneNumber,
// //     };

// //     return _databaseReference.child(userId).set(userData);
// //   }

// //   Future<void> signOut() async {
// //     await _firebaseAuth.signOut();
// //     _user = null;
// //     notifyListeners();
// //   }
// // }
