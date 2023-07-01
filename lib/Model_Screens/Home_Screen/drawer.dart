import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/Draw_components/InvoiceView.dart';
import 'package:repair_duniya/Draw_components/RewardsView.dart';
import 'package:repair_duniya/Draw_components/BookingsView.dart';
import 'package:repair_duniya/Model_Screens/Buy_Appliances/screens/buy_appliances.dart';
import 'package:repair_duniya/Model_Screens/Help_Support/support.dart';
import 'package:repair_duniya/Model_Screens/Home_Screen/services/all_services.dart';
import 'package:repair_duniya/Model_Screens/Home_boarding_Screen/home_board.dart';
import 'package:repair_duniya/Model_Screens/Home_boarding_Screen/phoneNumberProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home_boarding_Screen/auth.dart';
import '../Home_boarding_Screen/user.dart';

// function to trigger app build
class Mydrawer extends StatelessWidget {
  // const Mydrawer({super.key});

  Mydrawer();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context, listen: false);
    final authPovider = Provider.of<AuthProvider>(context, listen: false);
    final userdataProvider =
        Provider.of<UserDataProvider>(context, listen: false);
    final phoneProvider = Provider.of<PhoneProvider>(context, listen: false);
    final phoneNumber = phoneProvider.getphoneNumber;
    final userId = userProvider.userId;

