import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';

class Product {
  final String id;
  final String category;
  final String subtitle;
  final String title;
  final String description;
  final double price;
  final bool isFavorite;
  final String imageUrl;

  Product({
    required this.id,
    required this.category,
    required this.subtitle,
    required this.title,
    required this.description,
    required this.price,
    required this.isFavorite,
    required this.imageUrl,
  });
}

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products {
    return [..._products];
  }

  Future<void> fetchProducts() async {
    try {
      final DatabaseReference databaseReference =
          FirebaseDatabase.instance.reference();
      final snapshot = await databaseReference.child('products').once();
      final Map<dynamic, dynamic>? extractedData =
          snapshot.snapshot.value as Map<dynamic, dynamic>?;
      if (extractedData == null) {
        return;
      }
      final List<Product> loadedProducts = [];
      extractedData.forEach((key, value) {
        loadedProducts.add(Product(
          id: key,
          category: value['category'],
          subtitle: value['subtitle'],
          title: value['title'],
          description: value['description'],
          price: value['price'].toDouble(),
          isFavorite: value['isFavorite'],
          imageUrl: value['imageUrl'],
        ));
      });
      _products = loadedProducts;
      notifyListeners();
    } catch (error) {
      // Handle error fetching products from Firebase
      print('Error fetching products: $error');
    }
  }
}



// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// import './product.dart';

// class Products with ChangeNotifier {
//   List<Product> _items = [];
//   // final String authToken;
//   // final String userId;

//   Products();

//   List<Product> get items {
//     return [..._items];
//   }

//   List<Product> get favoriteItems {
//     return _items.where((prodItem) => prodItem.isFavorite).toList();
//   }

//   Product findById(String id) {
//     return _items.firstWhere((prod) => prod.id == id);
//   }

//   final DatabaseReference _databaseReference =
//       FirebaseDatabase.instance.reference();

//   Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
//     try {
//       final snapshot = await _databaseReference.child('products').once();
//       final Map<dynamic, dynamic>? extractedData =
//           snapshot.snapshot.value as Map<dynamic, dynamic>?;
//       if (extractedData == null) {
//         return;
//       }
//       final favoriteSnapshot =
//           await _databaseReference.child('userFavorites').once();
//       final favoriteData =
//           favoriteSnapshot.snapshot.value as Map<dynamic, dynamic>?;
//       final List<Product> loadedProducts = [];
//       extractedData.forEach((key, value) {
//         loadedProducts.add(Product(
//           id: key,
//           Categories: value['category'],
//           subtitle: value['subtitle'],
//           title: value['title'],
//           description: value['description'],
//           price: value['price'],
//           isFavorite: favoriteData == null ? false : favoriteData[key] ?? false,
//           imageUrl: value['imageUrl'],
//         ));
//       });
//       _items = loadedProducts;
//       notifyListeners();
//     } catch (error) {
//       // Handle error fetching products from Firebase
//       print('Error fetching products: $error');
//     }
//   }
// }
  // Future<void> addProduct(Product product) async {
  //   try {
  //     final newProductRef = _databaseReference.child('products').push();
  //     final newProductId = newProductRef.key;
  //     await newProductRef.set({
  //       'title': product.title,
  //       'description': product.description,
  //       'imageUrl': product.imageUrl,
  //       'price': product.price,
  //       'creatorId': userId,
  //     });
  //     final newProduct = Product(
  //       Categories: product.Categories,
  //       subtitle: product.subtitle,
  //       title: product.title,
  //       description: product.description,
  //       price: product.price,
  //       imageUrl: product.imageUrl,
  //       id: newProductId!,
  //     );
  //     _items.add(newProduct);
  //     notifyListeners();
  //   } catch (error) {
  //     // Handle error adding product to Firebase
  //     print('Error adding product: $error');
  //   }
  // }

  // Future<void> updateProduct(String id, Product newProduct) async {
  //   final prodIndex = _items.indexWhere((prod) => prod.id == id);
  //   if (prodIndex >= 0) {
  //     try {
  //       await _databaseReference.child('products').child(id).update({
  //         'title': newProduct.title,
  //         'description': newProduct.description,
  //         'imageUrl': newProduct.imageUrl,
  //         'price': newProduct.price,
  //       });
  //       _items[prodIndex] = newProduct;
  //       notifyListeners();
  //     } catch (error) {
  //       // Handle error updating product in Firebase
  //       print('Error updating product: $error');
  //     }
  //   } else {
  //     print('...');
  //   }
  // }

//   Future<void> deleteProduct(String id) async {
//     final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
//     Product? existingProduct;
//     if (existingProductIndex >= 0) {
//       existingProduct = _items[existingProductIndex];
//       _items.removeAt(existingProductIndex);
//       notifyListeners();
//     }
//     try {
//       await _databaseReference.child('products').child(id).remove();
//     } catch (error) {
//       // Handle error deleting product from Firebase
//       print('Error deleting product: $error');
//       if (existingProduct != null) {
//         _items.insert(existingProductIndex, existingProduct);
//         notifyListeners();
//       }
//     }
//     existingProduct = null;
//   }
// }
