import 'package:flutter/material.dart';
import 'package:motora/utils/colors.dart';

class _DamageData {
  final String title;
  final String category;
  final String description;
  final String date;
  final String status;
  final String urgency;
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;

  const _DamageData({
    required this.title,
    required this.category,
    required this.description,
    required this.date,
    required this.status,
    required this.urgency,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
  });
}

class DamagePage extends StatefulWidget {
  const DamagePage({super.key});

  @override
  State<DamagePage> createState() => _DamagePageState();
}

class _DamagePageState extends State<DamagePage> {
  String selectedFilter = 'Semua';

  final List<String> filters = ['Semua', 'Open', 'Dipantau', 'Selesai'];

  final List<_DamageData> damages = [
    _DamageData(
      title: 'Kampas Rem Depan',
      category: 'Brake',
      description: 'Rem terasa sedikit kurang pakem saat pengereman mendadak.',
      date: '12 Agu 2026',
      status: 'Open',
      urgency: 'Tinggi',
      icon: Icons.disc_full_outlined,
      iconColor: Color(0xFFE84B55),
      iconBackground: Color(0xFFFFE5E8),
    ),
    _DamageData(
      title: 'Ban Belakang Aus',
      category: 'Tires',
      description:
          'Alur ban mulai tipis dan perlu segera dipertimbangkan untuk diganti.',
      date: '02 Jul 2026',
      status: 'Dipantau',
      urgency: 'Sedang',
      icon: Icons.tire_repair_outlined,
      iconColor: Color(0xFFE09A18),
      iconBackground: Color(0xFFFFF3D7),
    ),
    _DamageData(
      title: 'Cover Body Kanan',
      category: 'Body',
      description: 'Terdapat goresan ringan pada cover body bagian kanan.',
      date: '18 Mei 2026',
      status: 'Selesai',
      urgency: 'Rendah',
      icon: Icons.two_wheeler_outlined,
      iconColor: Color(0xFF2680D9),
      iconBackground: Color(0xFFE5F0FF),
    ),
    _DamageData(
      title: 'Lampu Sein Kiri',
      category: 'Electrical',
      description:
          'Lampu sein kiri sempat berkedip lebih lambat dari biasanya.',
      date: '03 Apr 2026',
      status: 'Selesai',
      urgency: 'Rendah',
      icon: Icons.lightbulb_outline_rounded,
      iconColor: Color(0xFF7655C9),
      iconBackground: Color(0xFFEDE6FF),
    ),
  ];

  List<_DamageData> get filteredDamages {
    if (selectedFilter == 'Semua') {
      return damages;
    }

    return damages.where((item) => item.status == selectedFilter).toList();
  }

