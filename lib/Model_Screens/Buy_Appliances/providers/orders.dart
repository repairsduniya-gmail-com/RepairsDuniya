// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:firebase_database/firebase_database.dart';

// import './cart.dart';

// class OrderItem {
//   final String id;
//   final double amount;
//   final List<CartItem> products;
//   final DateTime dateTime;

//   OrderItem({
//     required this.id,
//     required this.amount,
//     required this.products,
//     required this.dateTime,
//   });
// }

// class Orders with ChangeNotifier {
//   List<OrderItem> _orders = [];
//   // final String authToken;
//   // final String userId;

//   Orders();

//   List<OrderItem> get orders {
//     return [..._orders];
//   }

//   final DatabaseReference _databaseReference =
//       FirebaseDatabase.instance.reference();

//   Future<void> fetchAndSetOrders() async {
//     try {
//       final snapshot = await _databaseReference.child('orders').get();
//       final extractedData = snapshot.value as Map<dynamic, dynamic>?;
//       if (extractedData == null) {
//         return;
//       }
//       final List<OrderItem> loadedOrders = extractedData.entries
//           .map((entry) => OrderItem(
//                 id: entry.key,
//                 amount: entry.value['amount'],
//                 dateTime: DateTime.parse(entry.value['dateTime']),
//                 products: (entry.value['products'] as List<dynamic>)
//                     .map((item) => CartItem(
//                           id: item['id'],
//                           price: item['price'],
//                           quantity: item['quantity'],
//                           title: item['title'],
//                         ))
//                     .toList(),
//               ))
//           .toList();
//       _orders = loadedOrders.reversed.toList();
//       notifyListeners();
//     } catch (error) {
//       // Handle error fetching orders from Firebase
//       print('Error fetching orders: $error');
//     }
//   }

//   Future<void> addOrder(List<CartItem> cartProducts, double total) async {
//     try {
//       final timestamp = DateTime.now();
//       final newOrderRef = _databaseReference.child('orders').push();
//       await newOrderRef.set({
//         'amount': total,
//         'dateTime': timestamp.toIso8601String(),
//         'products': cartProducts
//             .map((cp) => {
//                   'id': cp.id,
//                   'title': cp.title,
//                   'quantity': cp.quantity,
//                   'price': cp.price,
//                 })
//             .toList(),
//       });
//       final newOrderId = newOrderRef.key;
//       _orders.insert(
//         0,
//         OrderItem(
//           id: newOrderId!,
//           amount: total,
//           dateTime: timestamp,
//           products: cartProducts,
//         ),
//       );
//       notifyListeners();
//     } catch (error) {
//       // Handle error saving order to Firebase
//       print('Error adding order: $error');
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'all_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String orderId;
  String phoneNumber;
  List<Product> products;
  int quantity;
  double totalPrice;

  Order({
    required this.orderId,
    required this.phoneNumber,
    required this.products,
    required this.quantity,
    required this.totalPrice,
  });
}

class OrdersProvider with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> placeOrder(List<CartItem> cartItems, String phoneNumber) async {
    try {
      // Convert cart items to products
      List<Product> products = cartItems.map((cartItem) {
        return Product(
            id: cartItem.id,
            imageUrl: cartItem.imageUrl,
            price: cartItem.price,
            subtitle: cartItem.subtitle,
            category: cartItem.category,
            description: cartItem.description,
            title: cartItem.title,
            isFavorite: false);
      }).toList();

      // Calculate total price
      int totalPrice = cartItems.fold(0, (sum, cartItem) {
        return sum + (cartItem.price * cartItem.quantity);
      });

      // Create order document
      final orderData = {
        'phoneNumber': phoneNumber,
        'products': products.map((product) => product.toMap()).toList(),
        'totalPrice': totalPrice,
        'timestamp': Timestamp.now(),
      };
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('user')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();
      // Save order document to Firestore
      await _firestore
          .collection('user')
          .doc(phoneNumber)
          .collection('orders')
          .add(orderData);

      // Clear the cart after placing the order
      // clearCart();

      notifyListeners();
    } catch (error) {
      // Handle error placing the order
      print('Error placing order: $error');
      throw error;
    }
  }

  // Other methods in the OrdersProvider class
}
