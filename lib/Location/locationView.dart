import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:provider/provider.dart';
import 'locationprovider.dart';

class LocationView extends StatefulWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  State<LocationView> createState() => LocationView_state();
}

class LocationView_state extends State<LocationView> {
  String address = '';
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: const Icon(
              Icons.location_on,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          address,
          // "Pick Your Location",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close, color: Colors.black),
            ),
          ),
          SizedBox(width: 20.w)
        ],
      ),
      body: OpenStreetMapSearchAndPick(
          center: LatLong(23, 89),
          buttonColor: Colors.black,
          buttonText: 'Set Location',
          onPicked: (pickedData) {
            var locationProvider =
                Provider.of<LocationProvider>(context, listen: false);
            locationProvider.updateLocation(pickedData.address);
            //print("Data selected");
            setState(() {
              address = pickedData.address;
            });
            Navigator.pop(context);
          }),
    );
  }
}
