import 'package:flutter/material.dart';
import 'package:motora/domain/models/motor/motorcycle.dart';
import 'package:motora/domain/models/work/work_session.dart';
import 'package:motora/ui/motor/view_models/select_motor_view_model.dart';
import 'package:motora/ui/work/view_models/work_session_view_model.dart';
import 'package:motora/ui/work/widget/income_sheet.dart';
import 'package:motora/utils/colors.dart';
import 'package:provider/provider.dart';

class WorkSessionScreen extends StatefulWidget {
  const WorkSessionScreen({super.key});

  @override
  State<WorkSessionScreen> createState() => _ActiveWorkSessionPageState();
}

class _ActiveWorkSessionPageState extends State<WorkSessionScreen> {
  late double _fuelLevel = 0;

  @override
  void initState() {
    super.initState();
    context.read<WorkSessionViewModel>().startTimer();
  }

  String _formatRupiah(int value) {
    return 'Rp${value.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.')}';
  }

  void _showFinishConfirmation() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 24),

                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0FDF4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.flag_rounded,
                    color: AppColors.green,
                    size: 32,
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  'Akhiri sesi narik?',
                  style: TextStyle(
                    color: AppColors.dark,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Pastikan semua pendapatan dan '
                  'pengeluaran sudah dicatat.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          side: const BorderSide(color: AppColors.border),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        child: const Text(
                          'Batal',
                          style: TextStyle(
                            color: AppColors.dark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: _finishSession,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        child: const Text(
                          'Akhiri Sesi',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _finishSession() async {
    // try {
    //   await api.post(
    //     '/work/finish',
    //     body: {
    //       "work_session_id": widget.work.id,
    //       "kilometers_finish": widget.work.kilometersStart! + _distance.ceil(),
    //       "total_order": _totalOrder,
    //     },
    //   );

    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (_) => FinishWorkSessionPage(
    //         sessionId: widget.work.id.toString(),
    //         startTime: DateTime.parse(widget.work.startedAt!),
    //         finishTime: DateTime.now(),
    //         platform: widget.work.platform!,
    //         distance: _distance,
    //         totalOrder: _totalOrder,
    //         income: _currentIncome,
    //       ),
    //     ),
    //   );
    // } catch (e) {
    //   print(e);
    // }
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
              final motor = context
                  .read<SelectMotorViewModel>()
                  .state
                  .selectedMotorcycle!;

              return Column(
                children: [
                  _buildSessionHeader(motor, value.state.workSession!, value),

                  const SizedBox(height: 18),

                  _buildMainCard(value),

                  const SizedBox(height: 20),

                  _buildFinishButton(),
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
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded, color: AppColors.dark),
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

  Widget _buildSessionHeader(
    Motorcycle motor,
    WorkSession session,
    WorkSessionViewModel model,
  ) {
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
                "${motor.brand} ${motor.model}",
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
            motor.policeNumber,
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
            _formatRupiah(model.state.currentIncome),
            style: const TextStyle(
              color: AppColors.dark,
              fontSize: 28,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.8,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            'Target ${_formatRupiah(model.state.workSession!.goalProfit)}',
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
                icon: Icons.access_time_rounded,
                value: _formatRupiah(0),
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
                value: _formatRupiah(0),
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

        Expanded(
          child: _buildQuickAction(
            icon: Icons.local_gas_station_rounded,
            title: 'Bensin',
            onTap: () {
              _showFuelSheet();
            },
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: _buildQuickAction(
            icon: Icons.payments_rounded,
            title: 'Pengeluaran',
            onTap: () {
              // TODO: expense sheet
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.dark, size: 20),
            ),

            const SizedBox(height: 7),

            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFuelSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        double temporaryFuel = _fuelLevel;

        return StatefulBuilder(
          builder: (context, setSheetState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Update Bensin',
                      style: TextStyle(
                        color: AppColors.dark,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Sesuaikan kondisi bensin motor saat ini.',
                      style: TextStyle(color: AppColors.muted, fontSize: 13),
                    ),

                    const SizedBox(height: 20),

                    Center(
                      child: Text(
                        '${temporaryFuel.round()}%',
                        style: const TextStyle(
                          color: AppColors.green,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: AppColors.green,
                        thumbColor: AppColors.green,
                        trackHeight: 8,
                      ),
                      child: Slider(
                        value: temporaryFuel,
                        min: 0,
                        max: 100,
                        divisions: 20,
                        onChanged: (value) {
                          setSheetState(() {
                            temporaryFuel = value;
                          });
                        },
                      ),
                    ),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'E',
                          style: TextStyle(
                            color: AppColors.muted,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'F',
                          style: TextStyle(
                            color: AppColors.muted,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _fuelLevel = temporaryFuel;
                          });

                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Simpan',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFinishButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: _showFinishConfirmation,
        icon: const Icon(Icons.stop_circle_outlined, size: 21),
        label: const Text(
          'Akhiri Sesi Narik',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.dark,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
