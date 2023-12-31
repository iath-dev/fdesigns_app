import 'package:fdesigns_app/src/router/router.dart';
import 'package:fdesigns_app/src/widgets/app_bar.dart';
import 'package:fdesigns_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routes = AppRoutes.routes['headers']!;
    return CustomAppBar(title: "Inicio", child: RouteList(routes: routes));
  }
}
