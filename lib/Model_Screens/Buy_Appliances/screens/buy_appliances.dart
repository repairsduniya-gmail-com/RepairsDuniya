import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/Model_Screens/Buy_Appliances/providers/all_providers.dart';
// import 'package:repair_duniya/Model_Screens/Buy_Appliances/providers/cart.dart';
// import 'package:repair_duniya/Model_Screens/Buy_Appliances/providers/item.dart';
import 'package:repair_duniya/Model_Screens/Buy_Appliances/screens/cart_screen.dart';
import 'package:repair_duniya/Model_Screens/Buy_Appliances/screens/searchbar.dart';
// import 'package:repair_duniya/Model_Screens/Buy_Appliances/widgets/filteredproduct.dart';
import '../widgets/product_card.dart';
// import './providers/products.dart';
import '../widgets/category_item.dart';

enum FilterOptions {
  Favorites,
  All,
}

class Category {
  final String id;
  final String title;
  // final Color color;

  const Category({
    required this.id,
    required this.title,
    // this.color = Colors.orange,
  });
}

class Buy_appliances extends StatefulWidget {
  Buy_appliances({super.key});

  @override
  State<Buy_appliances> createState() => _Buy_appliancesState();
}

class _Buy_appliancesState extends State<Buy_appliances> {
  String dropdownValue = ' Filter';
  bool isExpanded = false;
  List CatList = ["All", "Best Selling", "Offers"];

  List imgList = [
    "Geyser_Buy",
    "geyser_havells(3L)",
    "Washing_Buy",
    "Ac_Buy",
    "Geyser_Buy"
  ];

  List titleList = [
    "Geyser",
    "Washing Machine",
    "Air Conditioner",
  ];

  List subList = [
    "Havells(3L)",
    "Bajaj Splendora(3L)",
    "LG 7Kg 5star",
    "Voltas 1.5 Ton 3star AC",
    "Havells(3L)"
  ];
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  static const DUMMY_CATEGORIES = const [
    Category(
      id: 'washing machine',
      title: 'Washing Machine',
    ),
    Category(
      id: 'ac',
      title: 'Air Conditioner',
    ),
    Category(
      id: 'Geyser',
      title: 'Geyser',
    ),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context);
    // final products = productsData.items;
    final provider = Provider.of<ItemsProvider>(context);

    ScreenUtil.init(context);
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
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 300.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: SearchScreen(),
                  // child: TextFormField(
                  //   decoration: const InputDecoration(
                  //       label: Text("Find your appliances"),
                  //       border: InputBorder.none,
                  //       prefixIcon: Icon(
                  //         Icons.search,
                  //         size: 30,
                  //         color: Colors.grey,
                  //       )),
                  // ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/Offer-1.jpg",
                      width: MediaQuery.of(context).size.width / 1.2,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      // scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Row(
                            children: [
                              for (int i = 0; i < CatList.length; i++)
                                Container(
                                  margin: const EdgeInsets.all(4),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: CatList[i] == "All"
                                          ? const Color(0xFFFD725A)
                                          : const Color.fromARGB(
                                              255, 224, 225, 227),
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Text(
                                    CatList[i],
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: CatList[i] == "All"
                                          ? const Color.fromARGB(
                                              255, 244, 241, 241)
                                          : Colors.grey.shade500,
                                    ),
                                  ),
                                ),
                              // Container(
                              //   height: 35,
                              //   decoration: BoxDecoration(
                              //     color: Color.fromARGB(255, 224, 225, 227),
                              //     borderRadius: BorderRadius.circular(18),
                              //   ),
                              //   child: DropdownButton<String>(
                              //     value: dropdownValue,
                              //     items: <String>[
                              //       ' Filter',
                              //       ' Brand',
                              //       ' Appliances'
                              //     ].map<DropdownMenuItem<String>>(
                              //         (String value) {
                              //       return DropdownMenuItem<String>(
                              //         value: value,
                              //         child: Text(
                              //           value,
                              //           style: TextStyle(
                              //             fontSize: 16.sp,
                              //             color: Colors.grey.shade500,
                              //           ),
                              //         ),
                              //       );
                              //     }).toList(),
                              //     onChanged: (String? newValue) {
                              //       setState(() {
                              //         dropdownValue = newValue!;
                              //       });
                              //     },
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ]),
                ),
                // Container(
                //   height: 180,
                //   // width: MediaQuery.of(context).size.width,
                //   child: GridView(
                //     physics: NeverScrollableScrollPhysics(),
                //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //       maxCrossAxisExtent: 200,
                //       //height and width ratio of a child
                //       childAspectRatio: 3 / 1.2,
                //       crossAxisSpacing: 10,
                //       mainAxisSpacing: 10,
                //     ), // shrinkWrap: true,
                //     children: DUMMY_CATEGORIES
                //         .map(
                //           (catData) => CategoryItem(catData.id, catData.title),
                //         )
                //         .toList(),
                //     // physics: NeverScrollableScrollPhysics(),
                //     // scrollDirection: Axis.horizontal,
                //     // itemCount: provider.categories.length,
                //     // itemBuilder: (context, index) {
                //     // final category = provider.categories[index];
                //     // return ListTile(
                //     //   title: Text(category),
                //     //   onTap: () {
                //     //     provider.selectedCategory = category;
                //     //     Navigator.push(
                //     //       context,
                //     //       MaterialPageRoute(
                //     //         builder: (context) => filterProductScreen(category),
                //     //       ),
                //     //     );
                //     //   },
                //   ),
                // ),
                //   ),
                // ),
                ProductCardScreen()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
