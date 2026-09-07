import 'package:flutter/material.dart';
import 'package:motora/utils/colors.dart';

class MaintenancePage extends StatefulWidget {
  const MaintenancePage({super.key});

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  String selectedFilter = 'Semua';

  final List<String> filters = ['Semua', 'Engine', 'Brake', 'Tires', 'CVT'];

  final List<_MaintenanceItemData> maintenanceItems = [
    _MaintenanceItemData(
      title: 'Oli Mesin',
      category: 'Engine',
      lastService: 'Terakhir 32.500 km',
      nextService: 'Ganti dalam 776 km',
      status: 'Aman',
      progress: 0.78,
      icon: Icons.opacity_outlined,
      iconColor: Color(0xFFE36B35),
      iconBackground: Color(0xFFFFE9DE),
    ),
    _MaintenanceItemData(
      title: 'Kampas Rem Depan',
      category: 'Brake',
      lastService: 'Terakhir 30.200 km',
      nextService: 'Perlu dicek',
      status: 'Perhatian',
      progress: 0.48,
      icon: Icons.album_outlined,
      iconColor: Color(0xFFE09A18),
      iconBackground: Color(0xFFFFF3D7),
    ),
    _MaintenanceItemData(
      title: 'Ban Belakang',
      category: 'Tires',
      lastService: 'Terakhir 28.700 km',
      nextService: 'Segera ganti',
      status: 'Perlu diganti',
      progress: 0.25,
      icon: Icons.tire_repair_outlined,
      iconColor: Color(0xFFE84B55),
      iconBackground: Color(0xFFFFE5E8),
    ),
    _MaintenanceItemData(
      title: 'CVT',
      category: 'CVT',
      lastService: 'Terakhir 31.000 km',
      nextService: 'Cek dalam 1.276 km',
      status: 'Aman',
      progress: 0.70,
      icon: Icons.settings_outlined,
      iconColor: Color(0xFF7655C9),
      iconBackground: Color(0xFFEDE6FF),
    ),
    _MaintenanceItemData(
      title: 'Aki',
      category: 'Engine',
      lastService: 'Terakhir 27.500 km',
      nextService: 'Cek dalam 2.224 km',
      status: 'Aman',
      progress: 0.72,
      icon: Icons.battery_5_bar_outlined,
      iconColor: Color(0xFF2680D9),
      iconBackground: Color(0xFFE5F0FF),
    ),
  ];

  // ==========================================================
  // FILTER
  // ==========================================================

  List<_MaintenanceItemData> get filteredItems {
    if (selectedFilter == 'Semua') {
      return maintenanceItems;
    }

    return maintenanceItems
        .where((item) => item.category == selectedFilter)
        .toList();
  }

  // ==========================================================
  // ADD SERVICE
  // ==========================================================

