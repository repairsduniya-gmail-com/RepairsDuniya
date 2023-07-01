import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/pop_Up_Screen/Describe_Screen.dart';
import 'package:repair_duniya/pop_Up_Screen/urgent_normal.dart';

import '../../Model_Screens/Home_Screen/serviceName.dart';
import '../../icon_Screen.dart/screen_widgets.dart';

class ButtonList extends StatefulWidget {
  @override
  State<ButtonList> createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList>
    with SingleTickerProviderStateMixin {
  List<String> buttonTexts = [
    'Fully automatic(Top-Load)',
    'Fully automatic(Front-Load)',
    'Semi-automatic'
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serviceProvider =
        Provider.of<serviceIdprovider>(context, listen: false);
    return Container(
      height: 500.h,
      child: Column(children: [
        // Padding(
        //   padding: const EdgeInsets.all(0.0),
        //   child: Container(
        //     height: 0,
        //     width: 50,
        //     decoration: BoxDecoration(
        //       color: Colors.grey.shade300,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //   ),
        // ),
        // const Padding(
        //   padding: EdgeInsets.symmetric(vertical: 10),
        //   child: Center(
        //     child: Text(
        //       "Select Service",
        //       style: TextStyle(
        //         fontSize: 30,
        //         fontWeight: FontWeight.w500,
        //       ),
        //     ),
        //   ),
        // ),
        TabBar(
          labelColor: Color.fromARGB(255, 2, 48, 86),
          controller: _tabController,
          tabs: [
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Automatic (Top Load)',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Automatic (Front Load)',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Semi-Automatic',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),

        Expanded(
          child: TabBarView(controller: _tabController, children: [
            ModalBotoomSheet(
                name: 'Fully automatic(Top-Load)',
                values: [
                  'No Power',
                  'Noise issues',
                  'Not Washing/spinning',
                  'water Leakage',
                  'Error on Display',
                  'Installation',
                  'Uninstallation',
                  'Replacement',
                  'Other issues(Remove & Install)'
                ],
                url1:
                    'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
                url2: 'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
                url3:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Godrej_Logo.svg/1280px-Godrej_Logo.svg.png',
                url4:
                    'https://1000logos.net/wp-content/uploads/2017/12/Whirlpool-logo-768x432.png'),
            ModalBotoomSheet(
                name: 'Fully automatic(Top-Load)',
                values: [
                  'No Power',
                  'Noise issues',
                  'Not Washing/spinning',
                  'water Leakage',
                  'Error on Display',
                  'Installation',
                  'Uninstallation',
                  'Replacement',
                  'Other issues(Remove & Install)'
                ],
                url1:
                    'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
                url2: 'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
                url3:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Godrej_Logo.svg/1280px-Godrej_Logo.svg.png',
                url4:
                    'https://1000logos.net/wp-content/uploads/2017/12/Whirlpool-logo-768x432.png'),
            ModalBotoomSheet(
                name: 'semi automatic',
                values: [
                  'No Powering ON',
                  'Wash tub not working',
                  'Noise issues',
                  'Spin Tub not working',
                  'Not Draining',
                  'water Leakage',
                  'Other issues(Remove & Install)'
                ],
                url1:
                    'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
                url2: 'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
                url3:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Godrej_Logo.svg/1280px-Godrej_Logo.svg.png',
                url4:
                    'https://1000logos.net/wp-content/uploads/2017/12/Whirlpool-logo-768x432.png')
          ]),
        ),
        // Container(
        //   height: 200,
        //   child: ListView(children: [
        //     ListTile(
        //         title: Text('Fully automatic(Top-Load)'),
        //         trailing: Icon(Icons.arrow_forward),
        //         onTap: () {
        //           serviceProvider.setSelectedService('Fully automatic(Top-Load)');
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => Icons_widget(
        //                     "screen_assets/wash1.jpeg",
        //                     "screen_assets/wash2.jpeg",
        //                     'Fully automatic(Top-Load)',
        //                     [
        //                       'No Power',
        //                       'Noise issues',
        //                       'Not Washing/spinning',
        //                       'water Leakage',
        //                       'Error on Display',
        //                       'Installation',
        //                       'Uninstallation',
        //                       'Replacement',
        //                       'Other issues(Remove & Install)'
        //                     ],
        //                     'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
        //                     'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
        //                     'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Godrej_Logo.svg/1280px-Godrej_Logo.svg.png',
        //                     'https://1000logos.net/wp-content/uploads/2017/12/Whirlpool-logo-768x432.png')),
        //           );
        //         }),
        //     ListTile(
        //         title: Text('Fully automatic(Front-Load)'),
        //         trailing: Icon(Icons.arrow_forward),
        //         onTap: () {
        //           serviceProvider
        //               .setSelectedService('Fully automatic(Front-Load)');
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => Icons_widget(
        //                   "screen_assets/wash1.jpeg",
        //                   "screen_assets/wash2.jpeg",
        //                   'Fully automatic(Front-Load)',
        //                   [
        //                     'No Power',
        //                     'Noise issues',
        //                     'Not Washing/spinning',
        //                     'water Leakage',
        //                     'Error on Display',
        //                     'Installation',
        //                     'Uninstallation',
        //                     'Replacement',
        //                     'Other issues(Remove & Install)'
        //                   ],
        //                   'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
        //                   'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
        //                   'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Godrej_Logo.svg/1280px-Godrej_Logo.svg.png',
        //                   'https://1000logos.net/wp-content/uploads/2017/12/Whirlpool-logo-768x432.png'),
        //             ),
        //           );
        //         }),
        //     ListTile(
        //         title: Text('Semi automatic'),
        //         trailing: Icon(Icons.arrow_forward),
        //         onTap: () {
        //           serviceProvider.setSelectedService('Semi automatic');
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => Icons_widget(
        //                     "screen_assets/wash1.jpeg",
        //                     "screen_assets/wash2.jpeg",
        //                     'Semi automatic',
        //                     [
        //                       'No Powering ON',
        //                       'Wash tub not working',
        //                       'Noise issues',
        //                       'Spin Tub not working',
        //                       'Not Draining',
        //                       'water Leakage',
        //                       'Other issues(Remove & Install)'
        //                     ],
        //                     'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
        //                     'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
        //                     'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Godrej_Logo.svg/1280px-Godrej_Logo.svg.png',
        //                     'https://1000logos.net/wp-content/uploads/2017/12/Whirlpool-logo-768x432.png')),
        //           );
        //         })
        //   ]),
        // )
      ]),
    );
  }
}
