import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repair_duniya/icon_Screen.dart/screen_widgets.dart';

import '../homeIconButton.dart';

class allServices extends StatefulWidget {
  const allServices({super.key});

  @override
  State<allServices> createState() => _allServicesState();
}

class _allServicesState extends State<allServices> {
  Widget homeIconText(String text) {
    return Text(text,
        textAlign: TextAlign.center,
        textScaleFactor: 1.1,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ));
  }

  Widget listtile(String Name, String img, img1, img2) {
    return Column(
      children: [
        Material(
          type: MaterialType.transparency,
          child: Ink(
            height: 60.w,
            width: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              // border: Border.all(width: 1, color: Colors.grey),
              color: Colors.white,
              image: DecorationImage(
                image: ExactAssetImage(img),
                fit: BoxFit.scaleDown,
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Icons_widget(img1, img2, Name)),
                );
              },
            ),
          ),
        ),
        Column(
          children: [
            homeIconText(
              Name,
            ),
          ],
        ),
      ],
    );
  }

  Widget listtile2(String Name, String img, img1, img2) {
    return Stack(
      children: [
        Column(
          children: [
            Material(
              type: MaterialType.transparency,
              child: Ink(
                height: 60.w,
                width: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  // border: Border.all(width: 1, color: Colors.grey),
                  color: Colors.white,
                  image: DecorationImage(
                    image: ExactAssetImage(img),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => Icons_widget(img1, img2, Name)),
                    // );
                  },
                ),
              ),
            ),
            Column(
              children: [
                homeIconText(
                  Name,
                ),
              ],
            ),
          ],
        ),
        Positioned(
          height: 35.w,
          top: 0,
          right: 0,
          child: Image.asset('screen_assets/coming_soon.png'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Services"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              children: [
                AC(context),
                Refrigerator(context),
                Geyser(context),
                Washer(context),
                Television(context),
                Fan(context),
                Aircooler(context),
                Oven(context),
                cctv(context),
                Salon(context),
                // listtile(
                //     'AC',
                //     'assets/air-conditioner.png',
                //     "screen_assets/ac-service-mistribabu.png",
                //     "screen_assets/ac1.jpeg"),
                // listtile(
                //   'Refrigerator',
                //   'assets/refrigerator.png',
                //   "screen_assets/repair-work-fridge-appliance-.jpg",
                //   "screen_assets/fridge1.jpg",
                // ),
                // listtile(
                //   'Geyser',
                //   'screen_assets/geyser.png',
                //   "screen_assets/oven1.jpeg",
                //   "screen_assets/oven2.jpg",
                // ),
                // listtile(
                //   'Washing Machine',
                //   'assets/washing-machine.png',
                //   "screen_assets/oven1.jpeg",
                //   "screen_assets/oven2.jpg",
                // ),
                // listtile(
                //   'Television',
                //   'assets/tv.png',
                //   "screen_assets/tv2.jpg",
                //   "screen_assets/tv3.jpg",
                // ),
                // listtile('Fan', 'assets/Fan.png', "screen_assets/fan1.jpg",
                //     "screen_assets/fan2.jpg"),
                // listtile(
                //   'Air Cooler',
                //   'screen_assets/aircooler.png',
                //   "screen_assets/tv2.jpg",
                //   "screen_assets/tv3.jpg",
                // ),
                // listtile(
                //   'Microwave Oven',
                //   'assets/oven.png',
                //   "screen_assets/oven1.jpeg",
                //   "screen_assets/oven2.jpg",
                // ),
                // listtile(
                //   'CCTV',
                //   'screen_assets/cctv.png',
                //   "screen_assets/tv2.jpg",
                //   "screen_assets/tv3.jpg",
                // ),
                // listtile(
                //   'Unisex Salon & Spa',
                //   'assets/salon.png',
                //   "screen_assets/tv2.jpg",
                //   "screen_assets/tv3.jpg",
                // ),
                listtile(
                  'Electrician',
                  'screen_assets/electrician.png',
                  "screen_assets/tv2.jpg",
                  "screen_assets/tv3.jpg",
                ),
                listtile(
                  'Plumber',
                  'screen_assets/plumber.png',
                  "screen_assets/tv2.jpg",
                  "screen_assets/tv3.jpg",
                ),
                listtile(
                  'Painting',
                  'assets/paint.png',
                  "screen_assets/tv2.jpg",
                  "screen_assets/tv3.jpg",
                ),
                listtile2(
                  'Cleaning',
                  'assets/cleaning.png',
                  "screen_assets/tv2.jpg",
                  "screen_assets/tv3.jpg",
                ),
                listtile2(
                  'Motorbike Repair/Service',
                  'assets/motorbike.png',
                  "screen_assets/tv2.jpg",
                  "screen_assets/tv3.jpg",
                ),
                listtile2(
                  'Car Repair/Service',
                  'screen_assets/car.png',
                  "screen_assets/tv2.jpg",
                  "screen_assets/tv3.jpg",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}