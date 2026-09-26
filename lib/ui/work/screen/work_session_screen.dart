import 'package:flutter/material.dart';
import 'package:motora/domain/models/work/work_session.dart';
import 'package:motora/ui/work/view_models/work_session_view_model.dart';
import 'package:motora/ui/work/widget/expense_sheet.dart';
import 'package:motora/ui/work/widget/finish_button.dart';
import 'package:motora/ui/work/widget/fuel_sheet.dart';
import 'package:motora/ui/work/widget/income_sheet.dart';
import 'package:motora/utils/colors.dart';
import 'package:motora/utils/format.dart';
import 'package:provider/provider.dart';

class WorkSessionScreen extends StatefulWidget {
  const WorkSessionScreen({super.key});

  @override
  State<WorkSessionScreen> createState() => _ActiveWorkSessionPageState();
}

class _ActiveWorkSessionPageState extends State<WorkSessionScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WorkSessionViewModel>().startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      appBar: _buildAppBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          child: Consumer<WorkSessionViewModel>(
            builder: (context, value, child) {
              return Column(
                children: [
                  _buildSessionHeader(value.state.workSession!, value),

                  const SizedBox(height: 18),

                  _buildMainCard(value),

                  const SizedBox(height: 20),

                  FinishButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFF9FAFB),
      surfaceTintColor: const Color(0xFFF9FAFB),
      elevation: 0,

      leading: IconButton(
        onPressed: () => Navigator.pushNamed(context, '/'),
        icon: const Icon(Icons.arrow_back_ios, color: AppColors.dark),
      ),

      title: const Text(
        'Sesi Berjalan',
        style: TextStyle(
          color: AppColors.dark,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),

      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz_rounded, color: AppColors.dark),
        ),
      ],
    );
  }

  Widget _buildSessionHeader(WorkSession session, WorkSessionViewModel model) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF0FDF4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  'SEDANG NARIK',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Text(
            model.durationText,
            style: const TextStyle(
              color: AppColors.dark,
              fontSize: 38,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
              fontFeatures: [FontFeature.tabularFigures()],
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.two_wheeler_rounded,
                size: 17,
                color: AppColors.muted,
              ),

              const SizedBox(width: 6),

              Text(
                "${session.motorcycle?.brand} ${session.motorcycle?.model}",
                style: const TextStyle(
                  color: AppColors.dark,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(width: 8),

              Container(
                width: 3,
                height: 3,
                decoration: const BoxDecoration(
                  color: AppColors.muted,
                  shape: BoxShape.circle,
                ),
              ),

              const SizedBox(width: 8),

              Text(
                session.platform,
                style: const TextStyle(
                  color: AppColors.green,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          Text(
            "${session.motorcycle?.policeNumber}",
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainCard(WorkSessionViewModel model) {
    final percentage = (model.profitProgress * 100).round();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'PROFIT HARI INI',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                ),
              ),

              Text(
                '$percentage%',
                style: const TextStyle(
                  color: AppColors.green,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            formatRupiah(model.state.income),
            style: const TextStyle(
              color: AppColors.dark,
              fontSize: 28,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.8,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            'Target ${formatRupiah(model.state.workSession!.goalProfit)}',
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 14),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: model.profitProgress,
              minHeight: 8,
              backgroundColor: const Color(0xFFEFF1F3),
              valueColor: const AlwaysStoppedAnimation(AppColors.green),
            ),
          ),

          SizedBox(height: 20),

          _buildStats(model),

          SizedBox(height: 20),

          _buildQuickActions(model),
        ],
      ),
    );
  }

  Widget _buildStats(WorkSessionViewModel model) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                icon: Icons.account_tree_outlined,
                value: model.state.order.toString(),
                label: 'Order',
                iconColor: const Color(0xFF4CAF50),
                backgroundColor: const Color(0xFFF0FAF3),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: _buildStatCard(
                icon: Icons.local_gas_station_outlined,
                value: formatRupiah(model.state.fuelExpense),
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
                value: formatRupiah(model.state.expense),
                label: 'Pengeluaran',
                iconColor: const Color(0xFF4285F4),
                backgroundColor: const Color(0xFFF1F6FF),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: _buildStatCard(
                icon: Icons.local_shipping_outlined,
                value: '${model.formatKm} km',
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
      padding: const EdgeInsets.fromLTRB(16, 13, 16, 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
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
            style: TextStyle(
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

  Widget _buildQuickActions(WorkSessionViewModel model) {
    return Row(
      children: [
        Expanded(child: IncomeSheet(model: model)),

        const SizedBox(width: 8),

        Expanded(child: FuelSheet(model: model)),

        const SizedBox(width: 8),

        Expanded(child: ExpenseSheet(model: model)),
      ],
    );
  }
}
