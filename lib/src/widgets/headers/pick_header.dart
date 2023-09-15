import 'package:flutter/material.dart';

class PickHeader extends StatelessWidget {
  const PickHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _PickHeaderPainter(color: primary),
      ),
    );
  }
}

class _PickHeaderPainter extends CustomPainter {
  final Color color;

  _PickHeaderPainter({super.repaint, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    path.lineTo(0, size.height * .3);
    path.lineTo(size.width * .5, size.height * .35);
    path.lineTo(size.width, size.height * .3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
