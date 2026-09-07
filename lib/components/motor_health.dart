import 'package:flutter/material.dart';
import 'package:motora/components/card.dart';
import 'package:motora/utils/colors.dart';
import 'dart:math';

class MotorHealth extends StatelessWidget {
  const MotorHealth({super.key});

  @override
  Widget build(BuildContext context) {
    return CardMotora(
      height: 175,
      color: const Color(0xFFF3FCF6),
      borderColor: const Color(0xFFDCEFE3),
      padding: const EdgeInsets.fromLTRB(18, 15, 13, 12),
      child: Stack(
        children: [
          const Text(
            'Motor Health',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.dark,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '82',
                      style: TextStyle(
                        fontSize: 47,
                        height: .9,
                        fontWeight: FontWeight.w400,
                        color: AppColors.dark,
                        letterSpacing: -2,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '/ 100',
                      style: TextStyle(fontSize: 12, color: AppColors.muted),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Text(
                  'Baik',
                  style: TextStyle(fontSize: 12, color: AppColors.muted),
                ),
              ],
            ),
          ),
          Positioned(
            right: 19,
            bottom: 15,
            child: SizedBox(
              width: 138,
              height: 95,
              child: CustomPaint(painter: _HealthGaugePainter(progress: 62)),
            ),
          ),
        ],
      ),
    );
  }
}

class _HealthGaugePainter extends CustomPainter {
  final double progress;

  _HealthGaugePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * .72);

    final radius = size.width * .39;

    final backgroundPaint = Paint()
      ..color = const Color(0xFFDDEBE2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = AppColors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: center, radius: radius);

    // Background
    canvas.drawArc(rect, pi, pi, false, backgroundPaint);

    // Progress
    canvas.drawArc(
      rect,
      pi,
      pi * progress.clamp(0.0, 1.0),
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _HealthGaugePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