  void _showAddService() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return const _AddServiceSheet();
      },
    );
  }

  // ==========================================================
  // ITEM DETAIL
  // ==========================================================

  void _showMaintenanceDetail(_MaintenanceItemData item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return _MaintenanceDetailSheet(item: item);
      },
    );
  }

  // ==========================================================
  // BUILD
  // ==========================================================

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
                    sliver: SliverToBoxAdapter(child: _buildFilters()),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 14, 20, 25),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final item = filteredItems[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _MaintenanceCard(
                            item: item,
                            onTap: () {
                              _showMaintenanceDetail(item);
                            },
                          ),
                        );
                      }, childCount: filteredItems.length),
                    ),
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

  // ==========================================================
  // HEADER
  // ==========================================================

  Widget _buildHeader() {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.of(context).pop();
          },
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
            'Maintenance',
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

  // ==========================================================
  // SUMMARY
  // ==========================================================

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
              Icons.build_circle_outlined,
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
                  'Kondisi Motor',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.muted,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 3),

                Text(
                  '3 hal perlu perhatian',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          const Text(
            '82',
            style: TextStyle(
              fontSize: 28,
              color: AppColors.green,
              fontWeight: FontWeight.w800,
              letterSpacing: -.7,
            ),
          ),

          const SizedBox(width: 3),

          const Padding(
            padding: EdgeInsets.only(top: 9),
            child: Text(
              '/100',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.muted,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // FILTER
  // ==========================================================

  Widget _buildFilters() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: filters.length,
        separatorBuilder: (_, __) {
          return const SizedBox(width: 7);
        },
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

  // ==========================================================
  // ADD BUTTON
  // ==========================================================

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

// ============================================================
// MAINTENANCE DATA
// ============================================================

class _MaintenanceItemData {
  final String title;
  final String category;
  final String lastService;
  final String nextService;
  final String status;

  final double progress;

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;

  const _MaintenanceItemData({
    required this.title,
    required this.category,
    required this.lastService,
    required this.nextService,
    required this.status,
    required this.progress,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
  });
}

// ============================================================
// MAINTENANCE CARD
// ============================================================

class _MaintenanceCard extends StatelessWidget {
  final _MaintenanceItemData item;
  final VoidCallback onTap;

  const _MaintenanceCard({required this.item, required this.onTap});

  Color get statusColor {
    if (item.status == 'Aman') {
      return AppColors.green;
    }

    if (item.status == 'Perhatian') {
      return const Color(0xFFE09A18);
    }

    return const Color(0xFFE84B55);
  }

  Color get statusBackground {
    if (item.status == 'Aman') {
      return const Color(0xFFEAF8EF);
    }

    if (item.status == 'Perhatian') {
      return const Color(0xFFFFF3D7);
    }

    return const Color(0xFFFFE7EA);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(13),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(13),
        child: Container(
          padding: const EdgeInsets.fromLTRB(13, 13, 12, 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
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
                    child: Icon(item.icon, size: 22, color: item.iconColor),
                  ),

                  const SizedBox(width: 11),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.dark,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          item.lastService,
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.muted,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: statusBackground,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      item.status,
                      style: TextStyle(
                        fontSize: 9,
                        color: statusColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(width: 5),

                  const Icon(
                    Icons.chevron_right_rounded,
                    size: 21,
                    color: AppColors.muted,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // ------------------------------------------------
              // PROGRESS
              // ------------------------------------------------
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: item.progress,
                        minHeight: 5,
                        backgroundColor: const Color(0xFFEEF0F2),
                        valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Text(
                    item.nextService,
                    style: TextStyle(
                      fontSize: 9,
                      color: statusColor,
                      fontWeight: FontWeight.w600,
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

// ============================================================
// MAINTENANCE DETAIL SHEET
// ============================================================

class _MaintenanceDetailSheet extends StatelessWidget {
  final _MaintenanceItemData item;

  const _MaintenanceDetailSheet({required this.item});

  @override
  Widget build(BuildContext context) {
    final Color statusColor = item.status == 'Aman'
        ? AppColors.green
        : item.status == 'Perhatian'
        ? const Color(0xFFE09A18)
        : const Color(0xFFE84B55);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 38,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFD8DCE0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 19),

            Row(
              children: [
                Container(
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                    color: item.iconBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(item.icon, size: 24, color: item.iconColor),
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
                        item.category,
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(.10),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    item.status,
                    style: TextStyle(
                      fontSize: 10,
                      color: statusColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            _DetailRow(
              label: 'Servis terakhir',
              value: item.lastService.replaceFirst('Terakhir ', ''),
            ),

            const SizedBox(height: 13),

            _DetailRow(label: 'Status berikutnya', value: item.nextService),

            const SizedBox(height: 13),

            _DetailRow(label: 'Odometer motor', value: '35.724 km'),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
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
                  'Catat Servis',
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

// ============================================================
// DETAIL ROW
// ============================================================

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.muted,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.dark,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// ADD SERVICE SHEET
// ============================================================

class _AddServiceSheet extends StatefulWidget {
  const _AddServiceSheet();

  @override
  State<_AddServiceSheet> createState() => _AddServiceSheetState();
}

class _AddServiceSheetState extends State<_AddServiceSheet> {
  final TextEditingController serviceController = TextEditingController();

  final TextEditingController costController = TextEditingController();

  String selectedType = 'Oli Mesin';

  final List<String> serviceTypes = [
    'Oli Mesin',
    'Kampas Rem',
    'Ban',
    'CVT',
    'Aki',
    'Lainnya',
  ];

  @override
  void dispose() {
    serviceController.dispose();
    costController.dispose();
    super.dispose();
  }

  String formatRUpiah(String value) {
    final raw = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (raw.isEmpty) return '';

    final number = int.tryParse(raw);

    if (number == null) return '';

    final text = number.toString();
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      final positionFromEnd = text.length - i;

      buffer.write(text[i]);

      if (positionFromEnd > 1 && positionFromEnd % 3 == 1) {
        buffer.write('.');
      }
    }

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 20 + bottom),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 38,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD8DCE0),
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
                  color: AppColors.muted,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 7),

              DropdownButtonFormField<String>(
                value: selectedType,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF8F9FA),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE3E6E8)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE3E6E8)),
                  ),
                ),
                items: serviceTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(
                      type,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.dark,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    selectedType = value;
                  });
                },
              ),

              const SizedBox(height: 14),

              const Text(
                'Catatan',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.muted,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 7),

              TextField(
                controller: serviceController,
                maxLines: 3,
                style: const TextStyle(fontSize: 12, color: AppColors.dark),
                decoration: InputDecoration(
                  hintText: 'Contoh: Ganti oli mesin...',
                  hintStyle: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF98A2B3),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8F9FA),
                  contentPadding: const EdgeInsets.all(13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE3E6E8)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE3E6E8)),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                'Biaya',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.muted,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 7),

              TextField(
                controller: costController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.dark,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  prefixText: 'Rp ',
                  prefixStyle: const TextStyle(
                    fontSize: 13,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w600,
                  ),
                  hintText: '0',
                  hintStyle: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF98A2B3),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8F9FA),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 13,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE3E6E8)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE3E6E8)),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 47,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
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
                    'Simpan Servis',
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
}
