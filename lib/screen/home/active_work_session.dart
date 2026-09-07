import 'dart:async';

import 'package:flutter/material.dart';
import 'package:motora/screen/home/finish_work_session.dart';
import 'package:motora/utils/colors.dart';

class ActiveWorkPage extends StatefulWidget {
  final String platform;
  final double targetProfit;

  const ActiveWorkPage({
    super.key,
    required this.platform,
    required this.targetProfit,
  });

  @override
  State<ActiveWorkPage> createState() => _ActiveWorkPageState();
}

class _ActiveWorkPageState extends State<ActiveWorkPage> {
  Timer? _timer;

  Duration _duration = Duration.zero;

  int _orders = 0;
  double _income = 0;
  double _distance = 0;
  double _fuel = 0;

  final TextEditingController _incomeController = TextEditingController();

  final TextEditingController _fuelController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          _duration += const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _incomeController.dispose();
    _fuelController.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  String _rupiah(double value) {
    final text = value.round().toString();

    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i > 0 && (text.length - i) % 3 == 0) {
        buffer.write('.');
      }

      buffer.write(text[i]);
    }

    return 'Rp${buffer.toString()}';
  }

  double get progress {
    if (widget.targetProfit <= 0) return 0;

    return (_income / widget.targetProfit).clamp(0.0, 1.0);
  }

  double get profitPerHour {
    final hours = _duration.inSeconds / 3600;

    if (hours <= 0) return 0;

    return _income / hours;
  }

  void _addOrder() {
    setState(() {
      _orders++;
      _income += 12500;
      _distance += 4.2;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Order berhasil ditambahkan'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _addFuel() {
    _fuelController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return _FuelSheet(
          onSave: (amount) {
            setState(() {
              _fuel += amount;
            });
          },
        );
      },
    );
  }

  void _finishWork() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => FinishWorkPage(
          platform: widget.platform,
          orders: _orders,
          income: _income,
          fuel: _fuel,
          distance: _distance,
          duration: _formatDuration(_duration),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 9,
              height: 9,
              decoration: const BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Sedang Narik',
              style: TextStyle(
                color: AppColors.dark,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
          children: [
            _buildActiveHeader(),

            const SizedBox(height: 16),

            _buildIncomeCard(),

            const SizedBox(height: 16),

            _buildStats(),

            const SizedBox(height: 16),

            _buildTargetCard(),

            const SizedBox(height: 20),

            _buildQuickActions(),

            const SizedBox(height: 20),

            _buildFinishButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.green.withOpacity(.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.circle, size: 8, color: AppColors.green),
                    SizedBox(width: 6),
                    Text(
                      'AKTIF',
                      style: TextStyle(
                        color: Color(0xFF7EE2A7),
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            widget.platform,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Sesi narik sedang berjalan',
            style: TextStyle(color: Color(0xFF98A2B3), fontSize: 13),
          ),

          const SizedBox(height: 22),

          const Text(
            'DURASI',
            style: TextStyle(
              color: Color(0xFF98A2B3),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            _formatDuration(_duration),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncomeCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E9E7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PENDAPATAN SAAT INI',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 7),

          Text(
            _rupiah(_income),
            style: const TextStyle(
              color: AppColors.green,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            '$_orders order selesai',
            style: const TextStyle(color: AppColors.muted, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        Expanded(
          child: _statCard(Icons.receipt_long_rounded, 'Orders', '$_orders'),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _statCard(
            Icons.route_rounded,
            'Jarak',
            '${_distance.toStringAsFixed(1)} km',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _statCard(
            Icons.speed_rounded,
            'Rp/Jam',
            _rupiah(profitPerHour),
          ),
        ),
      ],
    );
  }

  Widget _statCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFE5E9E7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.green, size: 21),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(color: AppColors.muted, fontSize: 11),
          ),

          const SizedBox(height: 3),

          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.dark,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTargetCard() {
    final percentage = (progress * 100).round();
    final targetReached = _income >= widget.targetProfit;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E9E7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Target Profit',
                style: TextStyle(
                  color: AppColors.dark,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                '$percentage%',
                style: const TextStyle(
                  color: AppColors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 9,
              backgroundColor: const Color(0xFFE8ECEA),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.green),
            ),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _rupiah(_income),
                style: const TextStyle(
                  color: AppColors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Target ${_rupiah(widget.targetProfit)}',
                style: const TextStyle(color: AppColors.muted, fontSize: 12),
              ),
            ],
          ),

          if (targetReached) ...[
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFE1F4E8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.green,
                    size: 18,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Target profit sudah tercapai!',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(
            color: AppColors.dark,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: _actionButton(
                icon: Icons.add_rounded,
                title: 'Tambah Order',
                onTap: _addOrder,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _actionButton(
                icon: Icons.local_gas_station_rounded,
                title: 'Catat Bensin',
                onTap: _addFuel,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFE1E6E3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.green, size: 21),
            const SizedBox(width: 7),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.dark,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinishButton() {
    return SizedBox(
      height: 56,
      child: ElevatedButton.icon(
        onPressed: _finishWork,
        icon: const Icon(Icons.stop_circle_outlined, size: 22),
        label: const Text(
          'Selesaikan Sesi',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE45555),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

class _FuelSheet extends StatefulWidget {
  final ValueChanged<double> onSave;

  const _FuelSheet({required this.onSave});

  @override
  State<_FuelSheet> createState() => _FuelSheetState();
}

class _FuelSheetState extends State<_FuelSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() {
    final amount = double.tryParse(_controller.text) ?? 0;

    if (amount <= 0) return;

    widget.onSave(amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFD8DDE1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Catat Bensin',
              style: TextStyle(
                color: AppColors.dark,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Masukkan biaya bensin sesi ini.',
              style: TextStyle(color: AppColors.muted, fontSize: 13),
            ),

            const SizedBox(height: 18),

            TextField(
              controller: _controller,
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya bensin',
                prefixText: 'Rp ',
                filled: true,
                fillColor: const Color(0xFFF8FAF9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(color: Color(0xFFE0E5E2)),
                ),
              ),
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _save,
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
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
