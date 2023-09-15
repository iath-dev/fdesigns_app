import 'package:flutter/material.dart';

class RouteItem {
  final String route;
  final Widget screen;
  final IconData? icon;
  final String? label;

  RouteItem({required this.route, required this.screen, this.icon, this.label});
}
