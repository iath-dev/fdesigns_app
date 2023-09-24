import 'package:fdesigns_app/src/models/models.dart';
import 'package:fdesigns_app/src/router/routes/routes.dart';
import 'package:fdesigns_app/src/screen/screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String initialRoute = "home";

  static final Map<String, List<NavItem>> routes = {
    'root': [
      NavItem(
          path: "home",
          screen: const HomeScreen(),
          label: "Home",
          icon: Icons.home),
      NavItem(
          path: "animate",
          screen: const AnimationsScreen(),
          label: "Animaciones",
          icon: Icons.play_circle),
      NavItem(
          path: "galley",
          screen: const GridViewScreen(),
          label: "Galería",
          icon: Icons.image),
      NavItem(
          path: "emergency",
          screen: const EmergencyScreen(),
          label: "Emergencia",
          icon: Icons.local_hospital),
      NavItem(
          path: "slivers",
          screen: const SliverListScreen(),
          label: "Lista de tareas",
          icon: Icons.list),
    ],
    'headers': headersRoutes,
    'animations': animationsHeaders
  };

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    final routes$ = routes.values.expand((element) => element).toList();

    for (final option in routes$) {
      appRoutes.addAll({option.path: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
