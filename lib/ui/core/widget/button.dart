import 'package:flutter/material.dart';
import 'package:motora/utils/colors.dart';

class Button extends StatelessWidget {
  final void Function() onPressed;
  final bool isLoading;
  final Widget? child;
  final String? text;
  final IconData? icon;
  const Button({
    super.key,
    required this.onPressed,
    required this.isLoading,
    this.child,
    this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: isLoading
          ? CircularProgressIndicator(
              color: Colors.white,
              constraints: BoxConstraints(minWidth: 20, minHeight: 20),
            )
          : child ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 20),
                    SizedBox(width: 5),
                    Text(
                      text ?? '',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
    );
  }
}
