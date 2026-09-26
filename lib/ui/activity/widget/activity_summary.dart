import 'package:flutter/material.dart';
import 'package:motora/domain/models/activity/activity.dart';
import 'package:motora/ui/activity/widget/activity_summary_metric.dart';
import 'package:motora/utils/colors.dart';
import 'package:motora/utils/format.dart';

class ActivitySummary extends StatelessWidget {
  final List<Activity> activities;
  const ActivitySummary({super.key, required this.activities});

  int get income =>
      activities.fold<int>(0, (value, element) => value + element.income);

  int get orders =>
      activities.fold<int>(0, (value, element) => value + element.orders);

  int get distance =>
      activities.fold<int>(0, (value, element) => value + element.distance);

  Duration get duration => activities.fold<Duration>(
    Duration.zero,
    (value, element) => value + element.duration,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${activities.length} Hari Terkahir',
            style: TextStyle(
              fontSize: 11,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            formatRupiah(income),
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: -.7,
            ),
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              ActivitySummaryMetric(
                icon: Icons.receipt_long_outlined,
                value: "$orders",
                label: 'Order',
              ),
              ActivitySummaryMetric(
                icon: Icons.access_time_rounded,
                value:
                    '${duration.inHours}j ${duration.inMinutes.toString().substring(0, 2)}m',
                label: 'Durasi',
              ),
              ActivitySummaryMetric(
                icon: Icons.route_outlined,
                value: '$distance km',
                label: 'Jarak',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
