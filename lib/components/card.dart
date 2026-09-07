import 'package:flutter/material.dart';

class CardMotora extends StatelessWidget {
  final Widget child;
  final double? height;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color borderColor;

  const CardMotora({
    super.key,
    required this.child,
    this.height,
    this.padding = const EdgeInsets.all(16),
    this.color = Colors.white,
    this.borderColor = const Color(0xFFEFF1F3),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D101828),
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
