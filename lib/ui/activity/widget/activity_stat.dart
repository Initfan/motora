import 'package:flutter/material.dart';
import 'package:motora/utils/colors.dart';

class ActivityStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const ActivityStat({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15, color: AppColors.muted),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.dark,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 8, color: AppColors.muted),
            ),
          ],
        ),
      ],
    );
  }
}
