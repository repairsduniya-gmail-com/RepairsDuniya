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
  final List<String> values;
  String url1, url2, url3, url4;
  homeIcon(this.Name, this.img, this.img1, this.img2, this.values, this.url1,
      this.url2, this.url3, this.url4);

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
                      builder: (context) => Icons_widget(
                          img1, img2, Name, values, url1, url2, url3, url4)),
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
      textScaleFactor: 1.1, textAlign: TextAlign.center, style: TextStyle());
}

Widget AC(BuildContext context) {
  return homeIcon(
      'AC',
      'assets/air-conditioner.png',
      "screen_assets/ac-service-mistribabu.png",
      "screen_assets/ac1.jpeg",
      [
        'AC Service',
        'AC cooling issue',
        'AC Not turning ON',
        'No Power to AC',
        'AC installation',
        'AC uninstallation',
        'AC replacement'
      ],
      'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
      'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/4/4b/Voltas_logo.png',
      'https://toppng.com/uploads/preview/car-logos-list-lloyd-logo-meaning-and-history-latest-lloyd-ac-logo-vector-11562884223wnc4vmd9u6.png');
}

Widget Refrigerator(BuildContext context) {
  return homeIcon(
      'Refrigerator',
      'assets/refrigerator.png',
      "screen_assets/repair-work-fridge-appliance-.jpg",
      "screen_assets/fridge1.jpg",
      [
        'Fridge not cooling',
        'Forming more ice',
        'Fridge not powering on',
        'Sound in fridge',
        'Other issues'
      ],
      'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
      'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
      'https://1000logos.net/wp-content/uploads/2022/12/Panasonic-logo-768x432.png',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Godrej_Logo.svg/1280px-Godrej_Logo.svg.png');
}

Widget Washer(BuildContext context) {
  return homeIcon(
      'Washing Machine',
      'assets/washing-machine.png',
      "screen_assets/wash1.jpeg",
      "screen_assets/wash2.jpeg",
      [''],
      'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
      'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Godrej_Logo.svg/1280px-Godrej_Logo.svg.png',
      'https://1000logos.net/wp-content/uploads/2017/12/Whirlpool-logo-768x432.png');
}

Widget Oven(BuildContext context) {
  return homeIcon(
      'Microwave Oven',
      'assets/oven.png',
      "screen_assets/oven1.jpeg",
      "screen_assets/oven2.jpg",
      [
        'Not heating',
        'Not working',
        'Buttons not working',
        'Electrical issues',
        'Other Issues'
      ],
      'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
      'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
      'https://1000logos.net/wp-content/uploads/2022/12/Panasonic-logo-768x432.png',
      'https://1000logos.net/wp-content/uploads/2017/12/Whirlpool-logo-768x432.png');
}

Widget Fan(BuildContext context) {
  return homeIcon(
      'Fan',
      'assets/Fan.png',
      "screen_assets/fan1.jpg",
      "screen_assets/fan2.jpg",
      [
        'Installation',
        'Uninstallation',
        'Not Powering ON',
        'Regulator issue',
        'Replacement (Uninstall & install)',
        'Other Issues'
      ],
      'https://upload.wikimedia.org/wikipedia/en/thumb/5/57/Havells_Logo.svg/2560px-Havells_Logo.svg.png',
      'https://1000logos.net/wp-content/uploads/2020/06/Bajaj-Logo.png',
      'https://zeevector.com/wp-content/uploads/Crompton-Logo-Vector.png',
      'https://companieslogo.com/img/orig/ORIENTELEC.NS_BIG-170a4acd.png?t=1655919047');
}

Widget Motercycle(BuildContext context) {
  return homeIcon(
      'Motorbike',
      'assets/motorbike.png',
      "screen_assets/tv2.jpg",
      "screen_assets/tv3.jpg",
      [''],
      'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
      'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/4/4b/Voltas_logo.png',
      'https://toppng.com/uploads/preview/car-logos-list-lloyd-logo-meaning-and-history-latest-lloyd-ac-logo-vector-11562884223wnc4vmd9u6.png');
}

Widget Geyser(BuildContext context) {
  return homeIcon(
      'Geyser',
      'screen_assets/geyser.png',
      "screen_assets/oven1.jpeg",
      "screen_assets/oven2.jpg",
      [
        'Geyser checkup',
        'Not Powering on',
        'Water leakage',
        'Replacement(Remove & Install)',
        'Other issues'
      ],
      'https://upload.wikimedia.org/wikipedia/en/thumb/5/57/Havells_Logo.svg/2560px-Havells_Logo.svg.png',
      'https://1000logos.net/wp-content/uploads/2020/06/Bajaj-Logo.png',
      'https://zeevector.com/wp-content/uploads/Crompton-Logo-Vector.png',
      'https://companieslogo.com/img/orig/ORIENTELEC.NS_BIG-170a4acd.png?t=1655919047');
}

Widget Aircooler(BuildContext context) {
  return homeIcon(
      'Air Cooler',
      'screen_assets/aircooler.png',
      "screen_assets/tv2.jpg",
      "screen_assets/tv3.jpg",
      [
        'fan motor issues',
        'Water pump issues',
        'Noise issues',
        'Grass replacement',
        'Not powering ON',
        'Other issue'
      ],
      'https://zeevector.com/wp-content/uploads/Symphony-Logo-PNG@zeevector.png',
      'https://1000logos.net/wp-content/uploads/2020/06/Bajaj-Logo.png',
      'https://zeevector.com/wp-content/uploads/Crompton-Logo-Vector.png',
      'https://companieslogo.com/img/orig/ORIENTELEC.NS_BIG-170a4acd.png?t=1655919047');
}

Widget cctv(BuildContext context) {
  return homeIcon(
      'CCTV',
      'screen_assets/cctv.png',
      "screen_assets/tv2.jpg",
      "screen_assets/tv3.jpg",
      [
        'Installation',
        'Uninstallation',
        'Not working',
        'Camera not recording',
        'Power supply issues',
        'Other Issues'
      ],
      'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/v1427013610/g3m9tjw5zbyi8a0rfvcq.png',
      'https://www.cpplusworld.com/prodassets/corporatelogo/f27b24a9-94fd-401f-8a4b-7541360fcdac.webp',
      'https://logonoid.com/images/ahuja-logo.png',
      'https://static.vecteezy.com/system/resources/previews/020/927/146/non_2x/xiaomi-brand-logo-phone-symbol-with-name-white-design-chinese-mobile-illustration-with-orange-background-free-vector.jpg');
}

Widget Car(BuildContext context) {
  return homeIcon(
      'Car Repair/Service',
      'screen_assets/car.png',
      "screen_assets/tv2.jpg",
      "screen_assets/tv3.jpg",
      [''],
      'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
      'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/4/4b/Voltas_logo.png',
      'https://toppng.com/uploads/preview/car-logos-list-lloyd-logo-meaning-and-history-latest-lloyd-ac-logo-vector-11562884223wnc4vmd9u6.png');
}

Widget Television(BuildContext context) {
  return homeIcon(
      'Television',
      'assets/tv.png',
      "screen_assets/tv2.jpg",
      "screen_assets/tv3.jpg",
      [
        'Installation',
        'Uninstallation',
        'Display issues',
        'Sound issues',
        'Colour issues',
        'Not powering ON',
        'Replacement(Remove & Install)',
        'other issues'
      ],
      'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
      'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
      'https://1000logos.net/wp-content/uploads/2021/05/Sony-logo.png',
      'https://static-obg.tcl.com/content/dam/brandsite/it-resources/third-party/tcl-share.png?auto=webp,smallest');
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
      [''],
      'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
      'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/4/4b/Voltas_logo.png',
      'https://toppng.com/uploads/preview/car-logos-list-lloyd-logo-meaning-and-history-latest-lloyd-ac-logo-vector-11562884223wnc4vmd9u6.png');
}

Widget Painting(BuildContext context) {
  return homeIcon(
      'Painting',
      'assets/paint.png',
      "screen_assets/tv2.jpg",
      "screen_assets/tv3.jpg",
      [''],
      'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
      'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/4/4b/Voltas_logo.png',
      'https://toppng.com/uploads/preview/car-logos-list-lloyd-logo-meaning-and-history-latest-lloyd-ac-logo-vector-11562884223wnc4vmd9u6.png');
}

Widget Cleaning(BuildContext context) {
  return homeIcon(
      'Cleaning',
      'assets/cleaning.png',
      "screen_assets/tv2.jpg",
      "screen_assets/tv3.jpg",
      [''],
      'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
      'https://cdn.wallpapersafari.com/95/3/hDI601.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/4/4b/Voltas_logo.png',
      'https://toppng.com/uploads/preview/car-logos-list-lloyd-logo-meaning-and-history-latest-lloyd-ac-logo-vector-11562884223wnc4vmd9u6.png');
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
