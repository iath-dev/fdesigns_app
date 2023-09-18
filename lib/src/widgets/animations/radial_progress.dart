import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final int value;
  final Color? color;
  final Color? backgroundColor;
  final double? stokeWidth;
  final double? width;

  const RadialProgress(
      {super.key,
      required this.value,
      this.color,
      this.backgroundColor,
      this.stokeWidth,
      this.width});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late int _value;

  @override
  void initState() {
    super.initState();

    _value = widget.value;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final step = widget.value - _value;
    _value = widget.value;

    return AnimatedBuilder(
      animation: controller,
      // child: child,
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(10),
          child: CustomPaint(
            painter: _RadialProgressPainter(
                widget.color ?? Theme.of(context).colorScheme.primary,
                (widget.value - step) + (step * controller.value),
                widget.backgroundColor,
                widget.width,
                widget.stokeWidth),
          ),
        );
      },
    );
    // return CustomPaint(painter: _RadialProgressPainter(widget.value));
  }
}

class _RadialProgressPainter extends CustomPainter {
  final double value;
  final Color color;
  final Color? backgroundColor;
  final double? stokeWidth;
  final double? width;

  _RadialProgressPainter(this.color, this.value,
      [this.backgroundColor, this.width, this.stokeWidth]);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = stokeWidth ?? 4
      ..color = backgroundColor ?? Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * .5, size.height * .5);
    double radio = min(size.width * .5, size.height * .5);

    canvas.drawCircle(center, radio, paint);

    final arcPaint = Paint()
      ..strokeWidth = width ?? 10
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (value / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      angle,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
