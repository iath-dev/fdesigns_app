import 'package:fdesigns_app/src/widgets/rectangle.dart';
import 'package:flutter/material.dart';

class AnimationSquareScreen extends StatelessWidget {
  const AnimationSquareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _SquareAnimation(),
      ),
    );
  }
}

class _SquareAnimation extends StatefulWidget {
  const _SquareAnimation({
    super.key,
  });

  @override
  State<_SquareAnimation> createState() => _SquareAnimationState();
}

class _SquareAnimationState extends State<_SquareAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> moveBottom;
  late Animation<double> moveRight;
  late Animation<double> moveTop;
  late Animation<double> moveLeft;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4500));

    moveBottom = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.bounceOut)));
    moveRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.5, curve: Curves.bounceOut)));
    moveTop = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.75, curve: Curves.bounceOut)));
    moveLeft = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
            offset: Offset(moveBottom.value - moveTop.value,
                moveLeft.value - moveRight.value),
            child: const RectangleBox(size: 60, color: Colors.indigo));
      },
    );
  }
}
