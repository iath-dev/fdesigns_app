import 'package:animate_do/animate_do.dart';
import 'package:fdesigns_app/src/models/models.dart';
import 'package:flutter/material.dart';

class RouteList extends StatelessWidget {
  final List<NavItem> routes;

  const RouteList({Key? key, required this.routes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (_, index) => const Divider(height: 8),
        itemBuilder: (_, index) => _RouteListItem(route: routes[index]),
        itemCount: routes.length);
  }
}

class _RouteListItem extends StatelessWidget {
  const _RouteListItem({
    super.key,
    required this.route,
  });

  final NavItem route;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: ListTile(
        dense: true,
        title: Text(route.label),
        leading: Icon(route.icon, color: Theme.of(context).colorScheme.primary),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(context, route.route),
      ),
    );
  }
}
