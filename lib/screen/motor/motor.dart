import 'package:flutter/material.dart';
import 'package:motora/components/card.dart';
import 'package:motora/components/motor_health.dart';
import 'package:motora/screen/motor/daily_checklist.dart';
import 'package:motora/screen/motor/damage.dart';
import 'package:motora/screen/motor/maintenance.dart';
import 'package:motora/screen/motor/service_history.dart';
import 'package:motora/utils/colors.dart';

class MotorPage extends StatefulWidget {
  const MotorPage({super.key});

  @override
  State<MotorPage> createState() => _MotorPageState();
}

class _MotorPageState extends State<MotorPage> {
  final String motorName = 'Honda Beat 2022';
  final String odometer = '35.724';
  final int motorHealth = 82;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFEFE),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),

                    const SizedBox(height: 16),

                    const SizedBox(height: 13),

                    MotorHealth(),

                    const SizedBox(height: 13),

                    _buildMenuCard(),
                  ],
                ),
              ),
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
          child: Text(
            'Motor Saya',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.dark,
              fontWeight: FontWeight.w700,
              letterSpacing: -.4,
            ),
          ),
        ),

        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            _showMoreMenu();
          },
          child: const SizedBox(
            width: 36,
            height: 36,
            child: Icon(
              Icons.more_vert_rounded,
              size: 21,
              color: AppColors.dark,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuCard() {
    return CardMotora(
      padding: const EdgeInsets.fromLTRB(13, 6, 13, 6),
      child: Column(
        children: [
          _MotorMenuItem(
            icon: Icons.build_outlined,
            iconColor: const Color(0xFFE96D3C),
            iconBackground: const Color(0xFFFFE9DE),
            title: 'Maintenance',
            subtitle: '3 perlu perhatian',
            showArrow: true,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MaintenancePage()),
            ),
          ),

          _menuDivider(),

          _MotorMenuItem(
            icon: Icons.calendar_month_outlined,
            iconColor: const Color(0xFF8457D6),
            iconBackground: const Color(0xFFEDE4FF),
            title: 'Service History',
            subtitle: '12 Riwayat',
            showArrow: true,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ServiceHistoryPage()),
            ),
          ),

          _menuDivider(),

          _MotorMenuItem(
            icon: Icons.warning_amber_rounded,
            iconColor: const Color(0xFFE49A1A),
            iconBackground: const Color(0xFFFFF3D7),
            title: 'Kerusakan',
            subtitle: '2 Catatan',
            showArrow: true,
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const DamagePage())),
          ),

          _menuDivider(),

          _MotorMenuItem(
            icon: Icons.check_box_outlined,
            iconColor: AppColors.green,
            iconBackground: const Color(0xFFE5F6EC),
            title: 'Checklist Harian',
            subtitle: 'Periksa kondisi motor',
            showArrow: true,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const DailyChecklistPage()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuDivider() {
    return const Padding(
      padding: EdgeInsets.only(left: 51),
      child: Divider(height: 1, thickness: 1, color: Color(0xFFF0F1F2)),
    );
  }

  void _showMoreMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
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
              children: [
                Container(
                  width: 38,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD8DCE0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  'Pengaturan Motor',
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 15),

                ListTile(
                  leading: const Icon(
                    Icons.edit_outlined,
                    color: AppColors.dark,
                  ),
                  title: const Text(
                    'Edit Data Motor',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(
                    Icons.refresh_rounded,
                    color: AppColors.dark,
                  ),
                  title: const Text(
                    'Perbarui Odometer',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ============================================================
// MOTOR MENU ITEM
// ============================================================

class _MotorMenuItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String subtitle;
  final bool showArrow;
  final VoidCallback onTap;

  const _MotorMenuItem({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.subtitle,
    required this.showArrow,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 67,
        child: Row(
          children: [
            Container(
              width: 37,
              height: 37,
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 20, color: iconColor),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.dark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.muted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            if (showArrow)
              const Icon(
                Icons.chevron_right_rounded,
                size: 23,
                color: AppColors.muted,
              ),
          ],
        ),
      ),
    );
  }
}
