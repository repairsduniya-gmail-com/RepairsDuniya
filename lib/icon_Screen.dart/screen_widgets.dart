import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/pop_Up_Screen/washing_machine.dart/type_washing_machine.dart';
import 'package:video_player/video_player.dart';
import '../Model_Screens/Home_Screen/serviceName.dart';
import '../pop_Up_Screen/booking_button.dart';
import '../pop_Up_Screen/urgent_normal.dart';

class Icons_widget extends StatefulWidget {
  final String name;
  final String img1;
  final String img2;
  final List<String> values;
  String url1, url2, url3, url4;

  Icons_widget(this.img1, this.img2, this.name, this.values, this.url1,
      this.url2, this.url3, this.url4);

  @override
  State<Icons_widget> createState() => _Icons_widgetState();
}

class _Icons_widgetState extends State<Icons_widget> {
  final List<String> CarouseList = [];
  late VideoPlayerController _videocontroller;
  bool repair = false;
  bool install = false;

  @override
  void initState() {
    super.initState();
    addToMyList(widget.img1);
    //   addToMyList(widget.img2);
  }

  void addToMyList(String value) {
    CarouseList.add(value);
  }

  @override
  Widget build(BuildContext context) {
    final selectedserviceNameProvider =
        Provider.of<serviceIdprovider>(context, listen: false);
    int _current = 0;
    final service = selectedserviceNameProvider.UserselectedService;
    final List<Widget> imgSlider = CarouseList.map(
      (item) => Container(
        height: 500,
        width: 1000,
        child: Stack(
          children: [
            Image.asset(item, fit: BoxFit.fill, width: double.infinity),
          ],
        ),
      ),
    ).toList();

    int _current1 = 0;
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         return SafeArea(
//           child: Scaffold(
//             body: Stack(
//               children: [
//                 SingleChildScrollView(
//                   child: SizedBox(
//                     height: MediaQuery.of(context).size.height,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Container(
//                           color: Colors.white,
//                           alignment: Alignment.topCenter,
//                           child: Column(
//                             children: [
//                               CarouselSlider(
//                                 items: imgSlider,
//                                 options: CarouselOptions(
//                                   height:
//                                       MediaQuery.of(context).size.height / 2.6,
//                                   viewportFraction: 1,
//                                   enlargeCenterPage: true,
//                                   autoPlay: false,
//                                   onPageChanged: (index, reason) {
//                                     setState(() {
//                                       _current1 = index;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               CarouselSlider(
//                                 items: carouselItems,
//                                 options: CarouselOptions(
//                                   height:
//                                       MediaQuery.of(context).size.height / 9.8,
//                                   viewportFraction: 1,
//                                   enlargeCenterPage: true,
//                                   autoPlay: true,
//                                   onPageChanged: (index, reason) {
//                                     setState(() {
//                                       _current = index;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               Row(
//                                 //Sliding indicator
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: carouselItems.map((url) {
//                                   int index = carouselItems.indexOf(url);
//                                   return Container(
//                                     width: 27.w,
//                                     height: 8.h,
//                                     margin: const EdgeInsets.symmetric(
//                                       vertical: 10,
//                                       horizontal: 1,
//                                     ),
//                                     decoration: BoxDecoration(
//                                         borderRadius: _current == index
//                                             ? const BorderRadius.all(
//                                                 Radius.circular(4))
//                                             : null,
//                                         shape: _current == index
//                                             ? BoxShape.rectangle
//                                             : BoxShape.circle,
//                                         color: _current == index
//                                             ? Colors.grey.shade600
//                                             : Colors.grey.shade400),
//                                   );
//                                 }).toList(),
//                               ),
//                               if (service == 'Washing Machine')
//                                 Padding(
//                                     padding: EdgeInsets.only(top: 130),
//                                     child: ButtonList()),
//                               if (service != 'Washing Machine')
//                                 ModalBotoomSheet(
//                                   values: widget.values,
//                                   name: widget.name,
//                                 ),
//                               // ...
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
    String img = widget.img2;
    ScreenUtil.init(context);
    return Scaffold(
      // backgroundColor: Colors.purple[50],
      //backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: Container(
                  height: 230.h,
                  width: 330.h,
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    //color: Colors.purple.withOpacity(0.2),
                    // border: Border.all(
                    //     color: Colors.black.withOpacity(0.2), width: 2),
                    // borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(img), fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black.withOpacity(0.2), width: 2),
                  // image: const DecorationImage(
                  //     // image: AssetImage("assets/material.jpeg"),
                  //     fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      // Text("Select Service",
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 25.sp,
                      //         fontWeight: FontWeight.bold)),

                      if (service == 'Washing Machine')
                        Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ButtonList()),
                      if (service != 'Washing Machine')
                        ModalBotoomSheet(
                          values: widget.values,
                          name: widget.name,
                          url1: widget.url1,
                          url2: widget.url2,
                          url3: widget.url3,
                          url4: widget.url4,
                          // url5: widget.url5,
                        ),
                      // ...
                      // SizedBox(height: 20.h),
                      // Text(
                      //     " ⚪️ On/Off your Ac,Light,Fan,TV,   etc..through the App.",
                      //     style: TextStyle(
                      //         color: Colors.white.withOpacity(0.8),
                      //         fontSize: 18.sp,
                      //         fontWeight: FontWeight.w400)),
                      // SizedBox(height: 20.h),
                      // Text(
                      //     " ⚪️ To get appliance installed, you need to book a service request.",
                      //     style: TextStyle(
                      //         color: Colors.white.withOpacity(0.8),
                      //         fontSize: 18.sp,
                      //         fontWeight: FontWeight.w400)),
                      // SizedBox(height: 20.h),
                      // Text(
                      //     " ⚪️ After your device is deliverd,install it with the help of our expert.",
                      //     style: TextStyle(
                      //         color: Colors.white.withOpacity(0.8),
                      //         fontSize: 18.sp,
                      //         fontWeight: FontWeight.w400)),
                      // SizedBox(height: 20.h),
                      // Text(
                      //     " ⚪️ You will get the price and more details on the order confirmation page.",
                      //     style: TextStyle(
                      //         color: Colors.white.withOpacity(0.8),
                      //         fontSize: 18.sp,
                      //         fontWeight: FontWeight.w400)),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // SizedBox(
                      //   height: 40.h,
                      //   width: 140.w,
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       elevation: 1,
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(12)),
                      //       backgroundColor: Colors.purple[200],
                      //       // backgroundColor: Colors.blue[300],
                      //     ),
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) =>
                      //                   OrderConfirmationView()));
                      //     },
                      //     child: Text(
                      //       "Order Now",
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 18.sp,
                      //           fontWeight: FontWeight.w600),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
