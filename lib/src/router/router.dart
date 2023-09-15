import 'package:fdesigns_app/src/models/route.dart';
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
        icon: Icons.square_rounded)
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
