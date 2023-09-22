import 'package:animate_do/animate_do.dart';
import 'package:fdesigns_app/src/router/router.dart';
import 'package:fdesigns_app/src/widgets/widgets.dart';
import 'package:fdesigns_app/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: child,
      drawer: const _AppDrawer(),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  const _AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routes = AppRoutes.routes['root']!;
    final appTheme = Provider.of<AppTheme>(context);

    return Drawer(
      child: Column(
        children: [
          FadeInDown(child: const _Header()),
          Expanded(child: RouteList(routes: routes)),
          SwitchListTile.adaptive(
              dense: true,
              title: const Text("Dark Theme"),
              value: appTheme.dark,
              onChanged: (val) => appTheme.dark = val),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      height: 200,
      color: theme.primary,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("DN",
                style: TextStyle(
                    fontSize: 50,
                    color: theme.onPrimary,
                    fontWeight: FontWeight.bold)),
            Text("jdnl95@gmail.com",
                style: TextStyle(
                    color: theme.onPrimary, fontWeight: FontWeight.w400)),
            const SizedBox(height: 12)
          ],
        ),
      ),
    );
  }
}
