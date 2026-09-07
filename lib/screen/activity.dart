import 'package:flutter/material.dart';
import 'package:motora/screen/activity/session_detail_page.dart';
import 'package:motora/utils/colors.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _AktivitasPageState();
}

class _AktivitasPageState extends State<ActivityPage> {
  String selectedFilter = 'Semua';

  final List<String> filters = ['Semua', 'Selesai', 'Berjalan', 'Dibatalkan'];

  final List<_ActivityData> activities = [
    _ActivityData(
      date: 'Hari ini',
      time: '08:15 - 13:42',
      platform: 'GrabFood',
      status: 'Selesai',
      orders: 18,
      duration: '5j 27m',
      income: 'Rp186.500',
      distance: '74,2 km',
      icon: Icons.fastfood_rounded,
      iconColor: Color(0xFF08A94F),
      iconBackground: Color(0xFFE1F4E8),
    ),
    _ActivityData(
      date: 'Kemarin',
      time: '09:05 - 15:18',
      platform: 'ShopeeFood',
      status: 'Selesai',
      orders: 21,
      duration: '6j 13m',
      income: 'Rp224.000',
      distance: '86,7 km',
      icon: Icons.shopping_bag_outlined,
      iconColor: Color(0xFFEE6A31),
      iconBackground: Color(0xFFFFE9DE),
    ),
    _ActivityData(
      date: '02 Sep 2026',
      time: '10:20 - 16:02',
      platform: 'Gojek',
      status: 'Selesai',
      orders: 16,
      duration: '5j 42m',
      income: 'Rp198.500',
      distance: '69,3 km',
      icon: Icons.two_wheeler_rounded,
      iconColor: Color(0xFF2680D9),
      iconBackground: Color(0xFFE5F0FF),
    ),
    _ActivityData(
      date: '01 Sep 2026',
      time: '08:45 - 12:10',
      platform: 'Lalamove',
      status: 'Dibatalkan',
      orders: 7,
      duration: '3j 25m',
      income: 'Rp72.000',
      distance: '31,8 km',
      icon: Icons.local_shipping_outlined,
      iconColor: Color(0xFF7655C9),
      iconBackground: Color(0xFFEDE6FF),
    ),
  ];

  List<_ActivityData> get filteredActivities {
    if (selectedFilter == 'Semua') {
      return activities;
    }

    return activities.where((item) => item.status == selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFEFE),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              sliver: SliverToBoxAdapter(child: _buildHeader()),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              sliver: SliverToBoxAdapter(child: _buildTodaySummary()),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              sliver: SliverToBoxAdapter(child: _buildFilters()),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 25),
              sliver: SliverToBoxAdapter(child: _buildActivityList()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aktivitas',
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.dark,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -.5,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Riwayat aktivitas narik kamu',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.muted,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F5F6),
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            size: 20,
            color: AppColors.dark,
          ),
        ),
      ],
    );
  }

  Widget _buildTodaySummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hari ini',
            style: TextStyle(
              fontSize: 11,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Rp186.500',
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
              _SummaryMetric(
                icon: Icons.receipt_long_outlined,
                value: '18',
                label: 'Order',
              ),
              _SummaryMetric(
                icon: Icons.access_time_rounded,
                value: '5j 27m',
                label: 'Durasi',
              ),
              _SummaryMetric(
                icon: Icons.route_outlined,
                value: '74,2 km',
                label: 'Jarak',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 7),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = selectedFilter == filter;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = filter;
              });
            },
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
                filter,
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

  Widget _buildActivityList() {
    final items = filteredActivities;

    if (items.isEmpty) {
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

    String? previousDate;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        final showDate = previousDate != item.date;
        previousDate = item.date;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showDate)
              Padding(
                padding: const EdgeInsets.only(bottom: 9, top: 2),
                child: Text(
                  item.date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ActivityCard(
                item: item,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SessionDetailPage(
                      date: item.date,
                      time: item.time,
                      platform: item.platform,
                      status: item.status,
                      orders: item.orders,
                      duration: item.duration,
                      income: item.income,
                      distance: item.distance,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class _SummaryMetric extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _SummaryMetric({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, size: 17, color: Colors.white.withOpacity(.9)),
          const SizedBox(width: 7),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                label,
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.white.withOpacity(.75),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActivityData {
  final String date;
  final String time;
  final String platform;
  final String status;
  final int orders;
  final String duration;
  final String income;
  final String distance;
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;

  const _ActivityData({
    required this.date,
    required this.time,
    required this.platform,
    required this.status,
    required this.orders,
    required this.duration,
    required this.income,
    required this.distance,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
  });
}

class _ActivityCard extends StatelessWidget {
  final _ActivityData item;
  final VoidCallback onTap;

  const _ActivityCard({required this.item, required this.onTap});

  Color get statusColor {
    switch (item.status) {
      case 'Dibatalkan':
        return const Color(0xFFE84B55);
      case 'Berjalan':
        return const Color(0xFFE09A18);
      default:
        return AppColors.green;
    }
  }

  Color get statusBackground {
    switch (item.status) {
      case 'Dibatalkan':
        return const Color(0xFFFFE7EA);
      case 'Berjalan':
        return const Color(0xFFFFF3D7);
      default:
        return const Color(0xFFEAF8EF);
    }
  }

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
                                color: statusBackground,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                item.status,
                                style: TextStyle(
                                  fontSize: 8,
                                  color: statusColor,
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
                    child: _ActivityStat(
                      icon: Icons.receipt_long_outlined,
                      value: '${item.orders}',
                      label: 'Order',
                    ),
                  ),
                  Expanded(
                    child: _ActivityStat(
                      icon: Icons.access_time_rounded,
                      value: item.duration,
                      label: 'Durasi',
                    ),
                  ),
                  Expanded(
                    child: _ActivityStat(
                      icon: Icons.route_outlined,
                      value: item.distance,
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
                    item.income,
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

class _ActivityStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _ActivityStat({
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
