import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// import 'package:repair_duniya/services/firestore_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../pop_Up_Screen/booking.dart';

//import 'package:repair_duniya/Model_Screens/Home_boarding_Screen/booking.dart';
FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<List<Booking>> getBookingsByPhoneNumber(String phoneNumber) async {
  try {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('user')
        .doc(phoneNumber)
        .collection('bookings')
        .get();

    final List<Booking> bookings = snapshot.docs
        .map((doc) => Booking.fromMap(doc.data()))
        .toList()
        .cast<Booking>(); // Explicitly cast the list to List<Booking>

    return bookings;
  } catch (error) {
    print('Error fetching bookings: $error');
    throw error;
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:repair_duniya/models/booking.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Booking>> getBookingsByPhoneNumber(String phoneNumber) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('user')
          .doc(phoneNumber)
          .collection('bookings')
          .get();

      final List<Booking> bookings = [];

      snapshot.docs.forEach((doc) {
        final bookingData = doc.data();
        final booking = Booking(
          service: bookingData['service'],
          serviceName: bookingData['serviceName'],
          date: bookingData['date'].toDate(),
          time: bookingData['time'],
          bookingId: bookingData['bookingId'],
          houseNumber: bookingData['houseNumber'],
          address: bookingData['address'],
          houseName: bookingData['appartmentName'],
          phoneNumber: bookingData['phoneNumber'],
          username: bookingData['username'],
          description: bookingData['description'],
          createdDate: bookingData['CreatedDate'].toDate(),
        );
        bookings.add(booking);
      });

      return bookings;
    } catch (error) {
      print('Error fetching bookings: $error');
      return [];
    }
  }
}

class BookingProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<Booking> _bookings = [];

  List<Booking> get bookings => _bookings;

  Future<void> fetchBookingsByPhoneNumber(String phoneNumber) async {
    try {
      _bookings = await _firestoreService.getBookingsByPhoneNumber(phoneNumber);
      notifyListeners();
    } catch (error) {
      print('Error fetching bookings: $error');
    }
  }
}

class BookingsView extends StatelessWidget {
  const BookingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//     return ChangeNotifierProvider<BookingProvider>(
//       create: (context) => BookingProvider(),
//       child: Consumer<BookingProvider>(
//         builder: (context, bookingProvider, _) {
//           return FutureBuilder<List<Booking>>(
//             future: bookingProvider.fetchBookingsByPhoneNumber(phoneNumber),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text('Error fetching bookings'),
//                 );
//               } else {
//                 final bookings = snapshot.data;
//                 if (bookings == null || bookings.isEmpty) {
//                   return Scaffold(
//                     appBar: AppBar(
//                       elevation: 0,
//                       backgroundColor: Colors.white,
//                       leading: IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: Icon(
//                             Icons.arrow_back_ios_new,
//                             color: Colors.black,
//                             size: 33,
//                           )),
//                     ),
//                     body: Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height,
//                       color: Colors.white,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         //crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             'assets/NoBooking.png',
//                             scale: 2.9,
//                           ),
//                           const Text(
//                             'No Bookings',
//                             style: TextStyle(
//                                 fontSize: 26, fontWeight: FontWeight.w600),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 50.0, vertical: 7),
//                             child: Text(
//                               'We are sad, till now you didn\'t make any Booking',
//                               style: TextStyle(
//                                   fontSize: 17, color: Colors.grey.shade600),
//                               textAlign: TextAlign.center,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 } else {
//                   return ListView.builder(
//                     itemCount: bookings.length,
//                     itemBuilder: (context, index) {
//                       final booking = bookings[index];
//                       // Display booking information
//                       return ListTile(
//                         title: Text(booking.serviceName),
//                         subtitle: Text(booking.date.toString()),
//                       );
//                     },
//                   );
//                 }
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }
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
