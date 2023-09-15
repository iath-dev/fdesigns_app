import 'package:flutter/material.dart';

class RouteItem {
  final String route;
  final Widget screen;

  RouteItem({required this.route, required this.screen});
}

class NavItem extends RouteItem {
  final IconData icon;
  final String label;

  NavItem(
      {required super.route,
      required super.screen,
      required this.icon,
      required this.label});
}
