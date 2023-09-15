import 'package:fdesigns_app/src/models/route.dart';
import 'package:fdesigns_app/src/screen/diagonal_screen.dart';
import 'package:fdesigns_app/src/screen/screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String initialRoute = "home";

  static final routes = <RouteItem>[
    RouteItem(
      route: "home",
      screen: const HomeScreen(),
    ),
    ...menu
  ];

  static final menu = <NavItem>[
    NavItem(
        route: "square",
        screen: const SquareScreen(),
        label: "Cuadrado",
        icon: Icons.square_rounded),
    NavItem(
        route: "circle",
        screen: const CircleScreen(),
        label: "Circulo",
        icon: Icons.circle),
    NavItem(
        route: "sharp",
        screen: const SharpScreen(),
        label: "Sharp",
        icon: Icons.polyline),
    NavItem(
        route: "diagonal",
        screen: const DiagonalScreen(),
        label: "Diagonal",
        icon: Icons.polyline_outlined),
    NavItem(
        route: "pick",
        screen: const PickScreen(),
        label: "Pico",
        icon: Icons.edit),
    NavItem(
        route: "curve",
        screen: const CurveScreen(),
        label: "Curva",
        icon: Icons.circle_outlined),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in routes) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
