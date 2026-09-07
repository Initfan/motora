import 'package:flutter/material.dart';
import 'package:motora/screen/auth/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const Color primaryGreen = Color(0xFF16A34A);
  static const Color darkText = Color(0xFF151923);
  static const Color borderColor = Color(0xFFE5E7EB);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final scale = size.width / 390.0;

    double s(double value) => value * scale;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: s(-48),
              top: s(105),
              child: _BackgroundCircle(size: s(118)),
            ),

            Positioned(
              left: s(-62),
              top: s(335),
              child: _BackgroundCircle(size: s(135)),
            ),

            Positioned(
              right: s(-45),
              bottom: s(-35),
              child: _BackgroundCircle(size: s(120)),
            ),

            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(height: s(78)),

                  SizedBox(
                    height: s(62),
                    child: Image.asset(
                      'assets/motocare_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: s(45)),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: s(35)),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: _Tagline(),
                    ),
                  ),

                  SizedBox(height: s(38)),

                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          top: s(165),
                          child: _MotionLines(scale: scale),
                        ),

                        Positioned(
                          left: s(35),
                          right: s(35),
                          top: s(8),
                          bottom: s(10),
                          child: Image.asset(
                            'assets/motocare_rider.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: s(30)),
                    child: Column(
                      children: [
                        _PrimaryButton(
                          text: 'Mulai',
                          color: primaryGreen,
                          onPressed: () {},
                        ),

                        SizedBox(height: s(16)),

                        _SecondaryButton(
                          text: 'Masuk',
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginPage(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: s(48)),

                  Text(
                    'Versi 1.0.0',
                    style: TextStyle(
                      fontSize: s(12),
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF6B7280),
                      letterSpacing: 0.1,
                    ),
                  ),

                  SizedBox(height: s(27)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tagline extends StatelessWidget {
  const _Tagline();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Motor sehat.\nProfit terukur.',
      style: const TextStyle(
        fontSize: 27,
        height: 1.18,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.8,
        color: Color(0xFF151923),
      ),
    );
  }
}

class _BackgroundCircle extends StatelessWidget {
  final double size;

  const _BackgroundCircle({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFEFFAF2),
      ),
    );
  }
}

class _MotionLines extends StatelessWidget {
  final double scale;

  const _MotionLines({required this.scale});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150 * scale,
      child: CustomPaint(painter: _MotionLinePainter(scale: scale)),
    );
  }
}

class _MotionLinePainter extends CustomPainter {
  final double scale;

  _MotionLinePainter({required this.scale});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.5 * scale
      ..color = const Color(0xFFBFE8CB);

    final path1 = Path();

    path1.moveTo(25 * scale, 70 * scale);

    path1.cubicTo(
      110 * scale,
      63 * scale,
      260 * scale,
      73 * scale,
      390 * scale,
      67 * scale,
    );

    canvas.drawPath(path1, paint);

    final path2 = Path();

    path2.moveTo(0, 92 * scale);

    path2.cubicTo(
      110 * scale,
      84 * scale,
      280 * scale,
      97 * scale,
      420 * scale,
      88 * scale,
    );

    canvas.drawPath(path2, paint);

    final path3 = Path();

    path3.moveTo(50 * scale, 113 * scale);

    path3.cubicTo(
      150 * scale,
      106 * scale,
      290 * scale,
      118 * scale,
      410 * scale,
      108 * scale,
    );

    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const _PrimaryButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        child: Text(text),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _SecondaryButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF151923),
          side: const BorderSide(color: Color(0xFFE5E7EB), width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        child: Text(text),
      ),
    );
  }
}
