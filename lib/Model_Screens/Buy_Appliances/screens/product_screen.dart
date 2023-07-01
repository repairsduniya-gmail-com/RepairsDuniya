import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/Model_Screens/Buy_Appliances/widgets/customBottomSheet.dart';
import 'package:repair_duniya/Model_Screens/Buy_Appliances/providers/all_providers.dart';
import '../providers/all_providers.dart';
import 'cart_screen.dart';
// import '../providers/products.dart';

class product_screen extends StatelessWidget {
  final Product product;

  product_screen(this.product);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProductProvider = Provider.of<ProductProvider>(
      context,
      listen: false,
    );
    loadedProductProvider.fetchProducts();
    final loadedProduct = loadedProductProvider.products;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFFFD725A),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "WISHLIST",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      color: Colors.white.withOpacity(0.8)),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  cartProvider.addItem(product);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFFFD725A),
                  ),
                ),
                child: Text(
                  "ADD TO CART",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      color: Colors.white.withOpacity(0.8)),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(actions: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(30)),
            child: Icon(
              Icons.shopping_cart,
              size: 22,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(30)),
            child: IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                loadedProductProvider.toggleFavoriteStatus(product.id);
              },
            ),
          ),
        )
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height / 1.7,
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 224, 224, 224),
                // image: Image.network(product.imageUrl,),
                image: DecorationImage(
                  image: NetworkImage(
                    product.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              // overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              product.subtitle,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Rs.${product.price.toString()}/-",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.withOpacity(0.7)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RatingBar.builder(
                    unratedColor: Color.fromARGB(255, 223, 221, 221),
                    itemSize: 28,
                    initialRating: 4.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4),
                    onRatingUpdate: (rating) {},
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    product.description,
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     InkWell(
                  //       onTap: () {},
                  //       child: Container(
                  //         padding: EdgeInsets.all(18),
                  //         decoration: BoxDecoration(
                  //             color: Color(0xFFF7F8FA),
                  //             borderRadius: BorderRadius.circular(30)),
                  //         child: Icon(
                  //           CupertinoIcons.cart_fill,
                  //           size: 22,
                  //           color: Color(0xFFFD725A),
                  //         ),
                  //       ),
                  //     ),
                  // InkWell(
                  //     onTap: () {
                  //       showModalBottomSheet(
                  //           backgroundColor: Colors.transparent,
                  //           context: context,
                  //           builder: (context) {
                  //             return custom_Bottom_Sheet();
                  //           });
                  //     },
                  //     child: ElevatedButton(
                  //       onPressed: () {
                  //         cartProvider.addItem(product);
                  //       },
                  //       style: ButtonStyle(backgroundColor: null),
                  //       child: Container(
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: 50, vertical: 18),
                  //         decoration: BoxDecoration(
                  //             color: Color(0xFFFD725A),
                  //             borderRadius: BorderRadius.circular(30)),
                  //         child: Text(
                  //           "ADD TO CART",
                  //           style: TextStyle(
                  //               fontSize: 17,
                  //               fontWeight: FontWeight.w600,
                  //               letterSpacing: 1,
                  //               color: Colors.white.withOpacity(0.8)),
                  //         ),
                  //       ),
                  //     )),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
