import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/Model_Screens/Home_Screen/serviceName.dart';
import 'package:repair_duniya/Model_Screens/Home_Screen/services/services.dart';
import 'package:repair_duniya/Model_Screens/Home_Screen/services/whats_broken.dart';
import 'package:repair_duniya/icon_Screen.dart/painter.dart';
import 'package:repair_duniya/icon_Screen.dart/salon.dart';
import 'package:repair_duniya/icon_Screen.dart/screen_widgets.dart';

// import 'package:Repair-Duniya/lib/icon_Screen.dart/tv.dart';
// import 'package:repair-duniya/icon_Screen.dart/tv.dart';
class homeIcon extends StatelessWidget {
  String Name, img, img1, img2;
  homeIcon(this.Name, this.img, this.img1, this.img2);

  @override
  Widget build(BuildContext context) {
    final serviceProvider =
        Provider.of<serviceIdprovider>(context, listen: false);
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
                serviceProvider.setSelectedService(Name);
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
}

Widget homeIconText(String text) {
  return Text(text,
      textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold));
}

Widget AC(BuildContext context) {
  return homeIcon('AC', 'assets/air-conditioner.png',
      "screen_assets/ac-service-mistribabu.png", "screen_assets/ac1.jpeg");
}

Widget Refrigerator(BuildContext context) {
  return homeIcon(
    'Refrigerator',
    'assets/refrigerator.png',
    "screen_assets/repair-work-fridge-appliance-.jpg",
    "screen_assets/fridge1.jpg",
  );
}

Widget Washer(BuildContext context) {
  return homeIcon(
    'Washing Machine',
    'assets/washing-machine.png',
    "screen_assets/oven1.jpeg",
    "screen_assets/oven2.jpg",
  );
}

Widget Oven(BuildContext context) {
  return homeIcon(
    'Microwave Oven',
    'assets/oven.png',
    "screen_assets/oven1.jpeg",
    "screen_assets/oven2.jpg",
  );
}

Widget Fan(BuildContext context) {
  return homeIcon('Fan', 'assets/Fan.png', "screen_assets/fan1.jpg",
      "screen_assets/fan2.jpg");
}

Widget Motercycle(BuildContext context) {
  return homeIcon(
    'Motorbike',
    'assets/motorbike.png',
    "screen_assets/tv2.jpg",
    "screen_assets/tv3.jpg",
  );
}

Widget Geyser(BuildContext context) {
  return homeIcon(
    'Geyser',
    'screen_assets/geyser.png',
    "screen_assets/oven1.jpeg",
    "screen_assets/oven2.jpg",
  );
}

Widget Aircooler(BuildContext context) {
  return homeIcon(
    'Air Cooler',
    'screen_assets/aircooler.png',
    "screen_assets/tv2.jpg",
    "screen_assets/tv3.jpg",
  );
}

Widget cctv(BuildContext context) {
  return homeIcon(
    'CCTV',
    'screen_assets/cctv.png',
    "screen_assets/tv2.jpg",
    "screen_assets/tv3.jpg",
  );
}

Widget Car(BuildContext context) {
  return homeIcon(
    'Car Repair/Service',
    'screen_assets/car.png',
    "screen_assets/tv2.jpg",
    "screen_assets/tv3.jpg",
  );
}

Widget Television(BuildContext context) {
  return homeIcon(
    'Television',
    'assets/tv.png',
    "screen_assets/tv2.jpg",
    "screen_assets/tv3.jpg",
  );
}

Widget More(BuildContext context) {
  return Column(
    children: [
      Material(
        type: MaterialType.transparency,
        child: Ink(
          height: 50.w,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            // border: Border.all(width: 1, color: Colors.grey),
            color: Colors.white,
            image: const DecorationImage(
              image: ExactAssetImage('assets/More.png'),
              fit: BoxFit.scaleDown,
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => whatBroken(),
                ),
              );
            },
          ),
        ),
      ),
      Column(
        children: [
          homeIconText('More'),
        ],
      ),
    ],
  );
}

Widget Salon(BuildContext context) {
  return homeIcon(
    'Unisex Salon & Spa',
    'assets/salon.png',
    "screen_assets/tv2.jpg",
    "screen_assets/tv3.jpg",
  );
}

Widget Painting(BuildContext context) {
  return homeIcon(
    'Painting',
    'assets/paint.png',
    "screen_assets/tv2.jpg",
    "screen_assets/tv3.jpg",
  );
}

Widget Cleaning(BuildContext context) {
  return homeIcon(
    'Cleaning',
    'assets/cleaning.png',
    "screen_assets/tv2.jpg",
    "screen_assets/tv3.jpg",
  );
}

Widget More_service(BuildContext context) {
  return Column(
    children: [
      Material(
        type: MaterialType.transparency,
        child: Ink(
          height: 50.w,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.white,
            image: const DecorationImage(
              image: ExactAssetImage('assets/More.png'),
              fit: BoxFit.scaleDown,
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => services(),
                ),
              );
            },
          ),
        ),
      ),
      Column(
        children: [
          homeIconText('More'),
        ],
      ),
    ],
  );
}

Widget _buildBody() {
  return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        height: 180.h,
        width: 500.w,
        child: Stack(children: <Widget>[
          Image.asset(
            "assets/RoomGarden.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            colorBlendMode: BlendMode.darken,
          ),
          const Center(child: Text("hello")),
        ]),
      ));
}

Widget gas = Column(
  children: [
    IconButton(
        onPressed: () {}, icon: const Icon(Icons.local_gas_station_outlined)),
    homeIconText('Gas'),
  ],
);
