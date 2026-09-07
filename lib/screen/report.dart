import 'package:flutter/material.dart';
import 'package:motora/utils/colors.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => ReportPageState();
}

class ReportPageState extends State<ReportPage> {
  int _period = 1;

  final List<String> _periods = ['Harian', 'Mingguan', 'Bulanan'];

  @override
  Widget build(BuildContext context) {
    final data = _getReportData();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAF9),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Laporan',
          style: TextStyle(
            color: AppColors.dark,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
          children: [
            _buildPeriodFilter(),

            const SizedBox(height: 16),

            _buildProfitCard(data),

            const SizedBox(height: 16),

            _buildIncomeSummary(data),

            const SizedBox(height: 16),

            _buildChartCard(data),

            const SizedBox(height: 16),

            _buildOperationalCard(data),

            const SizedBox(height: 16),

            _buildPlatformCard(data),

            const SizedBox(height: 16),

            _buildWorkSummary(data),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DATA
  // ============================================================

  Map<String, dynamic> _getReportData() {
    if (_period == 0) {
      return {
        'income': 186500,
        'cost': 42500,
        'profit': 144000,
        'orders': 18,
        'hours': '5j 27m',
        'distance': '74,2 km',
        'average': 10361,
        'chart': [18000, 26000, 21000, 32000, 27000, 38500, 24000],
        'labels': ['06', '08', '10', '12', '14', '16', '18'],
      };
    }

    if (_period == 1) {
      return {
        'income': 1287500,
        'cost': 286500,
        'profit': 1001000,
        'orders': 119,
        'hours': '36j 42m',
        'distance': '486,5 km',
        'average': 10819,
        'chart': [142000, 176500, 158000, 224000, 198500, 165000, 223500],
        'labels': ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'],
      };
    }

    return {
      'income': 5248000,
      'cost': 1145000,
      'profit': 4103000,
      'orders': 487,
      'hours': '148j 35m',
      'distance': '1.924 km',
      'average': 10775,
      'chart': [680000, 745000, 812000, 690000, 834000, 726000, 761000],
      'labels': ['M1', 'M2', 'M3', 'M4', 'M5', 'M6', 'M7'],
    };
  }

  // ============================================================
  // PERIOD FILTER
  // ============================================================

  Widget _buildPeriodFilter() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE4E7EC)),
      ),
      child: Row(
        children: List.generate(_periods.length, (index) {
          final selected = _period == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _period = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selected ? AppColors.green : Colors.transparent,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(
                  _periods[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    color: selected ? Colors.white : AppColors.muted,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ============================================================
  // PROFIT CARD
  // ============================================================

  Widget _buildProfitCard(Map<String, dynamic> data) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF08A94F), Color(0xFF079443)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.green.withOpacity(0.18),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.trending_up_rounded, color: Colors.white, size: 22),
              SizedBox(width: 8),
              Text(
                'Profit Bersih',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            _formatRupiah(data['profit']),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.16),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.white,
                      size: 14,
                    ),
                    SizedBox(width: 3),
                    Text(
                      '12,8%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'vs periode sebelumnya',
                style: TextStyle(color: Colors.white70, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INCOME SUMMARY
  // ============================================================

  Widget _buildIncomeSummary(Map<String, dynamic> data) {
    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            icon: Icons.account_balance_wallet_outlined,
            iconColor: AppColors.green,
            iconBackground: const Color(0xFFE5F7EC),
            title: 'Pendapatan',
            value: _formatRupiah(data['income']),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _SummaryCard(
            icon: Icons.local_gas_station_outlined,
            iconColor: const Color(0xFFE59B20),
            iconBackground: const Color(0xFFFFF3DC),
            title: 'Operasional',
            value: _formatRupiah(data['cost']),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // CHART
  // ============================================================

  Widget _buildChartCard(Map<String, dynamic> data) {
    final values = List<int>.from(data['chart']);
    final labels = List<String>.from(data['labels']);

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Grafik Pendapatan',
                style: TextStyle(
                  color: AppColors.dark,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Icon(Icons.more_horiz_rounded, color: AppColors.muted),
            ],
          ),

          const SizedBox(height: 4),

          Text(
            _period == 0
                ? 'Pendapatan hari ini'
                : _period == 1
                ? 'Pendapatan 7 hari terakhir'
                : 'Pendapatan periode ini',
            style: const TextStyle(color: AppColors.muted, fontSize: 12),
          ),

          const SizedBox(height: 24),

          SizedBox(
            height: 190,
            child: CustomPaint(
              painter: _IncomeChartPainter(values: values),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 28, left: 8, right: 8),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: labels
                        .map(
                          (label) => Text(
                            label,
                            style: const TextStyle(
                              color: AppColors.muted,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'Pendapatan',
                style: TextStyle(color: AppColors.muted, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // OPERATIONAL
  // ============================================================

  Widget _buildOperationalCard(Map<String, dynamic> data) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Biaya Operasional',
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Pengeluaran selama narik',
            style: TextStyle(color: AppColors.muted, fontSize: 12),
          ),

          const SizedBox(height: 16),

          _CostRow(
            icon: Icons.local_gas_station_rounded,
            title: 'Bensin',
            value: 'Rp168.000',
          ),

          _CostRow(
            icon: Icons.build_rounded,
            title: 'Maintenance',
            value: 'Rp75.000',
          ),

          _CostRow(
            icon: Icons.local_parking_rounded,
            title: 'Parkir',
            value: 'Rp28.500',
          ),

          _CostRow(
            icon: Icons.restaurant_rounded,
            title: 'Makan & Minum',
            value: 'Rp15.000',
          ),

          const Divider(height: 24, color: Color(0xFFEAECEF)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Operasional',
                style: TextStyle(
                  color: AppColors.dark,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                _formatRupiah(data['cost']),
                style: const TextStyle(
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
  // PLATFORM
  // ============================================================

  Widget _buildPlatformCard(Map<String, dynamic> data) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Performa Platform',
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Kontribusi pendapatan per platform',
            style: TextStyle(color: AppColors.muted, fontSize: 12),
          ),

          const SizedBox(height: 18),

          _PlatformRow(
            name: 'GrabFood',
            amount: 'Rp486.500',
            percentage: 0.38,
            orders: '44 orders',
            logoColor: const Color(0xFF00A651),
          ),

          const SizedBox(height: 16),

          _PlatformRow(
            name: 'ShopeeFood',
            amount: 'Rp341.000',
            percentage: 0.27,
            orders: '31 orders',
            logoColor: const Color(0xFFEE4D2D),
          ),

          const SizedBox(height: 16),

          _PlatformRow(
            name: 'Gojek',
            amount: 'Rp298.500',
            percentage: 0.23,
            orders: '27 orders',
            logoColor: const Color(0xFF00880A),
          ),

          const SizedBox(height: 16),

          _PlatformRow(
            name: 'Lalamove',
            amount: 'Rp161.500',
            percentage: 0.12,
            orders: '17 orders',
            logoColor: const Color(0xFFFFB800),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // WORK SUMMARY
  // ============================================================

  Widget _buildWorkSummary(Map<String, dynamic> data) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ringkasan Aktivitas',
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _WorkMetric(
                  icon: Icons.receipt_long_rounded,
                  value: '${data['orders']}',
                  label: 'Total Order',
                ),
              ),
              Expanded(
                child: _WorkMetric(
                  icon: Icons.access_time_rounded,
                  value: data['hours'],
                  label: 'Jam Narik',
                ),
              ),
              Expanded(
                child: _WorkMetric(
                  icon: Icons.route_rounded,
                  value: data['distance'],
                  label: 'Jarak',
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F9F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColors.green.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.payments_outlined,
                    color: AppColors.green,
                    size: 20,
                  ),
                ),

                const SizedBox(width: 12),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rata-rata per order',
                        style: TextStyle(color: AppColors.muted, fontSize: 11),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Rp10.819',
                        style: TextStyle(
                          color: AppColors.dark,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: AppColors.muted,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // HELPERS
  // ============================================================

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: const Color(0xFFE8EAED)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.025),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  String _formatRupiah(int value) {
    final text = value.toString();
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i > 0 && (text.length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(text[i]);
    }

    return 'Rp${buffer.toString()}';
  }
}

// ================================================================
// SUMMARY CARD
// ================================================================

class _SummaryCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String value;

  const _SummaryCard({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8EAED)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 19),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            value,
            style: const TextStyle(
              color: AppColors.dark,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// COST ROW
// ================================================================

class _CostRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _CostRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFF4F5F6),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: const Color(0xFF667085), size: 18),
          ),

          const SizedBox(width: 11),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.dark,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              color: AppColors.dark,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// PLATFORM ROW
// ================================================================

class _PlatformRow extends StatelessWidget {
  final String name;
  final String amount;
  final String orders;
  final double percentage;
  final Color logoColor;

  const _PlatformRow({
    required this.name,
    required this.amount,
    required this.orders,
    required this.percentage,
    required this.logoColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: logoColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  name.substring(0, 1),
                  style: TextStyle(
                    color: logoColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 11),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: AppColors.dark,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    orders,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),

            Text(
              amount,
              style: const TextStyle(
                color: AppColors.dark,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),

        const SizedBox(height: 9),

        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: percentage,
            minHeight: 6,
            backgroundColor: const Color(0xFFEFF1F2),
            valueColor: AlwaysStoppedAnimation<Color>(logoColor),
          ),
        ),
      ],
    );
  }
}

// ================================================================
// WORK METRIC
// ================================================================

class _WorkMetric extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _WorkMetric({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.green, size: 21),
        const SizedBox(height: 7),
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.dark,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.muted, fontSize: 10),
        ),
      ],
    );
  }
}

// ================================================================
// CHART PAINTER
// ================================================================

class _IncomeChartPainter extends CustomPainter {
  final List<int> values;

  _IncomeChartPainter({required this.values});

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty) return;

    final chartHeight = size.height - 34;
    final chartWidth = size.width;

    final gridPaint = Paint()
      ..color = const Color(0xFFEDEFF1)
      ..strokeWidth = 1;

    final linePaint = Paint()
      ..color = AppColors.green
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final dotPaint = Paint()
      ..color = AppColors.green
      ..style = PaintingStyle.fill;

    // Grid
    for (int i = 0; i < 4; i++) {
      final y = (chartHeight / 3) * i;

      canvas.drawLine(Offset(0, y), Offset(chartWidth, y), gridPaint);
    }

    final maxValue = values.reduce((a, b) => a > b ? a : b);

    final minValue = values.reduce((a, b) => a < b ? a : b);

    final range = maxValue - minValue == 0 ? 1 : maxValue - minValue;

    final points = <Offset>[];

    for (int i = 0; i < values.length; i++) {
      final x = values.length == 1
          ? chartWidth / 2
          : (chartWidth / (values.length - 1)) * i;

      final normalized = (values[i] - minValue) / range;

      final y = chartHeight - (normalized * (chartHeight - 15));

      points.add(Offset(x, y));
    }

    final path = Path();

    for (int i = 0; i < points.length; i++) {
      if (i == 0) {
        path.moveTo(points[i].dx, points[i].dy);
      } else {
        final previous = points[i - 1];
        final current = points[i];

        final controlPoint1 = Offset(
          previous.dx + (current.dx - previous.dx) / 2,
          previous.dy,
        );

        final controlPoint2 = Offset(
          previous.dx + (current.dx - previous.dx) / 2,
          current.dy,
        );

        path.cubicTo(
          controlPoint1.dx,
          controlPoint1.dy,
          controlPoint2.dx,
          controlPoint2.dy,
          current.dx,
          current.dy,
        );
      }
    }

    canvas.drawPath(path, linePaint);

    for (final point in points) {
      canvas.drawCircle(point, 4, dotPaint);

      final outerPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;

      canvas.drawCircle(point, 2, outerPaint);

      canvas.drawCircle(point, 2, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _IncomeChartPainter oldDelegate) {
    return oldDelegate.values != values;
  }
}
