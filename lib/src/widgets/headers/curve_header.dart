import 'package:flutter/material.dart';

class CurveHeader extends StatelessWidget {
  const CurveHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _CurveHeaderPainter(color: primary),
        child: SafeArea(
          child: Stack(
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}

class _CurveHeaderPainter extends CustomPainter {
  final Color color;

  _CurveHeaderPainter({super.repaint, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(size.width * .5,
        (size.height * .25) + (size.width * .5), size.width, size.height * .25);
    // path.lineTo(size.width * .5, size.height * .255);
    path.lineTo(size.width, size.height * .25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
