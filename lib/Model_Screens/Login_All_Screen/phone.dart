import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/Model_Screens/Home_boarding_Screen/phoneNumberProvider.dart';
import 'package:repair_duniya/Model_Screens/Home_boarding_Screen/user.dart';
import 'package:repair_duniya/Model_Screens/Login_All_Screen/otp.dart';
// import 'package:repair_duniya/Model_Screens/Login_All_Screen/phone.dart';
import '../Home_Screen/home.dart';
import '../Home_boarding_Screen/auth.dart';
import '../Home_boarding_Screen/home_board.dart';
import '../Home_boarding_Screen/user.dart' as app_user;

class MyPhone extends StatefulWidget {
  final List<String> imgList = ["assets/login-2.jpg", "assets/login-3.jpg"];

  MyPhone();
  static String verify = "";
  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController _countryCode = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  Future<void> _checkPhoneNumber(BuildContext context) async {
    // final userProvider = Provider.of<UsersProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    // final userDataProvider =
    //     Provider.of<UserDataProvider>(context, listen: false);
    final phoneProvider = Provider.of<PhoneProvider>(context, listen: false);
    final phoneNumber = _phoneNumberController.text.trim();
    phoneProvider.setPhoneNumber = phoneNumber;
    if (phoneNumber.isNotEmpty) {
      final exists = await authProvider.checkPhoneNumberExists(phoneNumber);

      if (exists) {
        // Phone number exists in the database
        // Navigate to the home screen or login screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Myhome()));
        // Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Phone number doesn't exist in the database
        // Navigate to the sign-up screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home_board()));
      }
    }
  }

  var phone = "";
  @override
  void initState() {
    _countryCode.text = "+91"; // TODO: implement initState
    super.initState();
  }

  String CountryCode = '+91';
  int _current = 0;
  Widget build(BuildContext context) {
    final userDataProvider =
        Provider.of<UserDataProvider>(context, listen: false);
    final phoneNumber = _phoneNumberController.text.trim();
    ScreenUtil.init(context);
    final List<Widget> imgSlider = widget.imgList
        .map(
          (item) => Container(
            height: 500.h,
            width: 1000.w,
            child: Stack(
              children: [
                Image.asset(item, fit: BoxFit.fill, width: double.infinity),
              ],
            ),
          ),
        )
        .toList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(children: [
            CarouselSlider(
              items: imgSlider,
              options: CarouselOptions(
                viewportFraction: 1,
                enlargeCenterPage: true,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imgList.map((url) {
                int index = widget.imgList.indexOf(url);
                return Container(
                  width: 8.w,
                  height: 8.h,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 3,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index ? Colors.black : Colors.grey),
                );
              }).toList(),
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              'Lets get started',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              'Verify your account using OTP',
              style: TextStyle(fontSize: 15.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              height: 55.h,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    width: 50.w,
                    child: TextButton(
                        onPressed: () {
                          showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                                flagSize: 20,
                                textStyle: TextStyle(fontSize: 10.sp),
                                inputDecoration: InputDecoration(
                                  hintText: "Start Typing to Search",
                                  labelText: 'Search',
                                )),
                            onSelect: (Country value) {
                              print(value.countryCode.toString());
                              print(value.phoneCode.toString());
                              CountryCode = value.phoneCode.toString();
                              setState(() {});
                            },
                          );
                        },
                        child: Text(CountryCode.toString())),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        phone = value;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter phone number"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              height: 45.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  _checkPhoneNumber(context);
                  // Trigger the search for user details when the button is pressed
                  //  app_user.User? user = await userDataProvider.getUserByPhoneNumber(phoneNumber);
                  //   if (user != null) {
                  //     // User found, navigate to the user details screen
                  //     Navigator.of(context).push(
                  //       MaterialPageRoute(
                  //         builder: (context) =>Myhome(),
                  //       ),
                  //     );
                  //   } else {
                  //     // User not found, show an error message
                  //     showDialog(
                  //       context: context,
                  //       builder: (context) => AlertDialog(
                  //         title: Text('User not found'),
                  //         content: Text('No user found with the entered phone number.'),
                  //         actions: [
                  //           TextButton(
                  //             onPressed: () {
                  //               Navigator.of(context).pop();
                  //             },
                  //             child: Text('OK'),
                  //           ),
                  //         ],
                  //       ),
                  //   );
                  // }
                },

                //     async {
                //   await FirebaseAuth.instance.verifyPhoneNumber(
                //     phoneNumber: '${_countryCode.text + phone}',
                //     verificationCompleted: (PhoneAuthCredential credential) {},
                //     verificationFailed: (FirebaseAuthException e) {},
                //     codeSent: (String verificationId, int? resendToken) {
                //       MyPhone.verify = verificationId;
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (builder) => MyOtp()));
                //     },
                //     codeAutoRetrievalTimeout: (String verificationId) {},
                //   );
                // },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text('Send the code',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
