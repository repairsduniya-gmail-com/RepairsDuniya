import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:repair_duniya/pop_Up_Screen/Date_Screen.dart';
import 'package:repair_duniya/pop_Up_Screen/Describe_Screen.dart';
import 'package:repair_duniya/pop_Up_Screen/Install_Screen.dart';
import 'package:repair_duniya/pop_Up_Screen/booking_button.dart';

class SelectionModel {
  List<String> selectedValues = [];
}

class SelectionProvider extends ChangeNotifier {
  SelectionModel _model = SelectionModel();
  String? _selectedValue;

  String? get SelectedValue => _selectedValue;

  void setSelectedValue(String value) {
    _selectedValue = value;
    notifyListeners();
  }

  List<String> get selectedValues => _model.selectedValues;

  void updateSelectedValues(List<String> values) {
    _model.selectedValues = values;
    notifyListeners();
  }
}

class ModalBotoomSheet extends StatefulWidget {
  final List<String> values;
  final String name;
  String url1, url2, url3, url4;
  ModalBotoomSheet({
    required this.values,
    required this.name,
    required this.url1,
    required this.url2,
    required this.url3,
    required this.url4,
  });
  // const ModalBotoomSheet.nonNullValue(
  //     this.name, this.values); // Const constructor with non-null value

  // const ModalBotoomSheet.nullableValue(
  //   String? name,
  //   List<String> values,
  // )   : name = name ?? '',
  //       values = values;

  // Const constructor handling nullable value
  @override
  State<ModalBotoomSheet> createState() => _ModalBotoomSheetState();
}

class _ModalBotoomSheetState extends State<ModalBotoomSheet> {
  String? name;

  @override
  void initState() {
    super.initState();
    name = widget.name;
  }

