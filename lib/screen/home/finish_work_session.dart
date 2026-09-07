import 'package:flutter/material.dart';
import 'package:motora/utils/colors.dart';

class FinishWorkPage extends StatefulWidget {
  final String platform;
  final int orders;
  final double income;
  final double fuel;
  final double distance;
  final String duration;

  const FinishWorkPage({
    super.key,
    required this.platform,
    required this.orders,
    required this.income,
    required this.fuel,
    required this.distance,
    required this.duration,
  });

  @override
  State<FinishWorkPage> createState() => _FinishWorkPageState();
}

class _FinishWorkPageState extends State<FinishWorkPage> {
  final TextEditingController _parkingController = TextEditingController(
    text: '0',
  );

  final TextEditingController _mealController = TextEditingController(
    text: '0',
  );

  final TextEditingController _otherController = TextEditingController(
    text: '0',
  );

  final TextEditingController _noteController = TextEditingController();

  double get parking => double.tryParse(_parkingController.text) ?? 0;

  double get meal => double.tryParse(_mealController.text) ?? 0;

  double get other => double.tryParse(_otherController.text) ?? 0;

  double get totalCost => widget.fuel + parking + meal + other;

  double get netProfit => widget.income - totalCost;

  double get targetProgress {
    const target = 250000.0;

    if (widget.income >= target) {
      return 1;
    }

    return widget.income / target;
  }

  @override
  void initState() {
    super.initState();

    _parkingController.addListener(_refresh);
    _mealController.addListener(_refresh);
    _otherController.addListener(_refresh);
  }

  void _refresh() {
    setState(() {});
  }

  @override
  void dispose() {
    _parkingController.dispose();
    _mealController.dispose();
    _otherController.dispose();
    _noteController.dispose();
    super.dispose();
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

  void _saveSession() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Sesi berhasil disimpan',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.dark,
            ),
          ),
          content: const Text(
            'Data sesi narik kamu sudah berhasil dicatat.',
            style: TextStyle(color: AppColors.muted, height: 1.5),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Selesai',
                style: TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool targetReached = widget.income >= 250000;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.dark,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Selesaikan Sesi',
          style: TextStyle(
            color: AppColors.dark,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
          children: [
            _buildSessionCard(),

            const SizedBox(height: 18),

            _sectionTitle('Ringkasan Pendapatan'),

            const SizedBox(height: 10),

            _buildIncomeCard(),

            const SizedBox(height: 18),

            _sectionTitle('Biaya Operasional'),

            const SizedBox(height: 10),

            _buildCostCard(),

            const SizedBox(height: 18),

            _sectionTitle('Hasil Sesi'),

            const SizedBox(height: 10),

            _buildProfitCard(),

            const SizedBox(height: 18),

            _sectionTitle('Pencapaian Target'),

            const SizedBox(height: 10),

            _buildTargetCard(targetReached),

            const SizedBox(height: 18),

            _sectionTitle('Catatan'),

            const SizedBox(height: 10),

            _buildNoteField(),

            const SizedBox(height: 24),

            SizedBox(
              height: 54,
              child: ElevatedButton(
                onPressed: _saveSession,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Simpan Sesi',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.dark,
                  side: const BorderSide(color: Color(0xFFD8DDE3)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Kembali',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: AppColors.dark,
      ),
    );
  }

  Widget _buildSessionCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SESI HARI INI',
            style: TextStyle(
              color: Color(0xFF98A2B3),
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            widget.platform,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              _sessionInfo(
                Icons.receipt_long_rounded,
                '${widget.orders} Orders',
              ),
              const SizedBox(width: 18),
              _sessionInfo(Icons.timer_outlined, widget.duration),
              const SizedBox(width: 18),
              _sessionInfo(
                Icons.route_rounded,
                '${widget.distance.toStringAsFixed(1)} km',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sessionInfo(IconData icon, String text) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFB8F0CC), size: 17),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncomeCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE7EBE9)),
      ),
      child: Column(
        children: [
          _moneyRow('Pendapatan Order', widget.income, bold: true),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(height: 1, color: Color(0xFFECEFF1)),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pendapatan Kotor',
                style: TextStyle(
                  color: AppColors.dark,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                _rupiah(widget.income),
                style: const TextStyle(
                  color: AppColors.green,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCostCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE7EBE9)),
      ),
      child: Column(
        children: [
          _costField(
            label: 'Bensin',
            controller: TextEditingController(
              text: widget.fuel.round().toString(),
            ),
            enabled: false,
          ),

          const SizedBox(height: 12),

          _costField(label: 'Parkir', controller: _parkingController),

          const SizedBox(height: 12),

          _costField(label: 'Makan / Minum', controller: _mealController),

          const SizedBox(height: 12),

          _costField(label: 'Biaya Lainnya', controller: _otherController),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(height: 1, color: Color(0xFFECEFF1)),
          ),

          _moneyRow(
            'Total Biaya',
            totalCost,
            color: const Color(0xFFE25B5B),
            bold: true,
          ),
        ],
      ),
    );
  }

  Widget _costField({
    required String label,
    required TextEditingController controller,
    bool enabled = true,
  }) {
    return TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        prefixText: 'Rp ',
        filled: true,
        fillColor: enabled ? const Color(0xFFF8FAF9) : const Color(0xFFF0F2F3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE1E5E8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE1E5E8)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE1E5E8)),
        ),
      ),
    );
  }

  Widget _moneyRow(
    String title,
    double amount, {
    Color color = AppColors.dark,
    bool bold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 14,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
        Text(
          _rupiah(amount),
          style: TextStyle(
            color: color,
            fontSize: 15,
            fontWeight: bold ? FontWeight.w900 : FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildProfitCard() {
    final bool positive = netProfit >= 0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE8F8EE), Color(0xFFF6FBF8)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFCBEBD7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PROFIT BERSIH',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            _rupiah(netProfit),
            style: TextStyle(
              color: positive ? AppColors.green : const Color(0xFFE25B5B),
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            positive
                ? 'Pendapatan setelah dikurangi biaya operasional'
                : 'Biaya operasional melebihi pendapatan',
            style: const TextStyle(color: AppColors.muted, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildTargetCard(bool targetReached) {
    final percent = (targetProgress * 100).clamp(0, 100);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE7EBE9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Target harian',
                style: TextStyle(
                  color: AppColors.dark,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${percent.toStringAsFixed(0)}%',
                style: TextStyle(
                  color: targetReached ? AppColors.green : AppColors.muted,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: targetProgress,
              minHeight: 10,
              backgroundColor: const Color(0xFFE8ECEA),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.green),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _rupiah(widget.income),
                style: const TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Text(
                'Target Rp250.000',
                style: TextStyle(color: AppColors.muted, fontSize: 12),
              ),
            ],
          ),

          if (targetReached) ...[
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
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
                    'Target harian berhasil tercapai!',
                    style: TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
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

  Widget _buildNoteField() {
    return TextField(
      controller: _noteController,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Tambahkan catatan untuk sesi ini...',
        hintStyle: const TextStyle(color: Color(0xFF98A2B3), fontSize: 13),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFE1E5E8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFE1E5E8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.green, width: 1.5),
        ),
      ),
    );
  }
}
