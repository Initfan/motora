import 'package:motora/utils/colors.dart';
import 'package:flutter/material.dart';

class DailyChecklistPage extends StatefulWidget {
  const DailyChecklistPage({super.key});

  @override
  State<DailyChecklistPage> createState() => _DailyChecklistPageState();
}

class _DailyChecklistPageState extends State<DailyChecklistPage> {
  final List<_ChecklistItemData> items = [
    _ChecklistItemData(
      title: 'Oli Mesin',
      description: 'Pastikan level oli masih cukup',
      icon: Icons.opacity_outlined,
      iconColor: Color(0xFFE36B35),
      iconBackground: Color(0xFFFFE9DE),
      checked: false,
    ),
    _ChecklistItemData(
      title: 'Rem Depan & Belakang',
      description: 'Pastikan rem berfungsi dengan baik',
      icon: Icons.disc_full_outlined,
      iconColor: Color(0xFFE84B55),
      iconBackground: Color(0xFFFFE5E8),
      checked: false,
    ),
    _ChecklistItemData(
      title: 'Ban',
      description: 'Cek tekanan dan kondisi tapak ban',
      icon: Icons.tire_repair_outlined,
      iconColor: Color(0xFFE09A18),
      iconBackground: Color(0xFFFFF3D7),
      checked: false,
    ),
    _ChecklistItemData(
      title: 'Lampu',
      description: 'Cek lampu utama, rem, dan sein',
      icon: Icons.lightbulb_outline_rounded,
      iconColor: Color(0xFF7655C9),
      iconBackground: Color(0xFFEDE6FF),
      checked: false,
    ),
    _ChecklistItemData(
      title: 'Bensin',
      description: 'Pastikan bahan bakar cukup untuk bekerja',
      icon: Icons.local_gas_station_outlined,
      iconColor: Color(0xFF2680D9),
      iconBackground: Color(0xFFE5F0FF),
      checked: false,
    ),
    _ChecklistItemData(
      title: 'Kondisi Body',
      description: 'Pastikan tidak ada kerusakan baru',
      icon: Icons.two_wheeler_outlined,
      iconColor: Color(0xFF08A94F),
      iconBackground: Color(0xFFE1F4E8),
      checked: false,
    ),
  ];

  bool _isChecked(int index) {
    return items[index].checked;
  }

  bool get allChecked {
    return items.every((item) => item.checked);
  }

  int get checkedCount {
    return items.where((item) => item.checked).length;
  }

  void _toggleItem(int index) {
    setState(() {
      items[index].checked = !items[index].checked;
    });
  }

  void _completeChecklist() {
    if (!allChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Periksa semua kondisi motor terlebih dahulu'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => _ChecklistSuccessDialog(
        onContinue: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = checkedCount / items.length;

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
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                    sliver: SliverToBoxAdapter(child: _buildIntro()),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    sliver: SliverToBoxAdapter(child: _buildProgress(progress)),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 25),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _ChecklistCard(
                            item: items[index],
                            checked: _isChecked(index),
                            onTap: () => _toggleItem(index),
                          ),
                        );
                      }, childCount: items.length),
                    ),
                  ),
                ],
              ),
            ),

            _buildCompleteButton(),
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
            'Checklist Harian',
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

  Widget _buildIntro() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FAF4),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFD8F0E1)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFE1F4E8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.fact_check_outlined,
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
                  'Cek motor sebelum berangkat',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Pastikan motor dalam kondisi aman untuk bekerja.',
                  style: TextStyle(
                    fontSize: 10,
                    height: 1.4,
                    color: AppColors.muted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgress(double progress) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 14, 15, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xFFE8EAED)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Progress Checklist',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.dark,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const Spacer(),

              Text(
                '$checkedCount/${items.length}',
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.green,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          const SizedBox(height: 9),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: const Color(0xFFEEF0F2),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.green),
            ),
          ),

          const SizedBox(height: 7),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              allChecked
                  ? 'Semua kondisi sudah diperiksa'
                  : 'Periksa ${items.length - checkedCount} item lagi',
              style: TextStyle(
                fontSize: 9,
                color: allChecked ? AppColors.green : AppColors.muted,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompleteButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 14),
      color: const Color(0xFFFDFEFE),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: _completeChecklist,
          style: ElevatedButton.styleFrom(
            backgroundColor: allChecked
                ? AppColors.green
                : const Color(0xFFD9DEE2),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                allChecked
                    ? Icons.check_circle_outline_rounded
                    : Icons.lock_outline_rounded,
                size: 19,
              ),
              const SizedBox(width: 7),
              Text(
                allChecked ? 'Selesai Checklist' : 'Periksa Semua Item',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChecklistItemData {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  bool checked;

  _ChecklistItemData({
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.checked,
  });
}

class _ChecklistCard extends StatelessWidget {
  final _ChecklistItemData item;
  final bool checked;
  final VoidCallback onTap;

  const _ChecklistCard({
    required this.item,
    required this.checked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(13),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(13),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: checked ? const Color(0xFFF4FBF7) : Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: checked
                  ? const Color(0xFFBCE6CB)
                  : const Color(0xFFE8EAED),
              width: checked ? 1.2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 43,
                height: 43,
                decoration: BoxDecoration(
                  color: checked
                      ? const Color(0xFFE1F4E8)
                      : item.iconBackground,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(
                  item.icon,
                  size: 22,
                  color: checked ? AppColors.green : item.iconColor,
                ),
              ),

              const SizedBox(width: 11),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.dark,
                        fontWeight: checked ? FontWeight.w700 : FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        height: 1.35,
                        color: AppColors.muted,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  color: checked ? AppColors.green : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: checked ? AppColors.green : const Color(0xFFD2D7DB),
                    width: 1.5,
                  ),
                ),
                child: checked
                    ? const Icon(
                        Icons.check_rounded,
                        size: 17,
                        color: Colors.white,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChecklistSuccessDialog extends StatelessWidget {
  final VoidCallback onContinue;

  const _ChecklistSuccessDialog({required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: Color(0xFFE1F4E8),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_rounded,
                color: AppColors.green,
                size: 36,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Checklist Selesai!',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.dark,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'Motor sudah diperiksa dan siap digunakan untuk narik.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                height: 1.45,
                color: AppColors.muted,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Lanjut',
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
