import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/Model_Screens/Map_Screen/location_service.dart';

import 'package:repair_duniya/pop_Up_Screen/address.dart';
import 'package:intl/intl.dart';

showCustomModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(35),
    )),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (BuildContext context) {
      return DateBottomSheet();
    },
  );
}

class DateBottomSheet extends StatefulWidget {
  const DateBottomSheet({super.key});

  @override
  State<DateBottomSheet> createState() => _DateBottomSheetState();
}

class dateTime with ChangeNotifier {
  DateTime? userSelectedDate;

  void setSelectedDate(DateTime Date) {
    userSelectedDate = Date;
    notifyListeners();
  }

  // ... other methods and functionalities of your provider class
}

class SelectedTime with ChangeNotifier {
  int selectedIndex = 0; // Initial selected index
  List<String> toggleValues = ['Morning', 'Afternoon', 'Evening'];
  String get selectedValue => toggleValues[selectedIndex];

  void setToggleValue(int index) {
    selectedIndex = index;
    notifyListeners();
  }
  // ... other methods and functionalities of your provider class
}

class _DateBottomSheetState extends State<DateBottomSheet>
    with SingleTickerProviderStateMixin {
  bool showAdressSheet = true;
  bool _hasBeenPressed = false;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  final List<bool> _selectedTime = <bool>[true, false, false];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
    _animationController.forward();
  }

  void togggleContent() {}
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleContent() {
    setState(() {
      showAdressSheet = !showAdressSheet;
    });
  }

  Widget button(String Time) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
            height: 20,
            width: 110,
            child: Center(
              child: Text(
                Time,
                style: const TextStyle(
                  fontSize: 15,
                  // color: _hasBeenPressed ? Colors.white : Colors.black,
                ),
              ),
            )));
    //   ),
    // );
  }

  Widget Date_sheet(context) {
    final TextEditingController _Textcontroller = TextEditingController();
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 6,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Select Date",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 60,
                  child: Image.asset(
                      'assets/3d-render-calendar-page-with-green-tick-icon_107791-15944-removebg-preview.png'),
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: dateTimepicker()
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: Size.fromHeight(40),
              //     primary: Colors.grey.shade300,
              //   ),
              //   child: FittedBox(
              //     child: Text(
              //       "Date",
              //       style: TextStyle(fontSize: 20, color: Colors.black),
              //     ),
              //   ),
              //   onPressed: () {},
              // ),
              ),
          // SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Select Timing",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 70,
                  child: Image.asset(
                      'assets/alarm-clock-concept-illustration_114360-14276-removebg-preview.png'),
                )
              ],
            ),
          ),
          Consumer<SelectedTime>(builder: (context, provider, _) {
            return ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (index) {
                provider.setToggleValue(index);
                setState(() {
                  // The button that is tapped is set to true, and the others to false.
                  for (int i = 0; i < _selectedTime.length; i++) {
                    _selectedTime[i] = i == index;
                  }
                });
              },
              borderRadius: BorderRadius.circular(10),
              selectedColor: Colors.white,
              fillColor: Colors.blue,
              color: Colors.black,
              isSelected: List<bool>.generate(
                  3,
                  (index) =>
                      index ==
                      provider
                          .selectedIndex), // Only the selected index will be true
              children: [
                button('Morning'),
                button('Afternoon'),
                button('Evening')
              ],
            );
          }),

          Stack(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Center(
                child: Text(
                  "Our Expert will arrive on your appointment Day and Time",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: IconButton(
                icon: Icon(Icons.arrow_forward_outlined),
                iconSize: 45,
                onPressed: toggleContent,
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (showAdressSheet) Date_sheet(context),
      if (!showAdressSheet) Address_sheet(DeliveryStatusScreen())
    ]);
  }
}

class dateTimepicker extends StatefulWidget {
  const dateTimepicker({super.key});

  @override
  State<dateTimepicker> createState() => _dateTimepickerState();
}

class _dateTimepickerState extends State<dateTimepicker> {
  DateTime _selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  DateTime firstDate = DateTime.now().add(Duration(days: -1));
  DateTime lastDate = DateTime.now().add(Duration(days: 2));
  bool isChosen = false;

  void _showDatePicker(BuildContext context) async {
    final datePickerProvider = Provider.of<dateTime>(context, listen: false);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 2)),
    );

    if (pickedDate == null) {
      return;
    }

    datePickerProvider.setSelectedDate(pickedDate);
    setState(() {
      _selectedDate = pickedDate;
      isChosen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _selectedDate == null
            ? Text(
                'No date chosen',
                style: TextStyle(fontSize: 20, color: Colors.black),
              )
            : SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size.fromHeight(40),
                    primary: Colors.grey.shade300,
                  ),
                  child: Text(
                    isChosen ? dateFormat.format(_selectedDate) : 'Choose date',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    _showDatePicker(context);
                  },
                ),
              ),
      ],
    );
  }
}
