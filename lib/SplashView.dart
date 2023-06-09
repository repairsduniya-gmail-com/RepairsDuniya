import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repair_duniya/Model_Screens/Home_Screen/home.dart';

// ignore: camel_case_types
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => SplashView_state();
}

// ignore: camel_case_types
class SplashView_state extends State<SplashView> {
  static const String keyLog = 'login';
  bool animate = false;
  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: AnimatedPositioned(
              duration: const Duration(seconds: 2),
              bottom: animate ? 350 : 0,
              left: 90,
              top: 80,
              child: AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: animate ? 1 : 0,
                child: Container(
                  height: 200.h,
                  width: 200.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      //color: Colors.amber,
                      image: DecorationImage(
                          image: AssetImage("assets/logo sqaure.png"),
                          fit: BoxFit.fill),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.grey, // color of the shadow
                          offset: Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1, // how far the color effect spreads.
                        ),
                      ]),
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 465,
          //   left: 80,
          //   child: Text("Get Technician At\n   Your Door Step.",
          //       style: TextStyle(
          //           fontSize: 25.sp,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.black)),
          // ),
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => animate = true);
    await Future.delayed(const Duration(milliseconds: 4000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Myhome(),
      ),
    );
    //
    // if (isLoggedIn != null) {
    //   if (isLoggedIn) {
    //     // ignore: use_build_context_synchronously
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const MovieListScreen(),
    //       ),
    //     );
    //   } else {
    //     // ignore: use_build_context_synchronously
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const Login(),
    //       ),
    //     );
    //   }
    // } else {
    //   // ignore: use_build_context_synchronously
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const SignUp(),
    //     ),
    //   );
    // }
  }
}
