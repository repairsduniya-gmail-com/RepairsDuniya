import 'package:flutter/foundation.dart';

class serviceIdprovider with ChangeNotifier {
  String? UserselectedService;

  String? get selectedService => UserselectedService;

  void setSelectedService(String service) {
    UserselectedService = service;

    notifyListeners();
  }
}

  // ... other methods and functionalities of your provider class
