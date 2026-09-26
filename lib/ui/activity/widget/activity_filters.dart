import 'package:flutter/material.dart';
import 'package:motora/ui/activity/view_models/activity_view_model.dart';
import 'package:motora/utils/colors.dart';

class ActivityFilters extends StatelessWidget {
  final ActivityViewModel model;

  const ActivityFilters({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final ranges = model.generateWeekRanges();

    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: ranges.length,
        separatorBuilder: (_, __) => const SizedBox(width: 7),
        itemBuilder: (context, index) {
          final filter = ranges[index];
          final isSelected =
              ranges[index].label == model.state.selectedFilter?.label;

          return GestureDetector(
            onTap: () => model.selectFilter(filter),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.green : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? AppColors.green : const Color(0xFFE1E4E7),
                ),
              ),
              child: Text(
                filter.label,
                style: TextStyle(
                  fontSize: 11,
                  color: isSelected ? Colors.white : AppColors.dark,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
