// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
// import 'package:repair_duniya/pop_Up_Screen/Date_Screen.dart';
// import 'package:repair_duniya/pop_Up_Screen/Describe_Screen.dart';

// void showCustomModalBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//       top: Radius.circular(35),
//     )),
//     clipBehavior: Clip.antiAliasWithSaveLayer,
//     builder: (BuildContext context) {
//       return ModalBotoomSheet();
//     },
//   );
// }

// class SelectedServiceProvider with ChangeNotifier {
//   String? _selectedService;

//   String? get selectedService => _selectedService;

//   void setSelectedService(String service) {
//     _selectedService = service;
//     notifyListeners();
//   }
// }

// class ModalBotoomSheet extends StatefulWidget {
//   const ModalBotoomSheet({super.key});

//   @override
//   State<ModalBotoomSheet> createState() => _ModalBotoomSheetState();
// }

// class _ModalBotoomSheetState extends State<ModalBotoomSheet> {
//   bool showDescribeSheet = true;
//   bool showDateSheet = true;

//   void toggleContent() {
//     setState(() {
//       showDescribeSheet = !showDescribeSheet;
//     });
//   }

//   void toggleContent_install() {
//     setState(() {
//       showDateSheet = !showDateSheet;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final selectedServiceProvider =
//         Provider.of<SelectedServiceProvider>(context, listen: false);

//     void selectService(String service) {
//       selectedServiceProvider.setSelectedService(service);
//     }

//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10), topRight: Radius.circular(10))),
//       child: Column(mainAxisSize: MainAxisSize.min, children: [
//         if (showDescribeSheet && showDateSheet)
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10))),
//             child: Column(children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: 6,
//                   width: 50,
//                   decoration: BoxDecoration(
//                       color: Colors.grey.shade300,
//                       borderRadius: BorderRadius.circular(10)),
//                 ),
//               ),
//               Lottie.asset("animations/select_service.json",
//                   height: 180,
//                   reverse: true,
//                   repeat: true,
//                   fit: BoxFit.fitHeight),
//               const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 35),
//                 child: Center(
//                     child: Text(
//                   "Select Service",
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
//                 )),
//               ),
//               Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 20, horizontal: 5),
//                       child: SizedBox(
//                         height: 50,
//                         width: 140,
//                         child: ElevatedButton(
//                             style: ButtonStyle(
//                                 elevation: null,
//                                 backgroundColor:
//                                     MaterialStateProperty.resolveWith<Color>(
//                                   (Set<MaterialState> states) {
//                                     if (states.contains(MaterialState.pressed))
//                                       return Colors.blue;
//                                     return Color.fromARGB(255, 242, 241, 241);
//                                   },
//                                 ),
//                                 shape: MaterialStateProperty.all(
//                                     RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   // side: BorderSide(
//                                   //     width: 10.0, color: Colors.black),
//                                 )),
//                                 foregroundColor:
//                                     MaterialStatePropertyAll(Colors.black)),
//                             onPressed: () {
//                               selectService('installation');
//                               toggleContent_install();
//                             },
//                             child: Text(
//                               "Installation",
//                               style: TextStyle(
//                                 fontSize: 18.sp,
//                                 color: Colors.blue,
//                               ),
//                             )),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 20, horizontal: 5),
//                       child: SizedBox(
//                         height: 50,
//                         width: 140,
//                         child: ElevatedButton(
//                             style: ButtonStyle(
//                                 backgroundColor:
//                                     MaterialStateProperty.resolveWith<Color>(
//                                   (Set<MaterialState> states) {
//                                     if (states.contains(MaterialState.pressed))
//                                       return Colors.blue;
//                                     return Colors.blueAccent;
//                                   },
//                                 ),
//                                 shape: MaterialStateProperty.all(
//                                     RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 )),
//                                 foregroundColor: const MaterialStatePropertyAll(
//                                     Colors.black)),
//                             onPressed: () {
//                               selectService('repair');
//                               toggleContent();
//                             },
//                             child: Text(
//                               "Repair",
//                               style: TextStyle(
//                                   fontSize: 18.sp, color: Colors.white),
//                             )),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ]),
//           ),
//         if (!showDescribeSheet) modalBottomSheet(),
//         if (!showDateSheet) DateBottomSheet()
//       ]),
//     );
//   }
// }
