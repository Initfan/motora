import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<WorkSessionViewModel>().load();
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
                      Image.asset(
                        'assets/motocare_logo.png',
                        width: 75,
                        height: 75,
                      ),
                      const SizedBox(height: 20),

                      session == null
                          ? MotorCard()
                          : Motor(data: session.motorcycle!),

                      const SizedBox(height: 14),

                      _buildProfitCard(model),

                      const SizedBox(height: 14),

                      _buildStartSessionButton(session),

                      const SizedBox(height: 24),

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

  Widget _buildProfitCard(WorkSessionViewModel model) {
    final session = model.state.workSession;
    final progress = model.profitProgress * 100;

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
            formatRupiah(session?.income ?? 0),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            'Target ${formatRupiah(session?.goalProfit ?? 0)}',
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
              value: model.profitProgress,
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
        onPressed: () => session == null
            ? Navigator.pushNamed(context, '/work')
            : Navigator.pushNamed(context, '/work/active'),
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
    if (session == null) {
      return SizedBox();
    }

    return Column(
      children: [
        _buildSectionTitle('Hari ini'),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                icon: Icons.account_tree_outlined,
                value: "${session.order}",
                label: 'Order',
                iconColor: const Color(0xFF4CAF50),
                backgroundColor: const Color(0xFFF0FAF3),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: _buildStatCard(
                icon: Icons.local_gas_station_outlined,
                value: formatRupiah(session.fuelExpense),
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
                icon: Icons.access_time_rounded,
                value: formatRupiah(session.expense),
                label: 'Pengeluaran',
                iconColor: const Color(0xFF4285F4),
                backgroundColor: const Color(0xFFF1F6FF),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: _buildStatCard(
                icon: Icons.route_rounded,
                value: '${formatNumber(session.distance)} km',
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
