import 'package:flutter/material.dart';

class NavigationItem {
  int id;
  String label;
  Icon myIcon;
  Widget body;
  bool isSelected;

  NavigationItem({required this.id, required this.label, required this.myIcon, required this.body, this.isSelected = false});
}