import 'package:flutter/material.dart';

class FadeOutButton extends StatelessWidget {
  final String label;
  final List<Color> colors;
  final Color color;
  final IconData icon;
  final Function() onPress;

  const FadeOutButton(
      {super.key,
      required this.label,
      required this.colors,
      required this.color,
      required this.icon,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        children: [
          _Background(color: color, colors: colors, icon: icon),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(width: 20, height: 100),
            Icon(icon, size: 40, color: color),
            const SizedBox(width: 20),
            Expanded(
                child:
                    Text(label, style: TextStyle(color: color, fontSize: 16))),
            Icon(Icons.chevron_right, color: color, size: 30),
            const SizedBox(width: 20)
          ])
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  final Color color;
  final List<Color> colors;
  final IconData icon;

  const _Background({
    super.key,
    required this.color,
    required this.icon,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(4, 6), blurRadius: 20)
          ],
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: Icon(
                icon,
                color: color.withOpacity(.25),
                size: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
