import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/Model_Screens/Map_Screen/get_location.dart';
import 'package:repair_duniya/Model_Screens/Map_Screen/location_service.dart';
import 'package:repair_duniya/Model_Screens/Subscription/subscriptionView.dart';
import 'package:repair_duniya/pop_Up_Screen/Date_Screen.dart';
import 'package:repair_duniya/pop_Up_Screen/address.dart';
import 'package:repair_duniya/pop_Up_Screen/urgent_normal.dart';
import '../pop_Up_Screen/Install_Screen.dart';
import '../Model_Screens/Subscription/subscriptionView.dart';

class SelectedServiceProvider with ChangeNotifier {
  String? _selectedService;

  String? get selectedService => _selectedService;

  void setSelectedService(String service) {
    _selectedService = service;
    notifyListeners();
  }
}

// class bookingButton extends StatelessWidget {
//   const bookingButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final selectedServiceProvider =
//         Provider.of<SelectedServiceProvider>(context, listen: false);

//     void selectService(String service) {
//       selectedServiceProvider.setSelectedService(service);
//     }

//     void handleNextButtonPressed() {
//       // final selectedValueProvider =
//       //     Provider.of<SelectionProvider>(context, listen: false);

//       // if (selectedValueProvider.SelectedValue != null) {
//       //   // User has selected a value, proceed with the next screen
//       //   route;
//       //   // showCustomModalBottomSheet(context);
//       // } else {
//       //   // User has not selected a value, show an error or prompt to select a value
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Error'),
//           content: Text('Please select a value.'),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }

//     bool IsSubscribed = false;
//     return Container(
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 7),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(
//                   height: 50,
//                   width: 160,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     child: ElevatedButton(
//                         onPressed: () {
//                           selectService('Urgent Booking');
//                           final selectedValueProvider =
//                               Provider.of<SelectionProvider>(context,
//                                   listen: false);

//                           if (selectedValueProvider.SelectedValue != null) {
//                             // User has selected a value, proceed with the next screen
//                             showCustomAdressBottomSheet(context);
//                             // Address_sheet(DeliveryStatusScreen());
//                           } else {
//                             handleNextButtonPressed();
//                           }
//                         },
//                         style: ButtonStyle(
//                           overlayColor:
//                               MaterialStateProperty.resolveWith<Color?>(
//                             (Set<MaterialState> states) {
//                               if (states.contains(MaterialState.pressed))
//                                 return Color.fromARGB(255, 63, 69, 145);
//                               return Colors
//                                   .blue; // Defer to the widget's default.
//                             },
//                           ),
//                         ),
//                         child: Text("Urgent Booking")),
//                   ),
//                 ),
//                 // SizedBox(
//                 //   width: 15,
//                 // ),
//                 SizedBox(
//                   height: 50,
//                   width: 160,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     child: ElevatedButton(
//                         onPressed: () {
//                           // DateBottomSheet();
//                           selectService('Normal booking');
//                           final selectedValueProvider =
//                               Provider.of<SelectionProvider>(context,
//                                   listen: false);

//                           if (selectedValueProvider.SelectedValue != null) {
//                             // User has selected a value, proceed with the next screen

//                             showCustomModalBottomSheet(context);
//                           } else {
//                             handleNextButtonPressed();
//                           }
//                           // if (IsSubscribed) {
//                           //
//                           // }
//                           // MySub();
//                         },
//                         style: ButtonStyle(
//                           overlayColor:
//                               MaterialStateProperty.resolveWith<Color?>(
//                             (Set<MaterialState> states) {
//                               if (states.contains(MaterialState.pressed))
//                                 return Color.fromARGB(255, 63, 69, 145);
//                               return Colors
//                                   .blue; // Defer to the widget's default.
//                             },
//                           ),
//                         ),
//                         child: Text("Normal Booking")),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               Padding(padding: EdgeInsets.only(left: 20)),
//               Container(
//                 height: 40,
//                 child: TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'Why urgent booking?',
//                       style: TextStyle(
//                           color: Colors.grey.shade400,
//                           fontWeight: FontWeight.bold),
//                     )),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
class bookingButton extends StatelessWidget {
  const bookingButton({Key? key});

  @override
  Widget build(BuildContext context) {
    final selectedServiceProvider =
        Provider.of<SelectedServiceProvider>(context, listen: false);

    void selectService(String service) {
      selectedServiceProvider.setSelectedService(service);
    }

    void handleNextButtonPressed() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please select a value.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }

    final selectedValueProvider = Provider.of<SelectionProvider>(context);
    bool isSelected;
    if (selectedValueProvider.SelectedValue != null) {
      isSelected = false;
    } else {
      isSelected = true;
    }
    bool isUrgentBookingSelected =
        selectedServiceProvider.selectedService == 'Urgent Booking';
    bool isNormalBookingSelected =
        selectedServiceProvider.selectedService == 'Normal Booking';

    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: ElevatedButton(
                      onPressed: isSelected
                          ? null
                          : () {
                              selectService('Urgent Booking');
                              if (selectedValueProvider.SelectedValue != null) {
                                showCustomAdressBottomSheet(context);
                              }
                            },
                      style: ButtonStyle(
                        backgroundColor: isSelected
                            ? MaterialStateProperty.all(Colors.grey)
                            : MaterialStateProperty.all(Colors.blue),
                      ),
                      child: Text("Urgent Booking"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: ElevatedButton(
                      onPressed: isSelected
                          ? null
                          : () {
                              selectService('Normal Booking');
                              if (selectedValueProvider.SelectedValue != null) {
                                showCustomModalBottomSheet(context);
                              }
                            },
                      style: ButtonStyle(
                        backgroundColor: isSelected
                            ? MaterialStateProperty.all(Colors.grey)
                            : MaterialStateProperty.all(Colors.blue),
                      ),
                      child: Text("Normal Booking"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20)),
              Container(
                height: 40,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Why urgent booking?',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
