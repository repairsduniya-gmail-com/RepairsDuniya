import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';

import '../../Home_boarding_Screen/user.dart';
import 'orders.dart';

class Product {
  final String id;
  final String category;
  final String subtitle;
  final String title;
  final String description;
  final int price;
  bool isFavorite;
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
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
    };
  }
}

class CartItem {
  final String imageUrl;
  final String id;
  final String title;
  final int price;
  int quantity;
  final String category;
  final String description;
  final String subtitle;
  CartItem({
    required this.imageUrl,
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.category,
    required this.subtitle,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
    };
  }
}

class Order {
  String orderId;
  String userId;
  List<Product> products;
  int quantity;
  double totalPrice;

  Order({
    required this.orderId,
    required this.userId,
    required this.products,
    required this.quantity,
    required this.totalPrice,
  });
}

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products {
    return [..._products];
  }

  Future<void> fetchProducts() async {
    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('products').get();
      final List<Product> loadedProducts = [];
      for (var element in snapshot.docs) {
        final extractedData = element.data() as Map<dynamic, dynamic>;
        final product = Product(
          id: extractedData['id'] ?? '',
          category: extractedData['category'] ?? '',
          subtitle: extractedData['subtitle'] ?? '',
          title: extractedData['title'] ?? '',
          description: extractedData['description'] ?? '',
          price: extractedData['price'] ?? 0,
          isFavorite: false,
          imageUrl: extractedData['imageUrl'] ?? '',
        );
        loadedProducts.add(product);
      }

      _products = loadedProducts;

      notifyListeners();
    } catch (error) {
      // Handle error fetching products from Firebase
      print('Error fetching products: $error');
    }
  }

  void toggleFavoriteStatus(String productId) {
    final productIndex =
        _products.indexWhere((product) => product.id == productId);
    if (productIndex >= 0) {
      _products[productIndex].isFavorite = !_products[productIndex].isFavorite;
      notifyListeners();
    }
  }
}

class ItemsProvider extends ChangeNotifier {
  String _selectedCategory = '';
  // List<Item> _items = [];
  List<Product> _products = [];
  List<String> _categories = [];
  List<Product> get products {
    return [..._products];
  }

  String get selectedCategory => _selectedCategory;

  void set selectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Future<void> fetchProducts(String selectedCategory) async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('category', isEqualTo: selectedCategory)
          .get();
      final List<Product> loadedProducts = [];
      for (var element in snapshot.docs) {
        final extractedData = element.data() as Map<dynamic, dynamic>;
        final product = Product(
          id: extractedData['id'] ?? '',
          category: extractedData['category'] ?? '',
          subtitle: extractedData['subtitle'] ?? '',
          title: extractedData['title'] ?? '',
          description: extractedData['description'] ?? '',
          price: extractedData['price'] ?? 0,
          isFavorite: false,
          imageUrl: extractedData['imageUrl'] ?? '',
        );
        loadedProducts.add(product);
      }

      _products = loadedProducts;

      notifyListeners();
    } catch (error) {
      // Handle error fetching products from Firebase
      print('Error fetching products: $error');
    }
  }
}

class FilterProductProvider with ChangeNotifier {
  List<Product> _products = [];
  String _searchQuery = '';
  String _selectedCategory = '';

  List<Product> get products => _products;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;

  List<String> categories = ['AC', 'Washing Machine', 'Geyser'];

  void setSearchQuery(String query) {
    _searchQuery = query;
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
  }

  Future<void> fetchFilteredProducts() async {
    final collectionRef = FirebaseFirestore.instance.collection('products');

    QuerySnapshot querySnapshot;

    if (_selectedCategory.isNotEmpty && searchQuery.isNotEmpty) {
      querySnapshot = await collectionRef
          .where('category', isEqualTo: _selectedCategory)
          .where('title', isEqualTo: _searchQuery)
          .get();
    } else if (_selectedCategory.isNotEmpty) {
      querySnapshot = await collectionRef
          .where('category', isEqualTo: _selectedCategory)
          .get();
    } else if (_searchQuery.isNotEmpty) {
      querySnapshot =
          await collectionRef.where('title', isEqualTo: _searchQuery).get();
    } else {
      // No filters applied, fetch all products
      querySnapshot = await collectionRef.get();
    }
    final List<Product> loadedProducts = [];
    for (var element in querySnapshot.docs) {
      final extractedData = element.data() as Map<dynamic, dynamic>;
      final product = Product(
        id: extractedData['id'] ?? '',
        category: extractedData['category'] ?? '',
        subtitle: extractedData['subtitle'] ?? '',
        title: extractedData['title'] ?? '',
        description: extractedData['description'] ?? '',
        price: extractedData['price'] ?? 0,
        isFavorite: false,
        imageUrl: extractedData['imageUrl'] ?? '',
      );
      loadedProducts.add(product);
    }
    _products = loadedProducts;
  }

  notifyListeners();
}

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems {
    return [..._cartItems];
  }

  int get itemCount {
    return _cartItems.length;
  }

  int get totalAmount {
    int total = 0;
    _cartItems.forEach((cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    final existingCartItemIndex =
        _cartItems.indexWhere((item) => item.id == product.id);
    if (existingCartItemIndex >= 0) {
      _cartItems[existingCartItemIndex].quantity++;
    } else {
      _cartItems.add(CartItem(
        // products: products,
        category: product.category,
        description: product.description,
        subtitle: product.subtitle,
        imageUrl: product.imageUrl,
        id: product.id,
        title: product.title,
        price: product.price,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _cartItems.removeWhere((item) => item.id == productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

class OrderProvider with ChangeNotifier {
  List<CartItem> _orders = [];

  List<CartItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartItems) {
    _orders.insertAll(0, cartItems);

    notifyListeners();
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyAp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Product App',
//       home: ProductScreen(),
//     );
//   }
// }

// class ProductScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final productsProvider =
//         Provider.of<ProductProvider>(context, listen: false);
//     final cartProvider = Provider.of<CartProvider>(context, listen: false);
//     productsProvider.fetchProducts();
//     final products = productsProvider.products;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Screen'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => CartsScreen(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (ctx, index) {
//           final product = products[index];
//           return ListTile(
//             leading: Image.network(product.imageUrl),
//             title: Text(product.title),
//             subtitle: Text(product.subtitle),
//             trailing: IconButton(
//               icon: Icon(
//                 product.isFavorite ? Icons.favorite : Icons.favorite_border,
//               ),
//               onPressed: () {
//                 productsProvider.toggleFavoriteStatus(product.id);
//               },
//             ),
//             onTap: () {
//               cartProvider.addItem(product);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text('Added item to cart'),
//                   duration: Duration(seconds: 1),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class CartsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);
//     final ordersProvider = Provider.of<OrderProvider>(context);
//     final cartItems = cartProvider.cartItems;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cartItems.length,
//               itemBuilder: (ctx, index) {
//                 final cartItem = cartItems[index];
//                 return ListTile(
//                   leading: CircleAvatar(
//                     child: Text(cartItem.quantity.toString()),
//                   ),
//                   title: Text(cartItem.title),
//                   subtitle: Text('Price: \$${cartItem.price}'),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {
//                       cartProvider.removeItem(cartItem.id);
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total Amount:',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 16),
//           ElevatedButton(
//             child: Text('Place Order'),
//             onPressed: () {
//               ordersProvider.addOrder(cartItems);
//               cartProvider.clearCart();
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text('Order placed successfully'),
//                   duration: Duration(seconds: 2),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
