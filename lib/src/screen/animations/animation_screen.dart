import 'package:fdesigns_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _AnimationSquare(),
      ),
    );
  }
}

class _AnimationSquare extends StatefulWidget {
  const _AnimationSquare({
    super.key,
  });

  @override
  State<_AnimationSquare> createState() => _AnimationSquareState();
}

class _AnimationSquareState extends State<_AnimationSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _movement;
  late Animation<double> _opacity;
  late Animation<double> _rotation;
  late Animation<double> _size;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _rotation = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _opacity = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _movement = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _size = Tween(begin: 1.0, end: 3.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    final width = MediaQuery.of(context).size.width * .5;

    return AnimatedBuilder(
      animation: _controller,
      // child: child,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset:
              Offset(_movement.value * width, sin(_movement.value * pi) * -50),
          child: Transform.rotate(
              angle: _rotation.value * pi,
              child: Opacity(
                  opacity: sin(_opacity.value * pi),
                  child: RectangleBox(
                      size: 50 * _size.value, color: Colors.blue))),
        );
      },
    );
    // return const RectangleBox(size: 70, color: Colors.red);
  }
}
