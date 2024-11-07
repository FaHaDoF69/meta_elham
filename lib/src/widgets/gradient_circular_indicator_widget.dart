import 'package:flutter/material.dart';

import '../utils/theme/app_colors.dart'; // Import your AppColors

class GradientCircularProgressIndicator extends StatelessWidget {
  final double progress; // Value between 0 and 1

  const GradientCircularProgressIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: const Size(100, 100),
        painter: GradientCircularPainter(progress),
      ),
    );
  }
}

class GradientCircularPainter extends CustomPainter {
  final double progress;

  GradientCircularPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    const Gradient gradient = SweepGradient(
      startAngle: 0.0,
      endAngle: 3.14 * 2,
      colors: [
        AppColors.teal,
        AppColors.navy,
      ],
      stops: [0.0, 1.0],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - (paint.strokeWidth / 2);
    final sweepAngle = 3.14 * 2 * progress;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -3.14 / 2,
        sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