//     if (userId != null) {
//       userdataProvider.fetchUserDetails();
//       if (userdataProvider.userData != null) {
//         String email = userdataProvider.userData!.email;
//         String username = userdataProvider.userData!.username ?? '';
//         String firstCharacter =
//             username.isNotEmpty ? username.substring(0, 1) : '';
//         // Use the retrieved data as needed
//       } else {
//         // User data is null
//       }
//     } else {
//       // User ID is null
//     }
//     return FutureBuilder<User?>(
//       future: userdataProvider.getUserByPhoneNumber(
//           phoneNumber), // Assuming getUserData() returns a Future<User>
//       builder: (context, snapshot) {
//         // if (snapshot.connectionState == ConnectionState.waiting) {
//         //   // While data is being fetched, show a loading indicator
//         //   return CircularProgressIndicator();
//         // } else if (snapshot.hasError) {
//         //   // If an error occurred while fetching data, show an error message
//         //   return Text('Error: ${snapshot.error}');
//         if (snapshot.hasData) {
//           // If data retrieval was successful, display the user data
//           final User user = snapshot.data!;
//           return Drawer(
//             child: Stack(
//               children: [
//                 ListView(
//                   padding: const EdgeInsets.all(0),
//                   children: [
//                     DrawerHeader(
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(15),
//                               bottomRight: Radius.circular(15))
//                           // color: Color.fromARGB(255, 15, 30, 41),
//                           ), //BoxDecoration
//                       child: Consumer<UserDataProvider>(
//                           builder: (context, userProvider, _) {
//                         // String email = userProvider.userData!.email;
//                         // String userName = userProvider.userData!.username;
//                         // String firstCharacter =
//                         //     userName.isNotEmpty ? userName.substring(0, 1) : '';
//                         String firstCharacter = user.username.isNotEmpty
//                             ? user.username.substring(0, 1)
//                             : '';
//                         return UserAccountsDrawerHeader(
//                           decoration: BoxDecoration(color: null),
//                           accountName: Text(
//                             user.username,
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           accountEmail: Text(
//                             user.email,
//                           ),
//                           currentAccountPictureSize: Size.square(50),
//                           currentAccountPicture: CircleAvatar(
//                             backgroundColor: Colors.white,
//                             child: Text(
//                               firstCharacter,
//                               style:
//                                   TextStyle(fontSize: 30.0, color: Colors.blue),
//                             ), //Text
//                           ), //circleAvatar
//                         );
//                       }), //UserAccountDrawerHeader
//                     ),
//                     Column(
//                       children: [
//                         ListTile(
//                           leading: const Icon(
//                             Icons.home,
//                             color: Colors.black,
//                           ),
//                           title: const Text('Home'),
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                         ListTile(
//                           leading: const Icon(
//                             Icons.hexagon,
//                             color: Colors.black,
//                           ),
//                           title: const Text('All Services '),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => allServices(),
//                               ),
//                             );
//                           },
//                         ),
//                         ListTile(
//                           leading: const Icon(
//                             Icons.watch_later,
//                             color: Colors.black,
//                           ),
//                           title: const Text('My Booking '),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const BookingsView()),
//                             );
//                           },
//                         ),
//                         ListTile(
//                             leading: const Icon(
//                               Icons.card_giftcard,
//                               color: Colors.black,
//                             ),
//                             title: const Text('Rewards'),
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const RewardsView()),
//                               );
//                             }),
//                         ListTile(
//                           leading: const Icon(
//                             Icons.shopping_basket,
//                             color: Colors.black,
//                           ),
//                           title: const Text('Buy New Appliances'),
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                         ListTile(
//                           leading: const Icon(
//                             Icons.receipt_long,
//                             color: Colors.black,
//                           ),
//                           title: const Text('Generate Invoice'),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const InvoiceView()),
//                             );
//                           },
//                         ),
//                         ListTile(
//                           leading: const Icon(
//                             Icons.message,
//                             color: Colors.black,
//                           ),
//                           title: const Text('Help & Support'),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const Support()),
//                             );
//                           },
//                         ),
//                         ListTile(
//                           leading: const Icon(
//                             Icons.logout,
//                             color: Colors.black,
//                           ),
//                           title: const Text('LogOut'),
//                           onTap: () {
//                             AlertDialog(
//                               title: Text('Logout'),
//                               content: Text('Are you sure you want to logout?'),
//                               actions: [
//                                 TextButton(
//                                   child: Text('Cancel'),
//                                   onPressed: () {
//                                     Navigator.of(context)
//                                         .pop(); // Close the dialog
//                                   },
//                                 ),
//                                 TextButton(
//                                   child: Text('Logout'),
//                                   onPressed: () {
//                                     logout();

//                                     Navigator.of(context)
//                                         .pop(); // Close the dialog
//                                     // Navigate to login screen or any other desired destination
//                                   },
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 Positioned(
//                   left: 260,
//                   top: 20,
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//                 Positioned(
//                   left: 130,
//                   top: 115,
//                   right: 10,
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.edit,
//                       color: Colors.white,
//                       size: 20,
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           // Default case: No error, no data, assume data is not available
//           return Text('No user data found.');
//         }
//       },
//     );
//   }

//   Future<void> logout() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('authToken');
//     // Perform any additional logout logic here
//   }
// }
    return Drawer(
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))
                    // color: Color.fromARGB(255, 15, 30, 41),
                    ), //BoxDecoration
                child: Consumer<UserDataProvider>(
                    builder: (context, userProvider, _) {
                  // String email = userProvider.userData!.email;
                  // String userName = userProvider.userData!.username;
                  // String firstCharacter =
                  //     userName.isNotEmpty ? userName.substring(0, 1) : '';
                  return UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: null),
                    accountName: Text("divya"
                        // userdataProvider.userData!.username,
                        // style: TextStyle(fontSize: 18),
                        ),
                    accountEmail: Text("d@gmail.com"
                        // userdataProvider.userData!.username,
                        ),
                    currentAccountPictureSize: Size.square(50),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        "D",
                        style: TextStyle(fontSize: 30.0, color: Colors.blue),
                      ), //Text
                    ), //circleAvatar
                  );
                }), //UserAccountDrawerHeader
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Buy_appliances()),
                      );
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
                      AlertDialog(
                        title: Text('Logout'),
                        content: Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                          TextButton(
                            child: Text('Logout'),
                            onPressed: () {
                              logout();

                              Navigator.of(context).pop(); // Close the dialog
                              // Navigate to login screen or any other desired destination
                            },
                          ),
                        ],
                      );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home_board()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
