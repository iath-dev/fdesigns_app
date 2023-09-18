import 'package:fdesigns_app/src/models/models.dart';
import 'package:fdesigns_app/src/router/routes/routes.dart';
import 'package:fdesigns_app/src/screen/screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String initialRoute = "home";

  static final Map<String, List<RouteItem>> routes = {
    'root': [RouteItem(route: "home", screen: const HomeScreen())],
    'headers': headersRoutes,
    'animations': animationsHeaders
  };

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    final routes$ = routes.values.expand((element) => element).toList();

    for (final option in routes$) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
