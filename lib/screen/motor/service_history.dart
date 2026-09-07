import 'package:flutter/material.dart';
import 'package:motora/utils/colors.dart';

class _ServiceHistoryData {
  final String date;
  final String day;
  final String month;
  final String year;
  final String odometer;
  final String title;
  final String workshop;
  final String cost;
  final List<String> items;

  const _ServiceHistoryData({
    required this.date,
    required this.day,
    required this.month,
    required this.year,
    required this.odometer,
    required this.title,
    required this.workshop,
    required this.cost,
    required this.items,
  });
}

class ServiceHistoryPage extends StatefulWidget {
  const ServiceHistoryPage({super.key});

  @override
  State<ServiceHistoryPage> createState() => _ServiceHistoryPageState();
}

class _ServiceHistoryPageState extends State<ServiceHistoryPage> {
  String selectedYear = 'Semua';

  final List<String> years = ['Semua', '2026', '2025', '2024'];

  final List<_ServiceHistoryData> history = [
    _ServiceHistoryData(
      date: '12 Agu 2026',
      day: '12',
      month: 'AGU',
      year: '2026',
      odometer: '35.724 km',
      title: 'Servis Rutin',
      workshop: 'Bengkel Motor Jaya',
      cost: 'Rp185.000',
      items: [
        'Ganti oli mesin',
        'Cek kampas rem',
        'Cek tekanan ban',
        'Cek CVT',
      ],
    ),
    _ServiceHistoryData(
      date: '18 Mei 2026',
      day: '18',
      month: 'MEI',
      year: '2026',
      odometer: '32.850 km',
      title: 'Ganti Oli + CVT',
      workshop: 'Honda AHASS',
      cost: 'Rp275.000',
      items: ['Ganti oli mesin', 'Servis CVT', 'Bersihkan filter udara'],
    ),
    _ServiceHistoryData(
      date: '03 Feb 2026',
      day: '03',
      month: 'FEB',
      year: '2026',
      odometer: '29.420 km',
      title: 'Servis Rutin',
      workshop: 'Bengkel Motor Jaya',
      cost: 'Rp160.000',
      items: ['Ganti oli mesin', 'Cek rem depan & belakang', 'Cek aki'],
    ),
    _ServiceHistoryData(
      date: '21 Okt 2025',
      day: '21',
      month: 'OKT',
      year: '2025',
      odometer: '26.180 km',
      title: 'Servis Besar',
      workshop: 'Honda AHASS',
      cost: 'Rp485.000',
      items: [
        'Ganti oli mesin',
        'Servis CVT',
        'Ganti busi',
        'Cek sistem pengereman',
        'Cek aki',
      ],
    ),
    _ServiceHistoryData(
      date: '09 Jul 2025',
      day: '09',
      month: 'JUL',
      year: '2025',
      odometer: '22.650 km',
      title: 'Ganti Oli',
      workshop: 'Bengkel Motor Jaya',
      cost: 'Rp95.000',
      items: ['Ganti oli mesin', 'Cek kondisi motor'],
    ),
  ];

  List<_ServiceHistoryData> get filteredHistory {
    if (selectedYear == 'Semua') {
      return history;
    }

    return history.where((item) => item.year == selectedYear).toList();
  }

