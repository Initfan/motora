import 'package:flutter/material.dart';
import 'package:motora/model/motor_model.dart';
import 'package:motora/utils/api.dart';
import 'package:motora/utils/colors.dart';

class SelectMotorPage extends StatefulWidget {
  const SelectMotorPage({super.key});

  @override
  State<SelectMotorPage> createState() => _SelectMotorPageState();
}

class _SelectMotorPageState extends State<SelectMotorPage> {
  List<MotorModel> _motorcycles = [];

  MotorModel? _selectedMotorcycle;

  bool _isLoading = true;
  bool _isSelecting = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadMotorcycles();
  }

  Future<void> _loadMotorcycles() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await api.get('/motorcycle/user');

      final motorcycles = _parseMotorcycles(response);

      if (!mounted) return;

      setState(() {
        _motorcycles = motorcycles;

        if (motorcycles.length == 1) {
          _selectedMotorcycle = motorcycles.first;
        }
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _errorMessage = _getErrorMessage(e);
      });
    } finally {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });
    }
  }

  List<MotorModel> _parseMotorcycles(dynamic response) {
    dynamic data = response['data'].values.toList();

    if (data is! List) {
      throw Exception('Format data motor tidak valid');
    }

    return data
        .whereType<Map>()
        .map((item) => MotorModel.fromJson(Map<String, dynamic>.from(item)))
        .toList();
  }

  String _getErrorMessage(Object error) {
    final message = error.toString();

    if (message.contains('SocketException')) {
      return 'Tidak dapat terhubung ke server.';
    }

    if (message.contains('401')) {
      return 'Sesi login kamu telah berakhir.';
    }

    return 'Gagal mengambil data motor.';
  }

  void _selectMotorcycle(MotorModel motorcycle) {
    setState(() {
      _selectedMotorcycle = motorcycle;
    });
  }

  Future<void> _useSelectedMotorcycle() async {
    final motorcycle = _selectedMotorcycle;

    if (motorcycle == null) {
      _showSnackBar('Pilih motor terlebih dahulu', isError: true);
      return;
    }

    setState(() {
      _isSelecting = true;
    });

    if (!mounted) return;

    setState(() {
      _isSelecting = false;
    });

    Navigator.pop(context, motorcycle);
  }

  Future<void> _addMotorcycle() async {
    final result = await Navigator.pushNamed(context, '/motorcycle/add');

    if (result == true && mounted) {
      await _loadMotorcycles();
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: isError ? Colors.red.shade700 : AppColors.dark,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: _buildAppBar(),

      body: SafeArea(child: _buildBody()),

      bottomNavigationBar: _buildBottomAction(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,

      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded, color: AppColors.dark),
      ),

      title: const Text(
        'Pilih Motor',
        style: TextStyle(
          color: AppColors.dark,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
        ),
      ),

      centerTitle: false,
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return _buildLoading();
    }

    if (_errorMessage != null) {
      return _buildError();
    }

    if (_motorcycles.isEmpty) {
      return _buildEmpty();
    }

    return RefreshIndicator(
      color: AppColors.green,
      onRefresh: _loadMotorcycles,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          _buildHeader(),

          const SizedBox(height: 24),

          ..._motorcycles.map(
            (motorcycle) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildMotorcycleCard(motorcycle),
            ),
          ),

          const SizedBox(height: 8),

          _buildAddMotorButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gunakan motor yang akan\ndipakai hari ini.',
          style: TextStyle(
            color: AppColors.dark,
            fontSize: 26,
            height: 1.2,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.7,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          '${_motorcycles.length} motor terdaftar',
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildMotorcycleCard(MotorModel motorcycle) {
    final isSelected = _selectedMotorcycle?.id == motorcycle.id;

    return GestureDetector(
      onTap: () {
        _selectMotorcycle(motorcycle);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 245, 232, 232),

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

        child: Row(
          children: [
            _buildMotorcycleImage(motorcycle),

            const SizedBox(width: 14),

            Expanded(child: _buildMotorcycleInfo(motorcycle)),

            const SizedBox(width: 10),

            _buildSelectionIndicator(isSelected),
          ],
        ),
      ),
    );
  }

  Widget _buildMotorcycleImage(MotorModel motorcycle) {
    final photo = motorcycle.motor_url;

    return Container(
      width: 76,
      height: 76,

      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(14),
      ),

      clipBehavior: Clip.antiAlias,

      child: photo != null && photo.isNotEmpty
          ? Image.network(
              photo,
              fit: BoxFit.cover,

              errorBuilder: (context, error, stackTrace) {
                return _buildMotorPlaceholder();
              },

              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.green,
                    ),
                  ),
                );
              },
            )
          : _buildMotorPlaceholder(),
    );
  }

  Widget _buildMotorPlaceholder() {
    return const Center(
      child: Icon(
        Icons.two_wheeler_rounded,
        size: 36,
        color: Color(0xFF98A2B3),
      ),
    );
  }

  Widget _buildMotorcycleInfo(MotorModel motorcycle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${motorcycle.brand} ${motorcycle.model}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.dark,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          "${motorcycle.policeNumber}",
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),

        const SizedBox(height: 9),

        Row(
          children: [
            const Icon(Icons.speed_rounded, size: 15, color: AppColors.muted),

            const SizedBox(width: 4),

            Text(
              '${_formatNumber(motorcycle.kilometers ?? 0)} km',
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(width: 10),

            Container(
              width: 3,
              height: 3,
              decoration: const BoxDecoration(
                color: AppColors.border,
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(width: 10),

            Text(
              "${motorcycle.transmission}",
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectionIndicator(bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),

      width: 24,
      height: 24,

      decoration: BoxDecoration(
        shape: BoxShape.circle,

        color: isSelected ? AppColors.green : Colors.white,

        border: Border.all(
          color: isSelected ? AppColors.green : const Color(0xFFD0D5DD),
          width: 1.5,
        ),
      ),

      child: isSelected
          ? const Icon(Icons.check_rounded, size: 16, color: Colors.white)
          : null,
    );
  }

  Widget _buildAddMotorButton() {
    return OutlinedButton.icon(
      onPressed: _addMotorcycle,

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
    if (_isLoading || _errorMessage != null || _motorcycles.isEmpty) {
      return const SizedBox.shrink();
    }

    final canContinue = _selectedMotorcycle != null;

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
            onPressed: canContinue && !_isSelecting
                ? _useSelectedMotorcycle
                : null,

            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green,
              disabledBackgroundColor: const Color(0xFFE4E7EC),
              foregroundColor: Colors.white,
              elevation: 0,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),

            child: _isSelecting
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
          ),
        ),
      ),
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

  Widget _buildError() {
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
              _errorMessage ?? 'Terjadi kesalahan.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 14,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _loadMotorcycles,
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
                onPressed: _addMotorcycle,
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

  String _formatNumber(int number) {
    final value = number.toString();

    return value.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    );
  }
}
