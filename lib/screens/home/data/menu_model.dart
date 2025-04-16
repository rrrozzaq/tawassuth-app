import 'package:flutter/material.dart';

// for menu apps
class MenuModel {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  MenuModel({required this.title, required this.icon, required this.onTap});
}
