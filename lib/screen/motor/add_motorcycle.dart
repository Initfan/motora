import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motora/components/motora.dart';
import 'package:motora/utils/api.dart';

class AddMotorcyclePage extends StatefulWidget {
  const AddMotorcyclePage({super.key});

  @override
  State<AddMotorcyclePage> createState() => _AddMotorcyclePageState();
}

class _AddMotorcyclePageState extends State<AddMotorcyclePage> {
  final _formKey = GlobalKey<FormState>();

  final _brandController = TextEditingController();
  final _modelController = TextEditingController();
  final _yearController = TextEditingController();
  final _policeNumberController = TextEditingController();
  final _kilometersController = TextEditingController();
  File? _motorcycleImage;
  final ImagePicker _imagePicker = ImagePicker();

  String _transmission = 'MATIC';

  DateTime? _lastServiceDate;

  bool _isLoading = false;

  @override
  void dispose() {
    _brandController.dispose();
    _modelController.dispose();
    _yearController.dispose();
    _policeNumberController.dispose();
    _kilometersController.dispose();

    super.dispose();
  }

  Future<void> _pickMotorcycleImage(ImageSource source) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1600,
        maxHeight: 1600,
      );

      if (image == null) return;

      setState(() {
        _motorcycleImage = File(image.path);
      });
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Gagal memilih foto: $e')));
    }
  }

  Future<void> _selectServiceDate() async {
    final now = DateTime.now();

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _lastServiceDate ?? now,
      firstDate: DateTime(2000),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF08A94F),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF101828),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        _lastServiceDate = selectedDate;
      });
    }
  }

  String _formatDate(DateTime date) {
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];

    return '${date.day} '
        '${months[date.month - 1]} '
        '${date.year}';
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await api.postMultipart(
        '/motorcycle',

        fields: {
          'brand': _brandController.text.trim(),
          'model': _modelController.text.trim(),
          'year': _yearController.text.trim(),
          'transmission': _transmission,
          'police_number': _policeNumberController.text.trim().toUpperCase(),
          'kilometers': _kilometersController.text.trim().replaceAll('.', ''),
          if (_lastServiceDate != null)
            'last_service_date': _lastServiceDate!.toIso8601String(),
        },

        files: _motorcycleImage != null
            ? {'motor': _motorcycleImage!.path}
            : null,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Motor berhasil ditambahkan'),
          backgroundColor: Color(0xFF08A94F),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Motora()),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  InputDecoration _inputDecoration({
    required String label,
    String? hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,

      labelStyle: const TextStyle(color: Color(0xFF667085), fontSize: 14),

      hintStyle: const TextStyle(color: Color(0xFF98A2B3), fontSize: 14),

      filled: true,
      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFEAECEF)),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFEAECEF)),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFF08A94F), width: 1.5),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      body: SafeArea(
        child: Form(
          key: _formKey,

          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  'Data Motor',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF101828),
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Masukkan informasi motor yang '
                  'digunakan untuk bekerja.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF667085),
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 24),

                _buildMotorcyclePhoto(),

                const SizedBox(height: 24),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFEAECEF)),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,

                            decoration: BoxDecoration(
                              color: const Color(0xFFEAF8F0),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            child: const Icon(
                              Icons.two_wheeler_rounded,
                              color: Color(0xFF08A94F),
                              size: 22,
                            ),
                          ),

                          const SizedBox(width: 12),

                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Informasi Motor',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF101828),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Lengkapi data kendaraan',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF667085),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      TextFormField(
                        controller: _brandController,

                        textCapitalization: TextCapitalization.words,

                        decoration: _inputDecoration(
                          label: 'Brand',
                          hint: 'Contoh: Honda',
                        ),

                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Brand wajib diisi';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      TextFormField(
                        controller: _modelController,

                        textCapitalization: TextCapitalization.words,

                        decoration: _inputDecoration(
                          label: 'Model',
                          hint: 'Contoh: Beat 2022',
                        ),

                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Model wajib diisi';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      TextFormField(
                        controller: _yearController,

                        keyboardType: TextInputType.number,

                        maxLength: 4,

                        decoration: _inputDecoration(
                          label: 'Tahun',
                          hint: 'Contoh: 2022',
                        ).copyWith(counterText: ''),

                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Tahun wajib diisi';
                          }

                          final year = int.tryParse(value);

                          if (year == null) {
                            return 'Tahun tidak valid';
                          }

                          if (year < 1980 || year > DateTime.now().year + 1) {
                            return 'Tahun tidak valid';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      DropdownButtonFormField<String>(
                        value: _transmission,

                        decoration: _inputDecoration(label: 'Transmisi'),

                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF667085),
                        ),

                        items: const [
                          DropdownMenuItem(
                            value: 'MATIC',
                            child: Text('Matic'),
                          ),
                          DropdownMenuItem(
                            value: 'MANUAL',
                            child: Text('Manual'),
                          ),
                        ],

                        onChanged: (value) {
                          if (value == null) return;

                          setState(() {
                            _transmission = value;
                          });
                        },
                      ),

                      const SizedBox(height: 16),

                      TextFormField(
                        controller: _policeNumberController,

                        textCapitalization: TextCapitalization.characters,

                        decoration: _inputDecoration(
                          label: 'Nomor Polisi',
                          hint: 'Contoh: B 1234 ABC',
                          prefixIcon: const Icon(
                            Icons.confirmation_number_outlined,
                            size: 20,
                            color: Color(0xFF667085),
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Nomor polisi wajib diisi';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      TextFormField(
                        controller: _kilometersController,

                        keyboardType: TextInputType.number,

                        decoration: _inputDecoration(
                          label: 'Kilometer Saat Ini',
                          hint: 'Contoh: 35724',
                          suffixIcon: const Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Center(
                              widthFactor: 1,
                              child: Text(
                                'km',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF667085),
                                ),
                              ),
                            ),
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Kilometer wajib diisi';
                          }

                          final km = int.tryParse(
                            value.trim().replaceAll('.', ''),
                          );

                          if (km == null || km < 0) {
                            return 'Kilometer tidak valid';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFEAECEF)),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        'Servis Terakhir',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF101828),
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        'Opsional, dapat membantu menghitung '
                        'jadwal maintenance.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF667085),
                        ),
                      ),

                      const SizedBox(height: 16),

                      InkWell(
                        borderRadius: BorderRadius.circular(14),

                        onTap: _selectServiceDate,

                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFFEAECEF)),
                          ),

                          child: Row(
                            children: [
                              Container(
                                width: 38,
                                height: 38,

                                decoration: BoxDecoration(
                                  color: const Color(0xFFEAF8F0),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 19,
                                  color: Color(0xFF08A94F),
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    const Text(
                                      'Tanggal servis',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF667085),
                                      ),
                                    ),

                                    const SizedBox(height: 3),

                                    Text(
                                      _lastServiceDate == null
                                          ? 'Pilih tanggal'
                                          : _formatDate(_lastServiceDate!),

                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: _lastServiceDate == null
                                            ? const Color(0xFF98A2B3)
                                            : const Color(0xFF101828),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0xFF98A2B3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF8F0),
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: Color(0xFF08A94F),
                        size: 20,
                      ),

                      SizedBox(width: 12),

                      Expanded(
                        child: Text(
                          'Rata-rata kilometer per hari dan '
                          'status kesehatan motor akan '
                          'diperbarui otomatis berdasarkan '
                          'aktivitas Anda.',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.5,
                            color: Color(0xFF344054),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  height: 54,

                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _submit,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF08A94F),

                      disabledBackgroundColor: const Color(0xFF98A2B3),

                      foregroundColor: Colors.white,

                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),

                    child: _isLoading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_rounded, size: 21),
                              SizedBox(width: 8),
                              Text(
                                'Simpan Motor',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMotorcyclePhoto() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEAECEF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Foto Motor',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF101828),
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Tambahkan foto motor agar lebih mudah dikenali.',
            style: TextStyle(fontSize: 12, color: Color(0xFF667085)),
          ),

          const SizedBox(height: 16),

          GestureDetector(
            onTap: () {
              _showImageSourceSheet();
            },
            child: Container(
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFEAECEF)),
              ),
              child: _motorcycleImage == null
                  ? _buildEmptyPhotoState()
                  : _buildImagePreview(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyPhotoState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF8F0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.add_a_photo_outlined,
            color: Color(0xFF08A94F),
            size: 26,
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'Tambahkan foto motor',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF101828),
          ),
        ),

        const SizedBox(height: 4),

        const Text(
          'Kamera atau galeri',
          style: TextStyle(fontSize: 12, color: Color(0xFF667085)),
        ),
      ],
    );
  }

  Widget _buildImagePreview() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(_motorcycleImage!, fit: BoxFit.cover),

          Positioned(
            right: 12,
            top: 12,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _motorcycleImage = null;
                  });
                },
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showImageSourceSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD0D5DD),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Tambah Foto Motor',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF101828),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: _imageSourceButton(
                        icon: Icons.camera_alt_outlined,
                        title: 'Kamera',
                        onTap: () {
                          Navigator.pop(context);

                          _pickMotorcycleImage(ImageSource.camera);
                        },
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _imageSourceButton(
                        icon: Icons.photo_library_outlined,
                        title: 'Galeri',
                        onTap: () {
                          Navigator.pop(context);

                          _pickMotorcycleImage(ImageSource.gallery);
                        },
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

  Widget _imageSourceButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEAECEF)),
        ),
        child: Column(
          children: [
            Icon(icon, size: 26, color: const Color(0xFF08A94F)),

            const SizedBox(height: 8),

            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF101828),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
