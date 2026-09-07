import 'package:flutter/material.dart';
import 'package:motora/utils/colors.dart';

class FuelLevelSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const FuelLevelSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  String get _fuelLabel {
    if (value <= 10) {
      return 'Hampir Kosong';
    }

    if (value <= 25) {
      return 'Rendah';
    }

    if (value <= 50) {
      return 'Setengah';
    }

    if (value <= 75) {
      return 'Cukup';
    }

    return 'Penuh';
  }

  @override
  Widget build(BuildContext context) {
    final percentage = value.round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Level Bensin',
              style: TextStyle(
                color: AppColors.dark,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),

            Text(
              '$percentage%',
              style: const TextStyle(
                color: AppColors.green,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // Slider
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 8,

            activeTrackColor: AppColors.green,

            inactiveTrackColor: const Color(0xFFE8EAED),

            thumbColor: AppColors.green,

            overlayColor: AppColors.green.withValues(alpha: 0.12),

            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),

            overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),

            trackShape: const RoundedRectSliderTrackShape(),
          ),

          child: Slider(
            value: value.clamp(0, 100),
            min: 0,
            max: 100,
            divisions: 20,
            onChanged: onChanged,
          ),
        ),

        const SizedBox(height: 2),

        // E - F
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'E',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),

            Text(
              _fuelLabel,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),

            const Text(
              'F',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
