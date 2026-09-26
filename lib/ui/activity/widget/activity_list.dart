import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:motora/screen/activity/session_detail_page.dart';
import 'package:motora/ui/activity/view_models/activity_view_model.dart';
import 'package:motora/ui/activity/widget/activity_card.dart';
import 'package:motora/utils/colors.dart';

class ActivityList extends StatelessWidget {
  final ActivityViewModel model;
  const ActivityList({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final items = model.state.activities;

    if (items == null) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        alignment: Alignment.center,
        child: const Column(
          children: [
            Icon(Icons.history_rounded, size: 42, color: Color(0xFFD2D6DA)),
            SizedBox(height: 10),
            Text(
              'Belum ada aktivitas',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.muted,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 9, top: 2),
              child: Text(
                DateFormat('d MMM y').format(item.date),
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.dark,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ActivityCard(
                model: model,
                item: item,
                onTap: () {},
                // onTap: () => Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (_) => SessionDetailPage(
                //       date: item.date,
                //       time: item.time,
                //       platform: item.platform,
                //       status: item.status,
                //       orders: item.orders,
                //       duration: item.duration,
                //       income: item.income,
                //       distance: item.distance,
                //     ),
                //   ),
                // ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
