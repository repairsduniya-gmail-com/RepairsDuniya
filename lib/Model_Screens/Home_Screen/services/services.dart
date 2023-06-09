import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repair_duniya/icon_Screen.dart/screen_widgets.dart';

class services extends StatefulWidget {
  const services({super.key});

  @override
  State<services> createState() => _servicesState();
}

class _servicesState extends State<services> {
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
        title: Text("Services"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              children: [
                listtile(
                  'Unisex Salon & Spa',
                  'assets/salon.png',
                  "screen_assets/tv2.jpg",
                  "screen_assets/tv3.jpg",
                ),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
