import 'package:flutter/material.dart';
import 'package:motora/components/profile/logout.dart';
import 'package:motora/utils/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _notifications = true;
  bool _sound = true;
  bool darkMode = false;
  final String _username = 'Andi Kentang';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAF9),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppColors.dark,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _openEditProfile,
            icon: const Icon(Icons.edit_outlined, color: AppColors.dark),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 30),
          children: [
            _buildProfileHeader(),

            const SizedBox(height: 16),

            _buildAccountSection(),

            const SizedBox(height: 16),

            _buildVehicleSection(),

            const SizedBox(height: 16),

            _buildSettingsSection(),

            const SizedBox(height: 16),

            _buildHelpSection(),

            const SizedBox(height: 16),

            Logout(),

            const SizedBox(height: 18),

            const Center(
              child: Text(
                'MotoCare Driver v1.0.0',
                style: TextStyle(
                  color: Color(0xFF98A2B3),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE6E9EC)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: const Color(0xFFE3F6EB),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.green.withOpacity(0.18),
                width: 2,
              ),
            ),
            child: const Center(
              child: Text(
                'AR',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _username,
                  style: TextStyle(
                    color: AppColors.dark,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '0812 3456 7890',
                  style: TextStyle(color: AppColors.muted, fontSize: 12),
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Icon(
                      Icons.verified_rounded,
                      color: AppColors.green,
                      size: 15,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Driver Terverifikasi',
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFE7F7ED),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Aktif',
              style: TextStyle(
                color: AppColors.green,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSection() {
    return _ProfileSection(
      title: 'Akun',
      children: [
        _ProfileMenuItem(
          icon: Icons.person_outline_rounded,
          iconColor: const Color(0xFF4B7BEC),
          iconBackground: const Color(0xFFEAF0FF),
          title: 'Data Pribadi',
          subtitle: 'Nama, nomor HP, dan alamat',
          onTap: _openEditProfile,
        ),

        _ProfileMenuItem(
          icon: Icons.badge_outlined,
          iconColor: const Color(0xFF7655C9),
          iconBackground: const Color(0xFFEDE7FF),
          title: 'Dokumen Driver',
          subtitle: 'KTP, SIM, dan dokumen lainnya',
          onTap: _showDocuments,
        ),

        _ProfileMenuItem(
          icon: Icons.security_outlined,
          iconColor: const Color(0xFF08A94F),
          iconBackground: const Color(0xFFE3F6EB),
          title: 'Keamanan Akun',
          subtitle: 'PIN dan keamanan login',
          onTap: _showSecurity,
          showDivider: false,
        ),
      ],
    );
  }

  Widget _buildVehicleSection() {
    return _ProfileSection(
      title: 'Kendaraan',
      children: [
        _ProfileMenuItem(
          icon: Icons.two_wheeler_rounded,
          iconColor: AppColors.green,
          iconBackground: const Color(0xFFE3F6EB),
          title: 'Honda Beat 2022',
          subtitle: 'B 4821 KLM • 35.724 km',
          trailing: const Text(
            'Baik',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          onTap: _showVehicle,
          showDivider: false,
        ),
      ],
    );
  }

  Widget _buildSettingsSection() {
    return _ProfileSection(
      title: 'Pengaturan',
      children: [
        _ProfileSwitchItem(
          icon: Icons.notifications_none_rounded,
          iconColor: const Color(0xFFE59B20),
          iconBackground: const Color(0xFFFFF3DC),
          title: 'Notifikasi',
          subtitle: 'Pengingat dan informasi penting',
          value: _notifications,
          onChanged: (value) {
            setState(() {
              _notifications = value;
            });
          },
        ),

        _ProfileSwitchItem(
          icon: Icons.volume_up_outlined,
          iconColor: const Color(0xFF4B7BEC),
          iconBackground: const Color(0xFFEAF0FF),
          title: 'Suara',
          subtitle: 'Suara notifikasi dan pengingat',
          value: _sound,
          onChanged: (value) {
            setState(() {
              _sound = value;
            });
          },
        ),

        _ProfileSwitchItem(
          icon: Icons.dark_mode_outlined,
          iconColor: const Color(0xFF7655C9),
          iconBackground: const Color(0xFFEDE7FF),
          title: 'Mode Gelap',
          subtitle: 'Gunakan tampilan gelap',
          value: darkMode ? true : false,
          onChanged: (value) {
            setState(() {
              darkMode = value;
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  value ? 'Mode gelap diaktifkan' : 'Mode gelap dinonaktifkan',
                ),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          showDivider: false,
        ),
      ],
    );
  }

  Widget _buildHelpSection() {
    return _ProfileSection(
      title: 'Bantuan',
      children: [
        _ProfileMenuItem(
          icon: Icons.help_outline_rounded,
          iconColor: const Color(0xFF4B7BEC),
          iconBackground: const Color(0xFFEAF0FF),
          title: 'Pusat Bantuan',
          subtitle: 'FAQ dan panduan penggunaan',
          onTap: _showHelp,
        ),

        _ProfileMenuItem(
          icon: Icons.chat_bubble_outline_rounded,
          iconColor: AppColors.green,
          iconBackground: const Color(0xFFE3F6EB),
          title: 'Hubungi Kami',
          subtitle: 'Butuh bantuan? Chat dengan kami',
          onTap: _contactUs,
        ),

        _ProfileMenuItem(
          icon: Icons.info_outline_rounded,
          iconColor: AppColors.muted,
          iconBackground: const Color(0xFFF0F1F2),
          title: 'Tentang MotoCare',
          subtitle: 'Versi dan informasi aplikasi',
          onTap: _showAbout,
          showDivider: false,
        ),
      ],
    );
  }

  void _openEditProfile() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _EditProfileSheet(_username),
    );
  }

  void _showDocuments() {
    _showInfoSheet(
      title: 'Dokumen Driver',
      icon: Icons.badge_outlined,
      children: [
        _InfoRow(
          label: 'KTP',
          value: 'Terverifikasi',
          valueColor: AppColors.green,
        ),
        _InfoRow(
          label: 'SIM C',
          value: 'Aktif • 18 Mei 2028',
          valueColor: AppColors.green,
        ),
        _InfoRow(
          label: 'STNK',
          value: 'Aktif • 21 Okt 2026',
          valueColor: AppColors.green,
        ),
      ],
    );
  }

  void _showSecurity() {
    _showInfoSheet(
      title: 'Keamanan Akun',
      icon: Icons.security_outlined,
      children: [
        _InfoRow(label: 'PIN', value: '••••••'),
        _InfoRow(
          label: 'Nomor HP',
          value: 'Terverifikasi',
          valueColor: AppColors.green,
        ),
        _InfoRow(label: 'Login terakhir', value: 'Hari ini, 07:52'),
      ],
    );
  }

  void _showVehicle() {
    _showInfoSheet(
      title: 'Informasi Kendaraan',
      icon: Icons.two_wheeler_rounded,
      children: [
        _InfoRow(label: 'Motor', value: 'Honda Beat 2022'),
        _InfoRow(label: 'Nomor Polisi', value: 'B 4821 KLM'),
        _InfoRow(label: 'Odometer', value: '35.724 km'),
        _InfoRow(label: 'Kondisi', value: 'Baik', valueColor: AppColors.green),
      ],
    );
  }

  void _showHelp() {
    _showInfoSheet(
      title: 'Pusat Bantuan',
      icon: Icons.help_outline_rounded,
      children: [
        _InfoRow(label: 'FAQ', value: 'Pertanyaan umum'),
        _InfoRow(label: 'Panduan', value: 'Cara menggunakan MotoCare'),
        _InfoRow(label: 'Dukungan', value: 'Tersedia setiap hari'),
      ],
    );
  }

  void _contactUs() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text(
            'Hubungi Kami',
            style: TextStyle(
              color: AppColors.dark,
              fontWeight: FontWeight.w800,
            ),
          ),
          content: const Text(
            'Tim support MotoCare siap membantu kamu.\n\n'
            'WhatsApp: 0812 0000 1234\n'
            'Email: support@motocare.id',
            style: TextStyle(color: AppColors.muted, fontSize: 13, height: 1.6),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Tutup',
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

  void _showAbout() {
    _showInfoSheet(
      title: 'Tentang MotoCare',
      icon: Icons.info_outline_rounded,
      children: [
        _InfoRow(label: 'Aplikasi', value: 'MotoCare Driver'),
        _InfoRow(label: 'Versi', value: '1.0.0'),
        _InfoRow(label: 'Build', value: '100'),
      ],
    );
  }

  void _showInfoSheet({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 42,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD0D5DD),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F6EB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: AppColors.green, size: 21),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.dark,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                ...children,
              ],
            ),
          ),
        );
      },
    );
  }
}