  void _showDetail(_ServiceHistoryData item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _ServiceDetailSheet(item: item),
    );
  }

  void _showAddService() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _AddServiceHistorySheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFEFE),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                    sliver: SliverToBoxAdapter(child: _buildHeader()),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 17, 20, 0),
                    sliver: SliverToBoxAdapter(child: _buildSummary()),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    sliver: SliverToBoxAdapter(child: _buildYearFilter()),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 25),
                    sliver: SliverToBoxAdapter(child: _buildTimeline()),
                  ),
                ],
              ),
            ),

            _buildAddButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.of(context).pop(),
          child: const SizedBox(
            width: 36,
            height: 36,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: AppColors.dark,
              ),
            ),
          ),
        ),

        const SizedBox(width: 7),

        const Expanded(
          child: Text(
            'Service History',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.dark,
              fontWeight: FontWeight.w700,
              letterSpacing: -.4,
            ),
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

  Widget _buildSummary() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FAF4),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFD8F0E1)),
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: const Color(0xFFE1F4E8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.history_rounded,
              color: AppColors.green,
              size: 24,
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Servis',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.muted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  '12 kali servis',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Rp1,2 jt',
                style: TextStyle(
                  fontSize: 19,
                  color: AppColors.green,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'total biaya',
                style: TextStyle(
                  fontSize: 9,
                  color: AppColors.muted,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildYearFilter() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: years.length,
        separatorBuilder: (_, __) => const SizedBox(width: 7),
        itemBuilder: (context, index) {
          final year = years[index];
          final isSelected = selectedYear == year;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedYear = year;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.green : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? AppColors.green : const Color(0xFFE1E4E7),
                ),
              ),
              child: Text(
                year,
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

  Widget _buildTimeline() {
    final items = filteredHistory;

    if (items.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 45),
        alignment: Alignment.center,
        child: const Column(
          children: [
            Icon(Icons.history_rounded, size: 42, color: Color(0xFFD2D6DA)),
            SizedBox(height: 10),
            Text(
              'Belum ada riwayat servis',
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
      children: List.generate(items.length, (index) {
        final item = items[index];

        return _ServiceTimelineItem(
          item: item,
          isLast: index == items.length - 1,
          onTap: () => _showDetail(item),
        );
      }),
    );
  }

  Widget _buildAddButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 14),
      color: const Color(0xFFFDFEFE),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: _showAddService,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_rounded, size: 20),
              SizedBox(width: 7),
              Text(
                'Catat Servis',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceTimelineItem extends StatelessWidget {
  final _ServiceHistoryData item;
  final bool isLast;
  final VoidCallback onTap;

  const _ServiceTimelineItem({
    required this.item,
    required this.isLast,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 54,
            child: Column(
              children: [
                Container(
                  width: 43,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF8EF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        item.day,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.green,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        item.month,
                        style: const TextStyle(
                          fontSize: 8,
                          color: AppColors.green,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: const Color(0xFFDCE5DF),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 13),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(13),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(13, 13, 11, 13),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: const Color(0xFFE8EAED)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.dark,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                            const Icon(
                              Icons.chevron_right_rounded,
                              size: 20,
                              color: AppColors.muted,
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            const Icon(
                              Icons.speed_rounded,
                              size: 14,
                              color: AppColors.muted,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              item.odometer,
                              style: const TextStyle(
                                fontSize: 10,
                                color: AppColors.muted,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const SizedBox(width: 12),

                            const Icon(
                              Icons.storefront_outlined,
                              size: 14,
                              color: AppColors.muted,
                            ),
                            const SizedBox(width: 4),

                            Expanded(
                              child: Text(
                                item.workshop,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: AppColors.muted,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: item.items
                              .take(3)
                              .map(
                                (service) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 7,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F6F7),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    service,
                                    style: const TextStyle(
                                      fontSize: 8,
                                      color: AppColors.dark,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),

                        const SizedBox(height: 11),

                        Container(height: 1, color: const Color(0xFFF0F1F2)),

                        const SizedBox(height: 9),

                        Row(
                          children: [
                            const Text(
                              'Biaya servis',
                              style: TextStyle(
                                fontSize: 9,
                                color: AppColors.muted,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const Spacer(),

                            Text(
                              item.cost,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.green,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceDetailSheet extends StatelessWidget {
  final _ServiceHistoryData item;

  const _ServiceDetailSheet({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 25),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9DDE1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF8EF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.build_rounded,
                    color: AppColors.green,
                    size: 24,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 17,
                          color: AppColors.dark,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.date,
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppColors.muted,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            _DetailRow(
              icon: Icons.speed_rounded,
              label: 'Odometer',
              value: item.odometer,
            ),

            _DetailRow(
              icon: Icons.storefront_outlined,
              label: 'Bengkel',
              value: item.workshop,
            ),

            _DetailRow(
              icon: Icons.payments_outlined,
              label: 'Total biaya',
              value: item.cost,
              valueColor: AppColors.green,
            ),

            const SizedBox(height: 10),

            const Text(
              'Item Servis',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.dark,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 9),

            ...item.items.map(
              (service) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      size: 17,
                      color: AppColors.green,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      service,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.dark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 46,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.green,
                  side: const BorderSide(color: AppColors.green),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Tutup',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 17, color: AppColors.muted),
          const SizedBox(width: 9),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.muted,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 11,
              color: valueColor ?? AppColors.dark,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddServiceHistorySheet extends StatefulWidget {
  const _AddServiceHistorySheet();

  @override
  State<_AddServiceHistorySheet> createState() =>
      _AddServiceHistorySheetState();
}

class _AddServiceHistorySheetState extends State<_AddServiceHistorySheet> {
  final TextEditingController workshopController = TextEditingController();

  final TextEditingController odometerController = TextEditingController();

  final TextEditingController costController = TextEditingController();

  String serviceType = 'Servis Rutin';

  final List<String> serviceTypes = [
    'Servis Rutin',
    'Ganti Oli',
    'Servis CVT',
    'Servis Besar',
  ];

  @override
  void dispose() {
    workshopController.dispose();
    odometerController.dispose();
    costController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        20 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 42,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9DDE1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'Catat Servis',
                style: TextStyle(
                  fontSize: 19,
                  color: AppColors.dark,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'Jenis Servis',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.dark,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 7),

              DropdownButtonFormField<String>(
                value: serviceType,
                decoration: _inputDecoration(),
                items: serviceTypes
                    .map(
                      (type) => DropdownMenuItem(
                        value: type,
                        child: Text(type, style: const TextStyle(fontSize: 12)),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      serviceType = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 14),

              _buildLabel('Nama Bengkel'),
              const SizedBox(height: 7),
              TextField(
                controller: workshopController,
                decoration: _inputDecoration(hint: 'Contoh: Honda AHASS'),
              ),

              const SizedBox(height: 14),

              _buildLabel('Odometer'),
              const SizedBox(height: 7),
              TextField(
                controller: odometerController,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration(hint: 'Contoh: 36.500 km'),
              ),

              const SizedBox(height: 14),

              _buildLabel('Total Biaya'),
              const SizedBox(height: 7),
              TextField(
                controller: costController,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration(hint: 'Contoh: Rp200.000'),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Riwayat servis berhasil dicatat'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: const Text(
                    'Simpan Riwayat',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        color: AppColors.dark,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  InputDecoration _inputDecoration({String? hint}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 11, color: Color(0xFFA0A6AC)),
      filled: true,
      fillColor: const Color(0xFFF8F9FA),
      contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFE3E6E8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFE3E6E8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.green, width: 1.3),
      ),
    );
  }
}
