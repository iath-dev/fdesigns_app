import 'package:fdesigns_app/src/models/route.dart';
import 'package:fdesigns_app/src/router/router.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [_Background(), _Content()],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routes = AppRoutes.menu;

    return SafeArea(
      child: ListView.separated(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) => _NavItem(route: routes[index]),
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemCount: routes.length),
    );
  }
}

class _NavItem extends StatelessWidget {
  final NavItem route;

  const _NavItem({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, route.route),
        title: Text(route.label),
        dense: true,
        leading: Icon(route.icon),
        iconColor: Theme.of(context).colorScheme.primary,
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: 250,
            color: Theme.of(context).colorScheme.primary),
        Expanded(
            child: Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.background,
        ))
      ],
    );
  }
}
