import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:repair_duniya/Model_Screens/Buy_Appliances/providers/all_providers.dart';

class Item {
  final String name;
  final String category;

  Item({required this.name, required this.category});
}
