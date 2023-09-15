import 'package:flutter/material.dart';

class DiagonalHeader extends StatelessWidget {
  const DiagonalHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(
            color: Theme.of(context).colorScheme.primary),
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

class _HeaderDiagonalPainter extends CustomPainter {
  final Color color;

  _HeaderDiagonalPainter({super.repaint, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Props
    paint.color = color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // Paint with paint and path
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
