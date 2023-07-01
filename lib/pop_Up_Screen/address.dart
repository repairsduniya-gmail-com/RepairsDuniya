import 'dart:async';

import '../Model_Screens/Map_Screen/get_location.dart';
import '../Model_Screens/Map_Screen/location_service.dart';
import 'Date_Screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showCustomAdressBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(35),
    )),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (BuildContext context) {
      return Address_sheet(DeliveryStatusScreen());
    },
  );
}

class Address_sheet extends StatefulWidget {
  final DeliveryStatusScreen widgetA;
  Address_sheet(this.widgetA);
  @override
  State<Address_sheet> createState() => _Address_sheetState();
}

class _Address_sheetState extends State<Address_sheet>
    with SingleTickerProviderStateMixin {
  bool showBookingsheet = true;
  bool _hasBeenPressed = false;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
    _animationController.forward();
  }

  void togggleContent() {}
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleContent() {
    setState(() {
      showBookingsheet = !showBookingsheet;
    });
  }

  Widget Adress_sheet() {
    final TextEditingController _Textcontroller = TextEditingController();
    // showModalBottomSheet(
    //     context: context,

    //     builder: (context) =>
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 6.h,
            width: 50.w,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
                child: Text(
              "Select Address",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
            )),
          ),
          Container(
            height: 300.h,
            child: SearchlocationScreen(),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 30, left: 10),
          //   child: Align(
          //     alignment: Alignment.bottomRight,
          //     child: IconButton(
          //         icon: Icon(Icons.arrow_forward_outlined),
          //         iconSize: 45,
          //         color: Colors.black,
          //         onPressed: () {
          //           isDeliveyPossible
          //               ? Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) =>
          //                           Address_sheet(DeliveryStatusScreen())),
          //                 )
          //               : Container(child: Text('Booking confirm?'));
          //         }),
          //   ),
          // )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        if (showBookingsheet) Adress_sheet(),
        if (!showBookingsheet) Address_sheet(DeliveryStatusScreen())
      ]),
    );
  }
}
