import 'package:fdesigns_app/src/router/router.dart';
import 'package:fdesigns_app/src/widgets/app_bar.dart';
import 'package:fdesigns_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routes = AppRoutes.routes['animations']!;

    return CustomAppBar(title: "Animaciones", child: RouteList(routes: routes));
  }
}
