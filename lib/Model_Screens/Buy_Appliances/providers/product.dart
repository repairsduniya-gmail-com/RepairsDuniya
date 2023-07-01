// import 'dart:convert';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

// class Product with ChangeNotifier {
//   final String id;
//   final String title;
//   final String description;
//   final double price;
//   final String imageUrl;
//   final String Categories;
//   final String subtitle;
//   bool isFavorite;

//   Product({
//     required this.Categories,
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.imageUrl,
//     required this.subtitle,
//     this.isFavorite = false,
//   });

//   void _setFavValue(bool newValue) {
//     isFavorite = newValue;
//     notifyListeners();
//   }
// }

// class FavoriteItemsProvider with ChangeNotifier {
//   final DatabaseReference _databaseReference =
//       FirebaseDatabase.instance.reference();

//   List<Product> _favoriteItems = [];

//   List<Product> get favoriteItems => [..._favoriteItems];

//   Future<void> toggleFavoriteStatus(String itemId) async {
//     final itemIndex = _favoriteItems.indexWhere((item) => item.id == itemId);
//     if (itemIndex >= 0) {
//       final item = _favoriteItems[itemIndex];
//       final newFavoriteStatus = !item.isFavorite;
//       item.isFavorite = newFavoriteStatus;
//       notifyListeners();

//       // Save the updated favorite status in Firebase
//       try {
//         await _databaseReference
//             .child('userFavorites')
//             .child(item.id)
//             .set(newFavoriteStatus);
//       } catch (error) {
//         // Handle error if saving to Firebase fails
//         print('Error saving favorite status: $error');
//       }
//     }
//   }
// }
