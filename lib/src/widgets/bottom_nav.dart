import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavButton {
  final Function() onPress;
  final IconData icon;

  BottomNavButton({required this.onPress, required this.icon});
}

class BottomNav extends StatelessWidget {
  final List<BottomNavButton> actions;
  final Color? activeColor;
  final Color? inactiveColor;

  const BottomNav(
      {super.key, required this.actions, this.activeColor, this.inactiveColor});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return ChangeNotifierProvider(
      create: (_) => _BottomNavModel(),
      child: Builder(builder: (context) {
        Provider.of<_BottomNavModel>(context)
          ..activeColor = activeColor ?? primary
          ..inactiveColor = inactiveColor ?? Colors.blueGrey;

        return _NavBackground(
          width: (actions.length * 40) + 30,
          child: _NavButtons(
            items: actions,
          ),
        );
      }),
    );
  }
}

class _NavBackground extends StatelessWidget {
  const _NavBackground({
    super.key,
    required this.width,
    required this.child,
  });

  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      // width: 250,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: theme.background,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                offset: Offset(5, 5),
                blurRadius: 10,
                spreadRadius: -1)
          ]),
      child: child,
    );
  }
}

class _NavButtons extends StatelessWidget {
  final List<BottomNavButton> items;

  const _NavButtons({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(items.length, (index) {
        final item = items[index];
        return _MenuButton(item: item, index: index);
      }),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    super.key,
    required this.item,
    required this.index,
  });

  final BottomNavButton item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_BottomNavModel>(context);
    final activeColor = provider.activeColor;
    final inactiveColor = provider.inactiveColor;
    final selected = provider.currentPage == index;

    return GestureDetector(
      onTap: () {
        provider.currentPage = index;
        item.onPress();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: selected ? 30 : 24,
        color: selected ? activeColor : inactiveColor,
      ),
    );
  }
}

class _BottomNavModel with ChangeNotifier {
  int _currentPage = 0;
  late Color activeColor;
  late Color inactiveColor;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  int get currentPage => _currentPage;
}
