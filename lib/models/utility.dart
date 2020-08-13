import 'package:flutter/material.dart';

class Utility {
  final String name;
  final IconData icon;
  bool isSelected = false;
  Utility(this.name, this.icon);

  void setSelection(bool isSelected) {
    this.isSelected = isSelected;
  }
}
