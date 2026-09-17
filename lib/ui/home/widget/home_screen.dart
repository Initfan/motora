import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motora/domain/models/work/work_session.dart';
import 'package:motora/ui/motor/widget/motor_card.dart';
import 'package:motora/ui/work/view_models/work_session_view_model.dart';
import 'package:motora/utils/colors.dart';
import 'package:motora/utils/format.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  double profitProgress(double profitTarget, double currentProfit) {
    if (profitTarget <= 0) {
      return 0;
    }

    return (currentProfit / profitTarget).clamp(0.0, 1.0);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<WorkSessionViewModel>().load();
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
              sliver: Consumer<WorkSessionViewModel>(
                builder: (context, model, child) {
                  final session = model.state.workSession;

                  return SliverList(
                    delegate: SliverChildListDelegate([
                      _buildHeader(),

                      const SizedBox(height: 20),

                      MotorCard(),

                      const SizedBox(height: 14),

                      _buildProfitCard(session, model.state.currentIncome),

                      const SizedBox(height: 14),

                      _buildStartSessionButton(session),

                      const SizedBox(height: 24),

                      _buildSectionTitle('Hari ini'),

                      const SizedBox(height: 10),

                      _buildStats(session),

                      const SizedBox(height: 24),

                      _buildSectionTitle(
                        'Perawatan motor',
                        trailing: 'Lihat semua',
                        onTrailingTap: () {},
                      ),

                      const SizedBox(height: 10),

                      _buildMaintenanceCard(),
                    ]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    const String driverName = 'Initfan';

    const String? profilePhoto = null;

    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFF0FDF4),
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
          ),
          child: ClipOval(
            child: profilePhoto != null && profilePhoto.isNotEmpty
                ? Image.network(
                    profilePhoto,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildDefaultAvatar();
                    },
                  )
                : _buildDefaultAvatar(),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                driverName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.dark,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                ),
              ),

              const SizedBox(height: 3),

              const Text(
                'Motocare',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: AppColors.border),
          ),
          child: Stack(
            children: [
              const Center(
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.dark,
                  size: 22,
                ),
              ),

              Positioned(
                top: 9,
                right: 10,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultAvatar() {
    return const Center(
      child: Icon(Icons.person_rounded, color: AppColors.green, size: 27),
    );
  }

  Widget _buildProfitCard(WorkSession? session, int currentProfit) {
    if (isLoading || session == null) {
      return Container(
        height: 180,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(20),
        ),
      );
    }

    final progress =
        profitProgress(
          session.goalProfit.toDouble(),
          currentProfit.toDouble(),
        ) *
        100;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'PROFIT HARI INI',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                  ),
                ),
              ),

              Text(
                '${progress.round()}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          const SizedBox(height: 7),

          Text(
            formatRupiah(currentProfit),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            'Target ${formatRupiah(session.goalProfit)}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 16),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: 80,
              // value: profitProgress,
              minHeight: 8,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartSessionButton(WorkSession? session) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () =>
            session == null ? context.go('/work') : context.go('/work/active'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.dark,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              session != null
                  ? Icons.play_arrow_rounded
                  : Icons.play_arrow_rounded,
              size: 22,
            ),

            const SizedBox(width: 8),

            Text(
              session != null ? 'Lanjutkan Sesi' : 'Mulai Sesi Narik',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    String title, {
    String? trailing,
    VoidCallback? onTrailingTap,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.dark,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.2,
          ),
        ),

        const Spacer(),

        if (trailing != null)
          GestureDetector(
            onTap: onTrailingTap,
            child: const Text(
              'Lihat semua',
              style: TextStyle(
                color: AppColors.green,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildStats(WorkSession? session) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                icon: Icons.account_tree_outlined,
                value: "${session?.totalOrder}",
                label: 'Order',
                iconColor: const Color(0xFF4CAF50),
                backgroundColor: const Color(0xFFF0FAF3),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: _buildStatCard(
                icon: Icons.access_time_rounded,
                value: formatRupiah(100),
                label: 'Bensin',
                iconColor: const Color(0xFFFF8A4C),
                backgroundColor: const Color(0xFFFFF5EF),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                icon: Icons.local_gas_station_outlined,
                value: formatRupiah(100),
                label: 'Pengeluaran',
                iconColor: const Color(0xFF4285F4),
                backgroundColor: const Color(0xFFF1F6FF),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: _buildStatCard(
                icon: Icons.route_rounded,
                value: '${formatNumber(session?.distance ?? 0)} km',
                label: 'Jarak',
                iconColor: const Color(0xFF8B5CF6),
                backgroundColor: const Color(0xFFF6F0FF),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color iconColor,
    required Color backgroundColor,
  }) {
    return Container(
      height: 104,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 21, color: iconColor),

          const Spacer(),

          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.dark,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            label,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMaintenanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.build_outlined,
              color: Color(0xFFF79009),
              size: 21,
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ganti oli',
                  style: TextStyle(
                    color: AppColors.dark,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'Perawatan berikutnya',
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${formatNumber(100)} km',
                style: const TextStyle(
                  color: AppColors.dark,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'lagi',
                style: TextStyle(color: AppColors.muted, fontSize: 10),
              ),
            ],
          ),

          const SizedBox(width: 5),

          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.muted,
            size: 20,
          ),
        ],
      ),
    );
  }
}
