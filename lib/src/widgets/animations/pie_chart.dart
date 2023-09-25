import 'dart:math';

import 'package:fdesigns_app/src/models/models.dart';
import 'package:flutter/material.dart';

class PieChart extends StatefulWidget {
  const PieChart({Key? key}) : super(key: key);

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final List<PieChartData> data = [
    PieChartData(value: .2, color: Colors.red, id: '1'),
    PieChartData(value: .3, color: Colors.blue, id: '2'),
    PieChartData(value: .4, color: Colors.amber, id: '3'),
    PieChartData(value: .1, color: Colors.purple, id: '4'),
  ];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        child: CustomPaint(painter: _PieChartPainter(data, controller.value)),
      ),
    );
  }
}

class _PieChartPainter extends CustomPainter {
  final List<PieChartData> data;
  final double value;

  _PieChartPainter(this.data, this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width * .5, size.height * .5);
    double radio = min(size.width * .5, size.height * .5);

    double total = 0.0;

    for (var input in data) {
      double val = input.value * value;

      print('val: $val - value: $value');

      final paint = Paint()
        ..strokeWidth = 20
        ..color = input.color
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.butt;

      double angle = 2 * pi * val;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radio),
        (-pi / 2) + (2 * pi * total),
        angle,
        false,
        paint,
      );

      total += input.value;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