  bool showDescribeSheet = true;
  bool showDateSheet = true;
  String? selectedValue;
  List<String> dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];
  String? selectedDropdownValue;
  void toggleContent() {
    setState(() {
      showDescribeSheet = !showDescribeSheet;
    });
  }

  void toggleContent_install() {
    setState(() {
      showDateSheet = !showDateSheet;
    });
  }

  List<Widget> carouselItems = [
    Container(
      height: 40,
      width: 300,
      // color: Colors.red,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black.withOpacity(0.2), width: 2)),
      child: Center(
          child: ListTile(
        leading: Image.network(
            'https://static.vecteezy.com/system/resources/previews/009/373/706/original/special-offer-red-icon-discount-banner-without-background-png.png'),
        title: Text('Get cashback 100/-'),
        subtitle: Text('Win cash back 100/- on first 3 bookings'),
      )),
    ),
    Container(
      height: 40,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black.withOpacity(0.2), width: 2)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.green),
                color: Color.fromARGB(255, 190, 240, 192)),
            child: Row(
              children: [
                Icon(Icons.straight_rounded),
                Text('1,608 booking', style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(text: '"36%" ', style: TextStyle(color: Colors.green)),
              TextSpan(
                  text: 'Increases Our booking rate',
                  style: TextStyle(color: Colors.black))
            ])),
          )
        ],
      )),
    ),
    Container(
      height: 40,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black.withOpacity(0.2), width: 2)),
      child: Center(
        child: Column(
          children: [
            Text(
              'Win gift vouchers worth upto 700/-',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                      'https://images.yourstory.com/cs/images/companies/logosC141575978425306png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                        fit: BoxFit.contain,
                        'https://upload.wikimedia.org/wikipedia/commons/7/75/Zomato_logo.png'),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                        fit: BoxFit.cover,
                        'https://companieslogo.com/img/orig/AMZN-e9f942e4.png?t=1632523695'),
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.network(
                          fit: BoxFit.contain,
                          'https://pngimg.com/d/kfc_PNG3.png'))
                ],
              ),
            )
          ],
        ),
      ),
    ),
    Container(
      height: 40,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black.withOpacity(0.2), width: 2)),
      child: Center(
        child: Column(
          children: [
            Text(
              'We deal with all types of brands',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                      'https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                        fit: BoxFit.contain,
                        'https://cdn.wallpapersafari.com/95/3/hDI601.jpg'),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                        fit: BoxFit.cover,
                        'https://upload.wikimedia.org/wikipedia/commons/4/4b/Voltas_logo.png'),
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.network(
                          fit: BoxFit.contain,
                          'https://toppng.com/uploads/preview/car-logos-list-lloyd-logo-meaning-and-history-latest-lloyd-ac-logo-vector-11562884223wnc4vmd9u6.png'))
                ],
              ),
            )
          ],
        ),
      ),
    ),
  ];
  int _current = 0;
  int _current1 = 0;
  @override
  Widget build(BuildContext context) {
    final selectedServiceProvider =
        Provider.of<SelectionProvider>(context, listen: false);
    String? name = widget.name;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDescribeSheet && showDateSheet)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      height: 0,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        "${name} Repair & Service",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 15,
                    thickness: 3,
                  ),
                  CarouselSlider(
                    // items: carouselItems,
                    items: [
                      Container(
                        height: 40,
                        width: 300,
                        // color: Colors.red,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                                width: 2)),
                        child: Center(
                            child: ListTile(
                          leading: Image.network(
                              'https://static.vecteezy.com/system/resources/previews/009/373/706/original/special-offer-red-icon-discount-banner-without-background-png.png'),
                          title: Text('Get cashback 100/-'),
                          subtitle:
                              Text('Win cash back 100/- on first 3 bookings'),
                        )),
                      ),
                      Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                                width: 2)),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.green),
                                  color: Color.fromARGB(255, 190, 240, 192)),
                              child: Row(
                                children: [
                                  Icon(Icons.straight_rounded),
                                  Text('1,608 booking',
                                      style: TextStyle(color: Colors.green)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: '"36%" ',
                                    style: TextStyle(color: Colors.green)),
                                TextSpan(
                                    text: 'Increases Our booking rate',
                                    style: TextStyle(color: Colors.black))
                              ])),
                            )
                          ],
                        )),
                      ),
                      Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                                width: 2)),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Win gift vouchers worth upto 700/-',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.network(
                                        'https://images.yourstory.com/cs/images/companies/logosC141575978425306png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.network(
                                          fit: BoxFit.contain,
                                          'https://upload.wikimedia.org/wikipedia/commons/7/75/Zomato_logo.png'),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.network(
                                          fit: BoxFit.cover,
                                          'https://companieslogo.com/img/orig/AMZN-e9f942e4.png?t=1632523695'),
                                    ),
                                    CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Image.network(
                                            fit: BoxFit.contain,
                                            'https://pngimg.com/d/kfc_PNG3.png'))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                                width: 2)),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'We deal with all types of brands',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.network(
                                        widget.url1,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.network(
                                        fit: BoxFit.contain,
                                        widget.url2,
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.network(
                                        fit: BoxFit.cover,
                                        widget.url3,
                                      ),
                                    ),
                                    CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Image.network(
                                          fit: BoxFit.contain,
                                          widget.url4,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height / 9.8,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                  Row(
                    //Sliding indicator
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: carouselItems.map((url) {
                      int index = carouselItems.indexOf(url);
                      return Container(
                        width: 27.w,
                        height: 8.h,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 1,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: _current == index
                                ? const BorderRadius.all(Radius.circular(4))
                                : null,
                            shape: _current == index
                                ? BoxShape.rectangle
                                : BoxShape.circle,
                            color: _current == index
                                ? Colors.grey.shade600
                                : Colors.grey.shade400),
                      );
                    }).toList(),
                  ),
                  Center(
                    child: Consumer<SelectionProvider>(
                      builder: (context, provider, _) {
                        return Container(
                            height: 170.h,
                            padding: EdgeInsets.all(2),
                            child: Scrollbar(
                              child: ListView(
                                padding: EdgeInsets.all(0),
                                shrinkWrap: true,
                                children: widget.values
                                    .map(
                                      (value) => RadioListTile(
                                        title: ExpansionTile(
                                          title: Text(value),
                                          trailing: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          ),
                                          children: [
                                            // if (selectedValue == value)
                                            Padding(
                                              padding: EdgeInsets.all(0.0),
                                              child: Text(
                                                'Description: Some description for $value',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        value: value,
                                        groupValue: selectedValue,
                                        onChanged: (selected) {
                                          setState(() {
                                            selectedValue = selected as String?;
                                            provider.updateSelectedValues(
                                                selected != null
                                                    ? [value]
                                                    : []);
                                            provider.setSelectedValue(value);
                                          });
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ));
                      },
                    ),
                  ),
                  bookingButton(),
                ],
              ),
            ),
          if (!showDescribeSheet) modalBottomSheet(),
          if (!showDateSheet) DateBottomSheet(),
        ],
      ),
    );
  }
}
