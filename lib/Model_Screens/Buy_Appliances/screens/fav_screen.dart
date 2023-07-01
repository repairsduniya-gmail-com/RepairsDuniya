// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../providers/all_providers.dart';

// class FavoritesProvider extends ChangeNotifier {
//   List<Product> _favorites = [];
//   late SharedPreferences _preferences;

//   List<Product> get favorites => _favorites;

//   FavoritesProvider() {
//     initializePreferences();
//   }

//   void initializePreferences() async {
//     _preferences = await SharedPreferences.getInstance();
//     // Load favorite products from shared preferences
//     List<String>? favoriteProductNames =
//         _preferences.getStringList('favoriteProducts');
//     if (favoriteProductNames != null) {
//       _favorites = favoriteProductNames
//           .map((product) =>
//               Product(title: product, isFavorite: true,category: ,))
//           .toList();
//     }
//     notifyListeners();
//   }

//   void addFavorite(Product product) async {
//     _favorites.add(product);
//     await saveFavoritesToPreferences();
//     notifyListeners();
//   }

//   void removeFavorite(Product product) async {
//     _favorites.remove(product);
//     await saveFavoritesToPreferences();
//     notifyListeners();
//   }

//   Future<void> saveFavoritesToPreferences() async {
//     List<String> favoriteProductNames =
//         _favorites.map((product) => product.name).toList();
//     await _preferences.setStringList('favoriteProducts', favoriteProductNames);
//   }
// }
// class FavoritesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final favoritesProvider = Provider.of<FavoritesProvider>(context);
//     final favorites = favoritesProvider.favorites;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorites'),
//       ),
//       body: ListView.builder(
//         itemCount: favorites.length,
//         itemBuilder: (context, index) {
//           final favoriteProduct = favorites[index];
//           return ListTile(
//             title: Text(favoriteProduct.name),
//             trailing: IconButton(
//               icon: Icon(Icons.favorite),
//               onPressed: () {
//                 favoritesProvider.removeFavorite(favoriteProduct);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
