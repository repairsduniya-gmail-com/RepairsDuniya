import 'package:flutter/material.dart';

class PhoneProvider with ChangeNotifier {
  String _storedPhoneNumber = '';

  // Phone({required this.storedPhoneNumber});

  String get getphoneNumber {
    return _storedPhoneNumber;
  }

  void set setPhoneNumber(String phoneNumber) {
    // return storedPhoneNumber;
    _storedPhoneNumber = phoneNumber;
  }

  bool get isSet {
    if (_storedPhoneNumber.isEmpty) {
      return false;
    }
    return true;
  }
}
