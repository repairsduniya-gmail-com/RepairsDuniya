import 'package:flutter/material.dart';

class BookingsView  extends StatelessWidget {
  const BookingsView ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 33,
            )),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/NoBooking.png',
              scale: 2.9,
            ),
            const Text(
              'No Bookings',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 7),
              child: Text(
                'We are sad, till now you didn\'t make any Booking',
                style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
