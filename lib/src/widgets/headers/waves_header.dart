import 'package:flutter/material.dart';

class WavesHeader extends StatelessWidget {
  const WavesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _WavesHeaderPainter(color: primary),
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

class _WavesHeaderPainter extends CustomPainter {
  final Color color;

  _WavesHeaderPainter({super.repaint, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // Top
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(size.width * .25, size.height * .30, size.width * .5,
        size.height * .25);
    path.quadraticBezierTo(
        size.width * .75, size.height * .20, size.width, size.height * .25);
    path.lineTo(size.width, size.height * .25);
    path.lineTo(size.width, 0);

    // final height = size.height;
    // final width = size.width;

    // // Bottom
    // path.moveTo(0, height);
    // path.lineTo(0, height * .8);
    // path.quadraticBezierTo(width * .25, height * .75, width * .5, height * .8);
    // path.quadraticBezierTo(width * .75, height * .85, width, height * .8);
    // path.lineTo(width, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
