import 'package:flutter/material.dart';
import 'package:motora/ui/motor/widget/motor_card.dart';
import 'package:motora/domain/models/motor/motorcycle.dart';
import 'package:motora/ui/motor/view_models/select_motor_view_model.dart';
import 'package:motora/utils/colors.dart';
import 'package:provider/provider.dart';

class SelectMotorScreen extends StatefulWidget {
  const SelectMotorScreen({super.key});

  @override
  State<SelectMotorScreen> createState() => _SelectMotorScreenState();
}

class _SelectMotorScreenState extends State<SelectMotorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pilih motor",
          style: TextStyle(color: AppColors.dark, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, '/'),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Consumer<SelectMotorViewModel>(
          builder: (context, viewModel, _) {
            final state = viewModel.state;

            if (state.isLoading) {
              return _buildLoading();
            }

            if (state.errorMessage != null) {
              return _buildError(viewModel);
            }

            if (state.motorcycles.isEmpty) {
              return _buildEmpty();
            }

            return _buildListMotor(viewModel);
          },
        ),
      ),
      bottomNavigationBar: _buildBottomAction(),
    );
  }

  ListView _buildListMotor(SelectMotorViewModel model) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${model.state.motorcycles.length} motor terdaftar',
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        ...model.state.motorcycles.map(
          (motorcycle) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildMotorcycleCard(motorcycle, model),
          ),
        ),

        const SizedBox(height: 8),

        _buildAddMotorButton(),
      ],
    );
  }

  Widget _buildMotorcycleCard(
    Motorcycle motorcycle,
    SelectMotorViewModel model,
  ) {
    final isSelected = model.state.selectedMotorcycle?.id == motorcycle.id;

    return GestureDetector(
      onTap: () => model.selectMotorcycle(motorcycle),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,

        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),

          border: Border.all(
            color: isSelected ? AppColors.green : AppColors.border,
            width: isSelected ? 1.5 : 1,
          ),

          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.green.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),

        child: Motor(data: motorcycle),
      ),
    );
  }

  Widget _buildAddMotorButton() {
    return OutlinedButton.icon(
      onPressed: () => Navigator.pushNamed(context, '/motor/add'),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.dark,
        minimumSize: const Size(double.infinity, 52),
        side: const BorderSide(color: AppColors.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),

      icon: const Icon(Icons.add_rounded, size: 21, color: AppColors.green),

      label: const Text(
        'Tambah Motor Baru',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildBottomAction() {
    return Consumer<SelectMotorViewModel>(
      builder: (context, model, child) {
        final state = model.state;

        return Container(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),

          decoration: const BoxDecoration(
            color: Colors.white,

            border: Border(top: BorderSide(color: AppColors.border)),
          ),

          child: SafeArea(
            top: false,
            child: SizedBox(
              height: 54,
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  if (state.selectedMotorcycle != null) {
                    model.selectMotorcycle(state.selectedMotorcycle!);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  disabledBackgroundColor: const Color(0xFFE4E7EC),
                  foregroundColor: Colors.white,
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),

                child: model.state.isSelecting
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Gunakan Motor Ini',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 12),

        Container(
          width: 240,
          height: 30,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F4F7),
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        const SizedBox(height: 10),

        Container(
          width: 150,
          height: 18,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F4F7),
            borderRadius: BorderRadius.circular(6),
          ),
        ),

        const SizedBox(height: 28),

        ...List.generate(
          3,
          (_) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            height: 105,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildError(SelectMotorViewModel model) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: const Color(0xFFFEF3F2),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.cloud_off_rounded,
                color: Color(0xFFD92D20),
                size: 30,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'Gagal memuat motor',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.dark,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              model.state.errorMessage ?? 'Terjadi kesalahan.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 14,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () => model.loadMotorcycles(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Coba Lagi',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.two_wheeler_rounded,
                color: AppColors.green,
                size: 40,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Belum ada motor',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.dark,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Tambahkan motor yang kamu gunakan\n'
              'untuk mulai mencatat aktivitas narik.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                // onPressed: _addMotorcycle,
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.add_rounded),
                label: const Text(
                  'Tambah Motor',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
