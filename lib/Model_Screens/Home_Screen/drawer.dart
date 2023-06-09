import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/Draw_components/InvoiceView.dart';
import 'package:repair_duniya/Draw_components/RewardsView.dart';
import 'package:repair_duniya/Draw_components/BookingsView.dart';
import 'package:repair_duniya/Model_Screens/Help_Support/support.dart';
import 'package:repair_duniya/Model_Screens/Home_Screen/services/all_services.dart';

import '../Home_boarding_Screen/auth.dart';

// function to trigger app build
class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    // String? phoneNumber = userProvider.phoneNumber;
    // String? userName = userProvider.username;

    return Drawer(
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))
                    // color: Color.fromARGB(255, 15, 30, 41),
                    ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: null),
                  accountName: Text(
                    "Ajay Yadav",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("ay3404869@gmail.com"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 30.0, color: Colors.blue),
                    ), //Text
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.hexagon,
                      color: Colors.black,
                    ),
                    title: const Text('All Services '),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => allServices(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.watch_later,
                      color: Colors.black,
                    ),
                    title: const Text('My Booking '),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookingsView()),
                      );
                    },
                  ),
                  ListTile(
                      leading: const Icon(
                        Icons.card_giftcard,
                        color: Colors.black,
                      ),
                      title: const Text('Rewards'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RewardsView()),
                        );
                      }),
                  ListTile(
                    leading: const Icon(
                      Icons.shopping_basket,
                      color: Colors.black,
                    ),
                    title: const Text('Buy New Appliances'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.receipt_long,
                      color: Colors.black,
                    ),
                    title: const Text('Generate Invoice'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InvoiceView()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.message,
                      color: Colors.black,
                    ),
                    title: const Text('Help & Support'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Support()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    title: const Text('LogOut'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
          Positioned(
            left: 260,
            top: 20,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            left: 130,
            top: 115,
            right: 10,
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
