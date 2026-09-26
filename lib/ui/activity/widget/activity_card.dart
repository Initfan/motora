import 'package:flutter/material.dart';
import 'package:motora/domain/models/activity/activity.dart';
import 'package:motora/ui/activity/view_models/activity_view_model.dart';
import 'package:motora/ui/activity/widget/activity_stat.dart';
import 'package:motora/utils/colors.dart';
import 'package:motora/utils/format.dart';

class ActivityCard extends StatelessWidget {
  final Activity item;
  final VoidCallback onTap;

  final ActivityViewModel model;

  const ActivityCard({
    super.key,
    required this.item,
    required this.onTap,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE8EAED)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                      color: item.iconBackground,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Icon(item.icon, size: 21, color: item.iconColor),
                  ),

                  const SizedBox(width: 11),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              item.platform,
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.dark,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 7),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAF8EF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                item.status,
                                style: TextStyle(
                                  fontSize: 8,
                                  color: AppColors.green,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item.time,
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.muted,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.chevron_right_rounded,
                    size: 20,
                    color: AppColors.muted,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Container(height: 1, color: const Color(0xFFF0F1F2)),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: ActivityStat(
                      icon: Icons.receipt_long_outlined,
                      value: '${item.orders}',
                      label: 'Order',
                    ),
                  ),
                  Expanded(
                    child: ActivityStat(
                      icon: Icons.access_time_rounded,
                      value:
                          "${item.duration.inHours}j ${item.duration.inMinutes.toString().substring(0, 2)}jr",
                      label: 'Durasi',
                    ),
                  ),
                  Expanded(
                    child: ActivityStat(
                      icon: Icons.route_outlined,
                      value: model.formatDistance(item.distance),
                      label: 'Jarak',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  const Text(
                    'Pendapatan',
                    style: TextStyle(
                      fontSize: 9,
                      color: AppColors.muted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    formatRupiah(item.income),
                    style: TextStyle(
                      fontSize: 12,
                      color: item.status == 'Dibatalkan'
                          ? AppColors.muted
                          : AppColors.green,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
