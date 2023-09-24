import 'package:flutter/material.dart';

class RouteItem {
  final String path;
  final Widget screen;

  RouteItem({required this.path, required this.screen});

  Route get route => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curve =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);

          return SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(1.0, 0), end: Offset.zero)
                      .animate(curve),
              child: child);
        },
      );
}

class NavItem extends RouteItem {
  final IconData icon;
  final String label;

  NavItem(
      {required super.path,
      required super.screen,
      required this.icon,
      required this.label});
}
