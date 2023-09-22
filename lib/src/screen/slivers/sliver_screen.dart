import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SliverListScreen extends StatelessWidget {
  const SliverListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(bottom: -10, right: 0, child: _NewListButton())
        ],
      ),
    );
  }
}

class _NewListButton extends StatelessWidget {
  const _NewListButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
        onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(size.width * .9, 70),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)))),
        child: const Text(
          "Create task",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 3,
              fontWeight: FontWeight.bold),
        ));
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _ListItem('Orange', Colors.blue.shade300),
      _ListItem('Family', Colors.blue.shade400),
      _ListItem('Subscriptions', Colors.blue.shade500),
      _ListItem('Books', Colors.blue.shade800),
      _ListItem('Orange', Colors.blue.shade300),
      _ListItem('Family', Colors.blue.shade400),
      _ListItem('Subscriptions', Colors.blue.shade500),
      _ListItem('Books', Colors.blue.shade800),
      _ListItem('Orange', Colors.blue.shade300),
      _ListItem('Family', Colors.blue.shade400),
      _ListItem('Subscriptions', Colors.blue.shade500),
      _ListItem('Books', Colors.blue.shade800),
      _ListItem('Orange', Colors.blue.shade300),
      _ListItem('Family', Colors.blue.shade400),
      _ListItem('Subscriptions', Colors.blue.shade500),
      _ListItem('Books', Colors.blue.shade800),
      _ListItem('Orange', Colors.blue.shade300),
      _ListItem('Family', Colors.blue.shade400),
      _ListItem('Subscriptions', Colors.blue.shade500),
      _ListItem('Books', Colors.blue.shade800),
      _ListItem('Orange', Colors.blue.shade300),
      _ListItem('Family', Colors.blue.shade400),
      _ListItem('Subscriptions', Colors.blue.shade500),
      _ListItem('Books', Colors.blue.shade800),
    ];
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            floating: true,
            delegate: _HeaderDelegate(const _Header(), 250, 200)),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items.map((e) => BounceInLeft(child: e)),
          const SizedBox(height: 80)
        ]))
      ],
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight, minHeight;

  _HeaderDelegate(this.child, this.maxHeight, this.minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _HeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent ||
        child != oldDelegate.child;
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(12),
      color: Theme.of(context).colorScheme.primary,
      child: const SafeArea(
        child: Column(
          children: [
            Text(
              "New",
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "List",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String label;
  final Color color;

  const _ListItem(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 130,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
