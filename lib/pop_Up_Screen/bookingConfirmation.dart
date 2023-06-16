import 'dart:math';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:confetti/confetti.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/Model_Screens/Home_Screen/home.dart';
import 'package:repair_duniya/pop_Up_Screen/booking.dart';

class BookingConfirmation extends StatefulWidget {
  const BookingConfirmation({Key? key}) : super(key: key);

  @override
  State<BookingConfirmation> createState() => _BookingConfirmationState();
}

class _BookingConfirmationState extends State<BookingConfirmation> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 3));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _confettiController.play();
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime date) {
      final formatter = DateFormat(
          'MMM d, y'); // Format the date as 'MMM d, y' (e.g., Jan 1, 2023)
      return formatter.format(date);
    }

    final bookingsProvider =
        Provider.of<BookingsProvider>(context, listen: false);
    final bookingId = bookingsProvider.bookings.isNotEmpty
        ? bookingsProvider.bookings[0].bookingId
        : '';
    DateTime? dateTime = DateTime.now(); // Nullable DateTime object
    String formattedDate = formatDate(dateTime);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            //width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: false,
                  colors: [
                    Colors.orange,
                    Colors.blue,
                    Colors.green,
                    Colors.red,
                    Colors.yellow
                  ],
                  gravity: 0.3,
                  numberOfParticles: 20,
                  maximumSize: Size(10, 10),
                  minimumSize: Size(1, 1),
                  child: Image.asset(
                    'screen_assets/check4.jpeg',
                    scale: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: Text(
                    'Your Appoinment Booked Successfully',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Booking Details',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 27,
                            fontWeight: FontWeight.w500),
                      ),
                      ConfettiWidget(
                        confettiController: _confettiController,
                        blastDirectionality: BlastDirectionality.explosive,
                        shouldLoop: false,
                        colors: [
                          Colors.orange,
                          Colors.blue,
                          Colors.green,
                          Colors.red,
                          Colors.yellow
                        ],
                        gravity: 0.3,
                        numberOfParticles: 15,
                        maximumSize: Size(10, 10),
                        minimumSize: Size(1, 1),
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 17),
                      children: [
                        TextSpan(text: 'Booking ID : $bookingId\n'),
                        TextSpan(text: 'Booking Date : $formattedDate\n'),
                        TextSpan(text: 'Contact Us : 1234567891\n'),
                      ]),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Myhome(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black87),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(230.w, 52.h),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back),
                    Text(
                      ' Return To Home',
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: true,
              colors: [
                Colors.orange,
                Colors.blue,
                Colors.green,
                Colors.red,
                Colors.yellow
              ],
              gravity: 0.3,
              numberOfParticles: 15,
              maximumSize: Size(10, 10),
              minimumSize: Size(1, 1),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: [
                Colors.orange,
                Colors.blue,
                Colors.green,
                Colors.red,
                Colors.yellow
              ],
              gravity: 0.3,
              numberOfParticles: 15,
              maximumSize: Size(10, 10),
              minimumSize: Size(1, 1),
            ),
          ),
        ],
      ),
    );
  }
}