  void _showDamageDetail(_DamageData item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _DamageDetailSheet(item: item),
    );
  }

  void _showReportDamage() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _ReportDamageSheet(),
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
                    sliver: SliverToBoxAdapter(child: _buildFilters()),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
                    sliver: SliverToBoxAdapter(child: _buildDamageList()),
                  ),
                ],
              ),
            ),

            _buildReportButton(),
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
            'Kerusakan',
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
        color: const Color(0xFFFFF8E8),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF5E4B8)),
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEDC7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.warning_amber_rounded,
              color: Color(0xFFE09A18),
              size: 25,
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Catatan Kerusakan',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.muted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  '2 perlu perhatian',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE7C0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Perlu cek',
              style: TextStyle(
                fontSize: 9,
                color: Color(0xFFB56D00),
                fontWeight: FontWeight.w700,
              ),
            ),
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

  Widget _buildDamageList() {
    final items = filteredDamages;

    if (items.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 45),
        alignment: Alignment.center,
        child: const Column(
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              size: 42,
              color: Color(0xFFD2D6DA),
            ),
            SizedBox(height: 10),
            Text(
              'Tidak ada catatan kerusakan',
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
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _DamageCard(
                item: item,
                onTap: () => _showDamageDetail(item),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildReportButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 14),
      color: const Color(0xFFFDFEFE),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: _showReportDamage,
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
              Icon(Icons.add_a_photo_outlined, size: 19),
              SizedBox(width: 7),
              Text(
                'Laporkan Kerusakan',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DamageCard extends StatelessWidget {
  final _DamageData item;
  final VoidCallback onTap;

  const _DamageCard({required this.item, required this.onTap});

  Color get statusColor {
    switch (item.status) {
      case 'Open':
        return const Color(0xFFE84B55);
      case 'Dipantau':
        return const Color(0xFFE09A18);
      default:
        return AppColors.green;
    }
  }

  Color get statusBackground {
    switch (item.status) {
      case 'Open':
        return const Color(0xFFFFE7EA);
      case 'Dipantau':
        return const Color(0xFFFFF3D7);
      default:
        return const Color(0xFFEAF8EF);
    }
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
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: const Color(0xFFE8EAED)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          '${item.category} • ${item.date}',
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
                ],
              ),

              const SizedBox(height: 11),

              Text(
                item.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
                  height: 1.45,
                  color: AppColors.muted,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 11),

              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F7),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.flag_outlined, size: 13, color: statusColor),
                        const SizedBox(width: 4),
                        Text(
                          'Urgensi ${item.urgency}',
                          style: TextStyle(
                            fontSize: 9,
                            color: statusColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  const Text(
                    'Lihat detail',
                    style: TextStyle(
                      fontSize: 9,
                      color: AppColors.green,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(width: 2),

                  const Icon(
                    Icons.chevron_right_rounded,
                    size: 18,
                    color: AppColors.green,
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

class _DamageDetailSheet extends StatelessWidget {
  final _DamageData item;

  const _DamageDetailSheet({required this.item});

  Color get statusColor {
    switch (item.status) {
      case 'Open':
        return const Color(0xFFE84B55);
      case 'Dipantau':
        return const Color(0xFFE09A18);
      default:
        return AppColors.green;
    }
  }

  Color get statusBackground {
    switch (item.status) {
      case 'Open':
        return const Color(0xFFFFE7EA);
      case 'Dipantau':
        return const Color(0xFFFFF3D7);
      default:
        return const Color(0xFFEAF8EF);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
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
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                    color: item.iconBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(item.icon, color: item.iconColor, size: 24),
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
                        '${item.category} • ${item.date}',
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
                    horizontal: 9,
                    vertical: 6,
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
              ],
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.dark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 11,
                      height: 1.5,
                      color: AppColors.muted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 13),

            Row(
              children: [
                Expanded(
                  child: _DamageInfo(
                    icon: Icons.flag_outlined,
                    label: 'Urgensi',
                    value: item.urgency,
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: _DamageInfo(
                    icon: Icons.calendar_today_outlined,
                    label: 'Dilaporkan',
                    value: item.date,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

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

class _DamageInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DamageInfo({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE8EAED)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 17, color: AppColors.muted),
          const SizedBox(width: 7),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 8, color: AppColors.muted),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReportDamageSheet extends StatefulWidget {
  const _ReportDamageSheet();

  @override
  State<_ReportDamageSheet> createState() => _ReportDamageSheetState();
}

class _ReportDamageSheetState extends State<_ReportDamageSheet> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  String selectedCategory = 'Engine';
  String selectedUrgency = 'Sedang';

  final List<String> categories = [
    'Engine',
    'Brake',
    'Tires',
    'Electrical',
    'Body',
    'Lainnya',
  ];

  final List<String> urgencies = ['Rendah', 'Sedang', 'Tinggi'];

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
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

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        color: AppColors.dark,
        fontWeight: FontWeight.w700,
      ),
    );
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
                'Laporkan Kerusakan',
                style: TextStyle(
                  fontSize: 19,
                  color: AppColors.dark,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Catat kondisi motor yang perlu diperhatikan.',
                style: TextStyle(fontSize: 10, color: AppColors.muted),
              ),

              const SizedBox(height: 18),

              _label('Nama Kerusakan'),
              const SizedBox(height: 7),

              TextField(
                controller: titleController,
                decoration: _inputDecoration(
                  hint: 'Contoh: Rem terasa kurang pakem',
                ),
              ),

              const SizedBox(height: 14),

              _label('Kategori'),
              const SizedBox(height: 7),

              DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: _inputDecoration(),
                items: categories
                    .map(
                      (category) => DropdownMenuItem<String>(
                        value: category,
                        child: Text(
                          category,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedCategory = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 14),

              _label('Tingkat Urgensi'),
              const SizedBox(height: 8),

              Row(
                children: urgencies.map((urgency) {
                  final selected = urgency == selectedUrgency;

                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: urgency == 'Tinggi' ? 0 : 7,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedUrgency = urgency;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 160),
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selected ? AppColors.green : Colors.white,
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                              color: selected
                                  ? AppColors.green
                                  : const Color(0xFFE1E4E7),
                            ),
                          ),
                          child: Text(
                            urgency,
                            style: TextStyle(
                              fontSize: 10,
                              color: selected ? Colors.white : AppColors.dark,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 14),

              _label('Deskripsi'),
              const SizedBox(height: 7),

              TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: _inputDecoration(
                  hint: 'Jelaskan kondisi atau gejala yang dirasakan...',
                ),
              ),

              const SizedBox(height: 14),

              _label('Foto Kerusakan'),
              const SizedBox(height: 7),

              Container(
                width: double.infinity,
                height: 82,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFE3E6E8)),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Fitur pilih foto siap diintegrasikan'),
                      ),
                    );
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo_outlined,
                        color: AppColors.green,
                        size: 23,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Tambah foto',
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.green,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
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
                        content: Text('Kerusakan berhasil dilaporkan'),
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
                    'Simpan Laporan',
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
