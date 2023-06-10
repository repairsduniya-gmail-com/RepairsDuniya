import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repair_duniya/Model_Screens/Home_Screen/home.dart';
// import 'package:repair_duniya/Model_Screens/Home_boarding_Screen/auth.dart';
import 'package:repair_duniya/Model_Screens/Login_All_Screen/otp.dart';
// import 'package:repair_duniya/SplashView.dart';
// import 'package:provider/provider.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:repair_duniya/SplashView.dart';

enum AuthMode { Signup, Login }

// ignore: must_be_immutable
class home_board extends StatelessWidget {
  home_board({super.key});

  FocusNode emailFocusnode = FocusNode();
  FocusNode usernameFocusnode = FocusNode();
  FocusNode mobileFocusnode = FocusNode();
  FocusNode buttonFocusnode = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String generateRandomPassword({int length = 8}) {
      const String chars =
          'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
      final random = Random();
      String password = '';

      for (int i = 0; i < length; i++) {
        password += chars[random.nextInt(chars.length)];
      }

      return password;
    }

    String generateOTP() {
      Random random = Random();
      int otp = random.nextInt(900000) + 100000;
      return otp.toString();
    }

    Future<void> signup() async {
      final email = emailController.text;
      final username = usernameController.text;
      final phoneNumber = phoneNumberController.text;

      try {
        // Create a new user with email and password
        final UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password:
              generateRandomPassword(), // Replace with your logic to generate a password
        );

        // Get the generated user ID
        final userId = userCredential.user!.uid;

        // Save user details to Firebase Realtime Database
        final DatabaseReference userRef =
            FirebaseDatabase.instance.reference().child('users/$userId');
        userRef.set({
          'email': email,
          'username': username,
          'phoneNumber': phoneNumber,
        });

        // // Generate and send OTP
        // final otp = generateOTP(); // Replace with your logic to generate an OTP
        // await sendOTP(phoneNumber, otp); // Replace with your logic to send OTP using an SMS gateway

        // Proceed with OTP verification
        // ...
      } catch (error) {
        //print('Signup error: $error');
        // Handle signup error
      }
    }
    // final authProvider = Provider.of<AuthProvider>(context, listen: false);

    void _submitForm() {
      if (_formKey.currentState!.validate()) {
        // final userProvider = Provider.of<UserProvider>(context, listen: false);

        Future<void> storeUserData(
            String email, String phoneNumber, String username) async {
          try {
            CollectionReference users =
                FirebaseFirestore.instance.collection('users');
            await users.add({
              'email': email,
              'phone': phoneNumber,
              'username': username,
            });
            // User data stored successfully
          } catch (e) {
            // Handle data storage errors
          }
        }

        // userProvider.setUserDetails(
        //   emailController.text,
        //   usernameController.text,
        //   phoneNumberController.text,
        // );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SplashView()),
        );
        signup();
      }
    }
    // void _handleSubmitted() {
    //   final String username = usernameController.text.trim();
    //   final String email = emailController.text.trim();
    //   final String phoneNumber = mobileController.text.trim();

    //   // Call the signup method with the entered data
    //   // authProvider.signUpWithEmailAndPassword(
    //   //     email, password, username, phoneNumber, context);
    //   authProvider.saveUserData(username, email, phoneNumber);
    // }

    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          height: 170.h,
                          width: 170.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/logo sqaure.png",
                                  ),
                                  fit: BoxFit.cover))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Text(
                        "Repairs\nDuniya",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 33.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 465.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/Boat minimal.jpeg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    // child: AuthCard(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Register Now & Avail More Offers",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextFormField(
                            focusNode: usernameFocusnode,
                            keyboardType: TextInputType.text,
                            controller: usernameController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person,
                                ),
                                labelText: 'Enter UserName',
                                hintText: ' Enter UserName',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(emailFocusnode);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            focusNode: emailFocusnode,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.alternate_email,
                              ),
                              labelText: 'Enter Email',
                              hintText: ' Enter Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(mobileFocusnode);
                            },
                            // //** EMail validation */

                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field can't be empty.";
                              } else if (!RegExp(r'\S+@\S+\.\S+')
                                  .hasMatch(value)) {
                                return "Please Enter a Valid Email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            focusNode: mobileFocusnode,
                            keyboardType: TextInputType.number,
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.call,
                                ),
                                prefixText: '+91 ',
                                labelText: 'Mobile Number',
                                hintText: 'Mobile Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(buttonFocusnode);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field can't be empty.";
                              } else if (value.length != 10) {
                                return "Please Enter a Valid Mobile Number";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SizedBox(
                            height: 48.h,
                            width: 150.w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  //elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  backgroundColor: Colors.blue[200]),
                              onPressed: _submitForm,
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class AuthCard extends StatefulWidget {
//   const AuthCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _AuthCardState createState() => _AuthCardState();
// }

// class _AuthCardState extends State<AuthCard> {
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   AuthMode _authMode = AuthMode.Login;
//   Map<String, String> _authData = {
//     'email': '',
//     'password': '',
//   };
//   var _isLoading = false;
//   final _passwordController = TextEditingController();

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text('An Error Occurred!'),
//         content: Text(message),
//         actions: <Widget>[
//           ElevatedButton(
//             child: Text('Okay'),
//             onPressed: () {
//               Navigator.of(ctx).pop();
//             },
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> _submit() async {
//     if (!_formKey.currentState!.validate()) {
//       // Invalid!
//       return;
//     }
//     _formKey.currentState!.save();
//     setState(() {
//       _isLoading = true;
//     });
//     try {
//       if (_authMode == AuthMode.Login) {
//         // Log user in
//         await Provider.of<Auth>(context, listen: false).login(
//           _authData['email'] ?? "",
//           _authData['password'] ?? "",
//         );
//       } else {
//         // Sign user up
//         await Provider.of<Auth>(context, listen: false).signup(
//           _authData['email'] ?? "",
//           _authData['password'] ?? "",
//         );
//       }
//     } on HttpException catch (error) {
//       var errorMessage = 'Authentication failed';
//       if (error.toString().contains('EMAIL_EXISTS')) {
//         errorMessage = 'This email address is already in use.';
//       } else if (error.toString().contains('INVALID_EMAIL')) {
//         errorMessage = 'This is not a valid email address';
//       } else if (error.toString().contains('WEAK_PASSWORD')) {
//         errorMessage = 'This password is too weak.';
//       } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
//         errorMessage = 'Could not find a user with that email.';
//       } else if (error.toString().contains('INVALID_PASSWORD')) {
//         errorMessage = 'Invalid password.';
//       }
//       _showErrorDialog(errorMessage);
//     } catch (error) {
//       const errorMessage =
//           'Could not authenticate you. Please try again later.';
//       _showErrorDialog(errorMessage);
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   void _switchAuthMode() {
//     if (_authMode == AuthMode.Login) {
//       setState(() {
//         _authMode = AuthMode.Signup;
//       });
//     } else {
//       setState(() {
//         _authMode = AuthMode.Login;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       elevation: 8.0,
//       child: Container(
//         height: _authMode == AuthMode.Signup ? 320 : 260,
//         constraints:
//             BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 320 : 260),
//         width: deviceSize.width * 0.75,
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'E-Mail'),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value!.isEmpty || !value.contains('@')) {
//                       return 'Invalid email!';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _authData['email'] = value!;
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Password'),
//                   obscureText: true,
//                   controller: _passwordController,
//                   validator: (value) {
//                     if (value!.isEmpty || value.length < 5) {
//                       return 'Password is too short!';
//                     }
//                   },
//                   onSaved: (value) {
//                     _authData['password'] = value!;
//                   },
//                 ),
//                 if (_authMode == AuthMode.Signup)
//                   TextFormField(
//                     enabled: _authMode == AuthMode.Signup,
//                     decoration: InputDecoration(labelText: 'Confirm Password'),
//                     obscureText: true,
//                     validator: _authMode == AuthMode.Signup
//                         ? (value) {
//                             if (value != _passwordController.text) {
//                               return 'Passwords do not match!';
//                             }
//                           }
//                         : null,
//                   ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 if (_isLoading)
//                   CircularProgressIndicator()
//                 else
//                   ElevatedButton(
//                     child:
//                         Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
//                     onPressed: _submit,
//                     // style: ButtonStyle(
//                     //    shape: RoundedRectangleBorder(
//                     //   borderRadius: BorderRadius.circular(30),
//                     // ),
//                     // padding:
//                     //     EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
//                     // color: Theme.of(context).primaryColor,
//                     // textColor: Theme.of(context).primaryTextTheme.button.color,
//                     // ),
//                   ),
//                 ElevatedButton(
//                   child: Text(
//                       '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
//                   onPressed: _switchAuthMode,
//                   // padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
//                   // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   // textColor: Theme.of(context).primaryColor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
