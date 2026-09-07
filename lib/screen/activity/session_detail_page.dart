import 'package:flutter/material.dart';
import 'package:motora/utils/colors.dart';

class SessionDetailPage extends StatelessWidget {
  final String date;
  final String time;
  final String platform;
  final String status;
  final int orders;
  final String duration;
  final String income;
  final String distance;

  const SessionDetailPage({
    super.key,
    this.date = 'Hari ini',
    this.time = '08:15 - 13:42',
    this.platform = 'GrabFood',
    this.status = 'Selesai',
    this.orders = 18,
    this.duration = '5j 27m',
    this.income = 'Rp186.500',
    this.distance = '74,2 km',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAF9),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.dark,
            size: 20,
          ),
        ),
        title: const Text(
          'Detail Sesi',
          style: TextStyle(
            color: AppColors.dark,
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 30),
          children: [
            _buildHeaderCard(),

            const SizedBox(height: 16),

            _buildSessionInfo(),

            const SizedBox(height: 16),

            _buildIncomeBreakdown(),

            const SizedBox(height: 16),

            _buildOperationalCost(),

            const SizedBox(height: 16),

            _buildOrderList(context),

            const SizedBox(height: 16),

            _buildProfitCard(),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E8EB)),
      ),
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFE5F7EC),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(
                Icons.delivery_dining_rounded,
                color: AppColors.green,
                size: 31,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            platform,
            style: const TextStyle(
              color: AppColors.dark,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            '$date • $time',
            style: const TextStyle(color: AppColors.muted, fontSize: 12),
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFE5F7EC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.green,
                  size: 15,
                ),
                const SizedBox(width: 5),
                Text(
                  status,
                  style: const TextStyle(
                    color: AppColors.green,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          const Divider(color: Color(0xFFEDEFF1), height: 1),

          const SizedBox(height: 18),

          const Text(
            'Total Pendapatan',
            style: TextStyle(color: AppColors.muted, fontSize: 12),
          ),

          const SizedBox(height: 5),

          Text(
            income,
            style: const TextStyle(
              color: AppColors.green,
              fontSize: 29,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SESSION INFO
  // ============================================================

  Widget _buildSessionInfo() {
    return _SectionCard(
      title: 'Ringkasan Sesi',
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _MetricBox(
                  icon: Icons.receipt_long_rounded,
                  value: '$orders',
                  label: 'Total Order',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MetricBox(
                  icon: Icons.access_time_rounded,
                  value: duration,
                  label: 'Durasi',
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: _MetricBox(
                  icon: Icons.route_rounded,
                  value: distance,
                  label: 'Jarak',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MetricBox(
                  icon: Icons.speed_rounded,
                  value: '13,6 km/j',
                  label: 'Rata-rata',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INCOME
  // ============================================================

  Widget _buildIncomeBreakdown() {
    return _SectionCard(
      title: 'Pendapatan',
      child: Column(
        children: [
          _MoneyRow(title: 'Pendapatan order', value: 'Rp158.500'),
          _MoneyRow(title: 'Bonus / insentif', value: 'Rp20.000'),
          _MoneyRow(title: 'Tips', value: 'Rp8.000'),
          const Divider(height: 22, color: Color(0xFFEDEFF1)),
          _MoneyRow(
            title: 'Total Pendapatan',
            value: income,
            isTotal: true,
            valueColor: AppColors.green,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // COST
  // ============================================================

  Widget _buildOperationalCost() {
    return _SectionCard(
      title: 'Biaya Operasional',
      child: Column(
        children: [
          _MoneyRow(
            title: 'Bensin',
            value: '- Rp25.000',
            valueColor: const Color(0xFFD92D20),
          ),
          _MoneyRow(
            title: 'Parkir',
            value: '- Rp7.500',
            valueColor: const Color(0xFFD92D20),
          ),
          _MoneyRow(
            title: 'Makan & minum',
            value: '- Rp10.000',
            valueColor: const Color(0xFFD92D20),
          ),
          const Divider(height: 22, color: Color(0xFFEDEFF1)),
          _MoneyRow(
            title: 'Total Biaya',
            value: '- Rp42.500',
            isTotal: true,
            valueColor: const Color(0xFFD92D20),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ORDERS
  // ============================================================

  Widget _buildOrderList(BuildContext context) {
    final ordersData = [
      {
        'time': '08:27',
        'pickup': 'Kemang',
        'drop': 'Mampang',
        'price': 'Rp12.500',
      },
      {
        'time': '08:51',
        'pickup': 'Mampang',
        'drop': 'Kuningan',
        'price': 'Rp14.000',
      },
      {
        'time': '09:18',
        'pickup': 'Kuningan',
        'drop': 'Setiabudi',
        'price': 'Rp10.500',
      },
      {
        'time': '09:42',
        'pickup': 'Setiabudi',
        'drop': 'Menteng',
        'price': 'Rp13.500',
      },
    ];

    return _SectionCard(
      title: 'Order Terbaru',
      trailing: Text(
        '$orders order',
        style: const TextStyle(
          color: AppColors.muted,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Column(
        children: [
          ...ordersData.map(
            (order) => _OrderItem(
              time: order['time']!,
              pickup: order['pickup']!,
              drop: order['drop']!,
              price: order['price']!,
            ),
          ),

          const SizedBox(height: 4),

          TextButton(
            onPressed: () {
              _showAllOrders(context);
            },
            child: const Text(
              'Lihat semua order',
              style: TextStyle(
                color: AppColors.green,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PROFIT
  // ============================================================

  Widget _buildProfitCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F8EF),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFCDEED9)),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.green.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.trending_up_rounded,
              color: AppColors.green,
              size: 23,
            ),
          ),

          const SizedBox(width: 13),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profit Bersih',
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Rp144.000',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),

          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Margin',
                style: TextStyle(color: AppColors.muted, fontSize: 10),
              ),
              SizedBox(height: 3),
              Text(
                '77,2%',
                style: TextStyle(
                  color: AppColors.dark,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SHOW ALL ORDERS
  // ============================================================

  void _showAllOrders(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return const _AllOrdersSheet();
      },
    );
  }
}

// ================================================================
// SECTION CARD
// ================================================================

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? trailing;

  const _SectionCard({required this.title, required this.child, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE6E9EC)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.dark,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),

          const SizedBox(height: 16),

          child,
        ],
      ),
    );
  }
}

// ================================================================
// METRIC BOX
// ================================================================

class _MetricBox extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _MetricBox({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.green, size: 20),

          const SizedBox(width: 9),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.dark,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: AppColors.muted, fontSize: 9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// MONEY ROW
// ================================================================

class _MoneyRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isTotal;
  final Color? valueColor;

  const _MoneyRow({
    required this.title,
    required this.value,
    this.isTotal = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: isTotal ? AppColors.dark : AppColors.muted,
                fontSize: isTotal ? 13 : 12,
                fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? AppColors.dark,
              fontSize: isTotal ? 14 : 12,
              fontWeight: isTotal ? FontWeight.w800 : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// ORDER ITEM
// ================================================================

class _OrderItem extends StatelessWidget {
  final String time;
  final String pickup;
  final String drop;
  final String price;

  const _OrderItem({
    required this.time,
    required this.pickup,
    required this.drop,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFE5F7EC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.green,
              size: 19,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        color: AppColors.dark,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 7),
                    const Text(
                      'Selesai',
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  '$pickup → $drop',
                  style: const TextStyle(color: AppColors.muted, fontSize: 10),
                ),
              ],
            ),
          ),

          Text(
            price,
            style: const TextStyle(
              color: AppColors.dark,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// ALL ORDERS SHEET
// ================================================================

class _AllOrdersSheet extends StatelessWidget {
  const _AllOrdersSheet();

  @override
  Widget build(BuildContext context) {
    final orders = [
      ['08:27', 'Kemang', 'Mampang', 'Rp12.500'],
      ['08:51', 'Mampang', 'Kuningan', 'Rp14.000'],
      ['09:18', 'Kuningan', 'Setiabudi', 'Rp10.500'],
      ['09:42', 'Setiabudi', 'Menteng', 'Rp13.500'],
      ['10:15', 'Menteng', 'Senen', 'Rp11.000'],
      ['10:47', 'Senen', 'Cikini', 'Rp15.000'],
      ['11:20', 'Cikini', 'Matraman', 'Rp12.500'],
      ['12:04', 'Matraman', 'Tebet', 'Rp14.500'],
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.72,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),

          Container(
            width: 42,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFD0D5DD),
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Semua Order',
                  style: TextStyle(
                    color: AppColors.dark,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Spacer(),
                Text(
                  '18 order',
                  style: TextStyle(color: AppColors.muted, fontSize: 11),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
              itemCount: orders.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, color: Color(0xFFEDEFF1)),
              itemBuilder: (context, index) {
                final order = orders[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Row(
                    children: [
                      Text(
                        order[0],
                        style: const TextStyle(
                          color: AppColors.muted,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${order[1]} → ${order[2]}',
                              style: const TextStyle(
                                color: AppColors.dark,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 3),
                            const Text(
                              'Order selesai',
                              style: TextStyle(
                                color: AppColors.green,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Text(
                        order[3],
                        style: const TextStyle(
                          color: AppColors.dark,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
