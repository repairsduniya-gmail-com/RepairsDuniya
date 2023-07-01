import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/Model_Screens/Buy_Appliances/providers/all_providers.dart';
import 'package:repair_duniya/Model_Screens/Buy_Appliances/providers/item.dart';
import 'package:repair_duniya/Model_Screens/Buy_Appliances/providers/products.dart';
import 'package:repair_duniya/Model_Screens/Buy_Appliances/screens/product_screen.dart';

// import '../providers/cart.dart';
// import '../providers/product.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class filterProductScreen extends StatefulWidget {
  // String category;
  // filterProductScreen(this.category);
  @override
  _filterProductScreenState createState() => _filterProductScreenState();
}

var _showOnlyFavorites = false;

class _filterProductScreenState extends State<filterProductScreen> {
  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // final categoryTitle = routeArgs['title'];
    // final categoryId = routeArgs['id'];

    final productProvider = Provider.of<ProductProvider>(context, listen: true);
    final provider = Provider.of<FilterProductProvider>(context);
    provider.fetchFilteredProducts();
    final filteredProducts = provider.products;

    productProvider.fetchProducts();
    final products = productProvider.products;
    // final favorite = Provider.of<FavoriteItemsProvider>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // title: Text('MyShop'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // PopupMenuButton(
            //   onSelected: (FilterOptions selectedValue) {
            //     setState(() {
            //       if (selectedValue == FilterOptions.Favorites) {
            //         _showOnlyFavorites = true;
            //       } else {
            //         _showOnlyFavorites = false;
            //       }
            //     });
            //   },
            //   icon: Icon(
            //     Icons.more_vert,
            //   ),
            //   itemBuilder: (_) => [
            //     PopupMenuItem(
            //       child: Text('Only Favorites'),
            //       value: FilterOptions.Favorites,
            //     ),
            //     PopupMenuItem(
            //       child: Text('Show All'),
            //       value: FilterOptions.All,
            //     ),
            //   ],
            // ),
            Consumer<CartProvider>(
              builder: (_, cart, ch) => Badge(
                child: ch,
                label: Text(cart.itemCount.toString()),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      (MediaQuery.of(context).size.width - 30 - 35) / (2 * 290),
                  mainAxisSpacing: 35,
                  crossAxisSpacing: 5),
              itemCount: filteredProducts.length,
              itemBuilder: (_, i) {
                final product = filteredProducts[i];

                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          product_screen(product),
                                      settings:
                                          RouteSettings(arguments: product.id),
                                    ));
                              },
                              child: Image.network(
                                product.imageUrl,
                                fit: BoxFit.cover,
                                height: 230,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                height: 25,
                                width: 85,
                                color: Colors.redAccent.withOpacity(0.6),
                                child: const Center(
                                  child: Text(
                                    "30% Discount",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            ClipRRect(
                              child: Text(
                                product.subtitle,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                            ),
                            // Add more content widgets as needed
                            // Consumer<ProductProvider>(
                            //   builder: (ctx, product, _) => IconButton(
                            //     icon: Icon(
                            //       product.isFavorite
                            //           ? Icons.favorite
                            //           : Icons.favorite_border,
                            //     ),
                            //     // color: Theme.of(context).accentColor,
                            //     onPressed: () {
                            //       // favorite.toggleFavoriteStatus(product.id
                            //       // authData.token,
                            //       // authData.userId,
                            //       // );
                            //     },
                            //   ),
                            // ),
                            const SizedBox(height: 5),
                            Text(
                              "Rs.${product.price.toString()}/-",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red.withOpacity(0.7)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
