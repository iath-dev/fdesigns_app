import 'package:fdesigns_app/src/models/route.dart';
import 'package:fdesigns_app/src/router/router.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        color: Theme.of(context).colorScheme.primary,
        child: const _Content(),
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
    final routes = AppRoutes.routes.values.toList().sublist(1);

    return ListView.separated(
      itemCount: routes.length,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.white,
        thickness: 1,
      ),
      itemBuilder: (context, index) =>
          _RoutesList(routes: routes[index] as List<NavItem>),
    );
  }
}

class _ListHeader extends StatelessWidget {
  final String title;

  const _ListHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Colors.white)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        dense: true,
        textColor: primary,
      ),
    );
  }
}

class _RoutesList extends StatelessWidget {
  const _RoutesList({
    super.key,
    required this.routes,
  });

  final List<NavItem> routes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        // padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => _NavItem(route: routes[index]),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemCount: routes.length);
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
