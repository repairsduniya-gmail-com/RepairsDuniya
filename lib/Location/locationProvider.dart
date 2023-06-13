import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier {
  String? pickedLocation;

  void updateLocation(String location) {
    pickedLocation = location;
    notifyListeners();
  }

  String? getLocation() {
    return pickedLocation;
  }
}