// ================================================================
// SECTION
// ================================================================

class _ProfileSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _ProfileSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.dark,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),

        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE6E9EC)),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}

// ================================================================
// MENU ITEM
// ================================================================

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback onTap;
  final bool showDivider;

  const _ProfileMenuItem({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: iconBackground,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Icon(icon, color: iconColor, size: 20),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: AppColors.dark,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (trailing != null) trailing!,

                  if (trailing != null) const SizedBox(width: 10),

                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFF98A2B3),
                    size: 21,
                  ),
                ],
              ),
            ),

            if (showDivider)
              const Divider(
                height: 1,
                indent: 66,
                endIndent: 14,
                color: Color(0xFFEEF0F2),
              ),
          ],
        ),
      ),
    );
  }
}

// ================================================================
// SWITCH ITEM
// ================================================================

class _ProfileSwitchItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool showDivider;

  const _ProfileSwitchItem({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.dark,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),

              Switch.adaptive(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.green,
              ),
            ],
          ),
        ),

        if (showDivider)
          const Divider(
            height: 1,
            indent: 66,
            endIndent: 14,
            color: Color(0xFFEEF0F2),
          ),
      ],
    );
  }
}

// ================================================================
// INFO ROW
// ================================================================

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: AppColors.muted, fontSize: 12),
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: valueColor ?? AppColors.dark,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// EDIT PROFILE SHEET
// ================================================================

class _EditProfileSheet extends StatefulWidget {
  const _EditProfileSheet(this.username);

  final String username;

  @override
  State<_EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<_EditProfileSheet> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.username);

    _phoneController = TextEditingController(text: '0812 3456 7890');

    _addressController = TextEditingController(text: 'Jakarta Selatan');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 42,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD0D5DD),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                'Edit Data Pribadi',
                style: TextStyle(
                  color: AppColors.dark,
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 20),

              _InputField(
                controller: _nameController,
                label: 'Nama Lengkap',
                icon: Icons.person_outline_rounded,
              ),

              const SizedBox(height: 13),

              _InputField(
                controller: _phoneController,
                label: 'Nomor HP',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 13),

              _InputField(
                controller: _addressController,
                label: 'Domisili',
                icon: Icons.location_on_outlined,
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data profil berhasil disimpan'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text(
                    'Simpan Perubahan',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================================================================
// INPUT
// ================================================================

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType? keyboardType;

  const _InputField({
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: AppColors.dark,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.muted, fontSize: 12),
        prefixIcon: Icon(icon, color: AppColors.muted, size: 20),
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE4E7EC)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE4E7EC)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.green, width: 1.5),
        ),
      ),
    );
  }
}
