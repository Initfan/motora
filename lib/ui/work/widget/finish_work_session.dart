import 'package:flutter/material.dart';
import 'package:motora/model/income_model.dart';
import 'package:motora/utils/api.dart';
import 'package:motora/utils/colors.dart';
import 'package:motora/utils/format.dart';

class FinishWorkSessionPage extends StatefulWidget {
  final String sessionId;
  final String platform;
  final DateTime startTime;
  final DateTime finishTime;
  final double distance;
  final int totalOrder;
  final int income;

  const FinishWorkSessionPage({
    super.key,
    required this.platform,
    required this.distance,
    required this.totalOrder,
    required this.income,
    required this.startTime,
    required this.finishTime,
    required this.sessionId,
  });

  @override
  State<FinishWorkSessionPage> createState() => _FinishWorkSessionPageState();
}

class _FinishWorkSessionPageState extends State<FinishWorkSessionPage> {
  late Duration duration = widget.finishTime.difference(widget.startTime);
  late Future<List<IncomeModel>> futureIncome;

  @override
  void initState() {
    super.initState();
    futureIncome = getIncomes();
  }

  Future<List<IncomeModel>> getIncomes() async {
    final res = await api.get('/work/${widget.sessionId}/incomes');
    final data = res['data'] as List<dynamic>;
    return data.map((v) => IncomeModel.fromJson(v)).toList();
  }

  String get _duration {
    final hours = duration.inHours.toString().padLeft(2, '0');

    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');

    return '${hours}j ${minutes}m';
  }

  String get _average =>
      "${(widget.distance / duration.inHours).toString().substring(0, 3)} km/j";

  String _formatTime(DateTime time) => '${time.hour}:${time.minute}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildBack(context),
      ),
      backgroundColor: const Color(0xFFF8FAF9),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 30, 16, 30),
          children: [
            _buildHeaderCard(),

            const SizedBox(height: 16),

            _buildSessionInfo(),

            const SizedBox(height: 16),

            _buildIncomeBreakdown(widget.income, 0, 0),

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

  ElevatedButton _buildBack(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size.fromHeight(46),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        'Kembali ke Beranda',
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
      ),
    );
  }

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
            widget.platform,
            style: const TextStyle(
              color: AppColors.dark,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            "${widget.startTime} • ${_formatTime(widget.startTime)} - ${_formatTime(widget.finishTime)}",
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
                  "Selesai",
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
            formatRupiah(widget.income),
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
                  value: '${widget.totalOrder}',
                  label: 'Total Order',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MetricBox(
                  icon: Icons.access_time_rounded,
                  value: _duration,
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
                  value: "${widget.distance}",
                  label: 'Jarak',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MetricBox(
                  icon: Icons.speed_rounded,
                  value: _average,
                  label: 'Rata-rata',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIncomeBreakdown(int income, int bonus, int tip) {
    return _SectionCard(
      title: 'Pendapatan',
      child: Column(
        children: [
          _MoneyRow(title: 'Pendapatan order', value: formatRupiah(income)),
          _MoneyRow(title: 'Bonus / insentif', value: formatRupiah(bonus)),
          _MoneyRow(title: 'Tips', value: formatRupiah(tip)),
          const Divider(height: 22, color: Color(0xFFEDEFF1)),
          _MoneyRow(
            title: 'Total Pendapatan',
            value: formatRupiah(income + bonus + tip),
            isTotal: true,
            valueColor: AppColors.green,
          ),
        ],
      ),
    );
  }

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

  Widget _buildOrderList(BuildContext context) {
    return FutureBuilder<List<IncomeModel>>(
      future: futureIncome,
      builder: (context, snapshot) {
        return _SectionCard(
          title: 'Order Terbaru',
          trailing: Text(
            '${widget.totalOrder} order',
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          child: Column(
            children: [
              ...snapshot.data!.map((e) {
                DateTime time = DateTime.parse(e.createdAt!);
                return _OrderItem(
                  time: "${time.hour}:${time.minute}",
                  distance: e.distance!,
                  price: formatRupiah(e.amount!),
                );
              }),

              const SizedBox(height: 4),

              TextButton(
                onPressed: () {
                  showAllOrders(context, snapshot.data!);
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
      },
    );
  }

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

  void showAllOrders(BuildContext context, List<IncomeModel> incomes) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _AllOrdersSheet(incomes),
    );
  }
}

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

class _OrderItem extends StatelessWidget {
  final String time;
  final String price;
  final double distance;

  const _OrderItem({
    required this.time,
    required this.price,
    required this.distance,
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
              Icons.delivery_dining_rounded,
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
                  '$distance km',
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

class _AllOrdersSheet extends StatelessWidget {
  const _AllOrdersSheet(this.incomes);
  final List<IncomeModel> incomes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
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

          Padding(
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
                  "${incomes.length}",
                  style: TextStyle(color: AppColors.muted, fontSize: 11),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
              itemCount: incomes.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, color: Color(0xFFEDEFF1)),
              itemBuilder: (context, index) {
                final order = incomes[index];
                DateTime time = DateTime.parse(order.createdAt!);

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Row(
                    children: [
                      Text(
                        "${time.hour}:${time.minute}",
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
                              '${order.distance}',
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
                        formatRupiah(order.amount!),
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
