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

// class Product with ChangeNotifier {
//   final String id;
//   final String category;
//   final String subtitle;
//   final String title;
//   final String description;
//   final double price;
//   final bool isFavorite;
//   final String imageUrl;

//   Product({
//     required this.id,
//     required this.category,
//     required this.subtitle,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.isFavorite,
//     required this.imageUrl,
//   });
// }

class ProductCardScreen extends StatefulWidget {
  @override
  _ProductCardScreenState createState() => _ProductCardScreenState();
}

class _ProductCardScreenState extends State<ProductCardScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: true);
    final provider = Provider.of<ItemsProvider>(context);

    productProvider.fetchProducts();
    final products = productProvider.products;
    // final favorite = Provider.of<FavoriteItemsProvider>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:
                (MediaQuery.of(context).size.width - 30 - 35) / (2 * 290),
            mainAxisSpacing: 35,
            crossAxisSpacing: 5),
        itemCount: products.length,
        itemBuilder: (_, i) {
          final product = products[i];

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
                                builder: (context) => product_screen(product),
                                settings: RouteSettings(arguments: product.id),
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
        });
  }
}
