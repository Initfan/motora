import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motora/components/card.dart';
import 'package:motora/components/fuel_slider.dart';
import 'package:motora/components/motor_card.dart';
import 'package:motora/model/work_model.dart';
import 'package:motora/provider/motor_provider.dart';
import 'package:motora/screen/home/active_work_session.dart';
import 'package:motora/utils/api.dart';
import 'package:motora/utils/colors.dart';
import 'package:provider/provider.dart';

class StartWorkPage extends StatefulWidget {
  const StartWorkPage({super.key});

  @override
  State<StartWorkPage> createState() => _StartWorkPageState();
}

class _StartWorkPageState extends State<StartWorkPage> {
  String selectedPlatform = 'GrabFood';

  final TextEditingController profitController = TextEditingController();
  double fuelLevel = 0;

  final FocusNode profitFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    profitController.addListener(_formatProfit);
  }

  @override
  void dispose() {
    profitController.removeListener(_formatProfit);
    profitController.dispose();
    profitFocusNode.dispose();

    super.dispose();
  }

  void _formatProfit() {
    final rawText = profitController.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (rawText.isEmpty) {
      return;
    }

    final number = int.tryParse(rawText);

    if (number == null) {
      return;
    }

    final formatted = _formatRupiah(number);

    if (profitController.text == formatted) {
      return;
    }

    final cursorPosition = formatted.length;

    profitController.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }

  String _formatRupiah(int value) {
    final text = value.toString();

    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      final positionFromEnd = text.length - i;

      buffer.write(text[i]);

      if (positionFromEnd > 1 && positionFromEnd % 3 == 1) {
        buffer.write('.');
      }
    }

    return buffer.toString();
  }

  int get targetProfit {
    final raw = profitController.text.replaceAll(RegExp(r'[^0-9]'), '');

    return int.tryParse(raw) ?? 0;
  }

  Future<void> _showPlatformPicker() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: false,
      builder: (context) {
        return _PlatformPickerSheet(selectedPlatform: selectedPlatform);
      },
    );

    if (result != null) {
      setState(() {
        selectedPlatform = result;
      });
    }
  }

  void _startSession() async {
    final motor = Provider.of<MotorProvider>(context, listen: false).motor;

    if (targetProfit <= 0 || motor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Masukkan target profit terlebih dahulu.'),
        ),
      );

      profitFocusNode.requestFocus();
      return;
    }

    try {
      final res = await api.post(
        '/work/start',
        body: {
          "motorcycle_id": motor.id,
          "kilometers_start": motor.kilometers,
          "platform": selectedPlatform,
          "goal_profit": targetProfit,
          "fuel_condition": "${fuelLevel.ceil()}%",
        },
      );

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ActiveWorkPage(
            motor: motor,
            work: WorkModel.fromJson(res['data']),
            distance: 0,
            income: 0,
            totalOrder: 0,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFEFE),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),

                    const SizedBox(height: 22),

                    MotorCard(),

                    const SizedBox(height: 13),

                    const SizedBox(height: 13),

                    _PlatformCard(
                      selectedPlatform: selectedPlatform,
                      onTap: _showPlatformPicker,
                    ),

                    const SizedBox(height: 13),

                    CardMotora(
                      child: FuelLevelSlider(
                        value: fuelLevel,
                        onChanged: (level) {
                          setState(() => fuelLevel = level);
                        },
                      ),
                    ),

                    const SizedBox(height: 13),

                    _ProfitTargetCard(
                      controller: profitController,
                      focusNode: profitFocusNode,
                    ),

                    const SizedBox(height: 16),

                    const _TipCard(),
                  ],
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 13),
              color: const Color(0xFFFDFEFE),
              child: SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton.icon(
                  onPressed: _startSession,
                  icon: const Icon(Icons.play_arrow_rounded, size: 20),
                  label: const Text(
                    'Mulai',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const SizedBox(
            width: 34,
            height: 34,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: AppColors.dark,
              ),
            ),
          ),
        ),

        const SizedBox(width: 7),

        const Text(
          'Mulai Narik',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.dark,
            letterSpacing: -.25,
          ),
        ),
      ],
    );
  }
}

class _PlatformCard extends StatelessWidget {
  final String selectedPlatform;
  final VoidCallback onTap;

  const _PlatformCard({required this.selectedPlatform, required this.onTap});

  IconData get platformIcon {
    switch (selectedPlatform) {
      case 'GrabFood':
        return Icons.restaurant_rounded;

      case 'ShopeeFood':
        return Icons.shopping_bag_rounded;

      case 'Gojek':
        return Icons.two_wheeler_rounded;

      case 'Lalamove':
        return Icons.local_shipping_rounded;

      default:
        return Icons.apps_rounded;
    }
  }

  Color get platformColor {
    switch (selectedPlatform) {
      case 'GrabFood':
        return const Color(0xFF08A94F);

      case 'ShopeeFood':
        return const Color(0xFFEE4D2D);

      case 'Gojek':
        return const Color(0xFF00AA13);

      case 'Lalamove':
        return const Color(0xFFFF6B00);

      default:
        return AppColors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: CardMotora(
        // height: 83,
        padding: const EdgeInsets.fromLTRB(16, 12, 12, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Platform',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.muted,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 9),

            Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: platformColor.withOpacity(.10),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(platformIcon, size: 16, color: platformColor),
                ),

                const SizedBox(width: 9),

                Text(
                  selectedPlatform,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const Spacer(),

                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 21,
                  color: AppColors.dark,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfitTargetCard extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const _ProfitTargetCard({required this.controller, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return CardMotora(
      height: 105,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Target Profit',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.muted,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 7),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Rp',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.dark,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(width: 7),

              Expanded(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: const TextStyle(
                    fontSize: 25,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -.5,
                  ),
                  cursorColor: AppColors.green,
                  decoration: const InputDecoration(
                    hintText: '150.000',
                    hintStyle: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF98A2B3),
                      fontWeight: FontWeight.w700,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  const _TipCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 92),
      padding: const EdgeInsets.fromLTRB(13, 14, 13, 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F7FF),
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xFFE0EBF8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 29,
            height: 29,
            decoration: BoxDecoration(
              color: const Color(0xFFE4F0FF),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(
              Icons.lightbulb_outline_rounded,
              color: Color(0xFF4C83D4),
              size: 18,
            ),
          ),

          const SizedBox(width: 10),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tips',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  'Pastikan odometer sesuai\nsebelum memulai sesi.',
                  style: TextStyle(
                    fontSize: 9,
                    height: 1.45,
                    color: AppColors.muted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlatformPickerSheet extends StatelessWidget {
  final String selectedPlatform;

  const _PlatformPickerSheet({required this.selectedPlatform});

  @override
  Widget build(BuildContext context) {
    const platforms = [
      _PlatformData(
        name: 'GrabFood',
        subtitle: 'Delivery makanan',
        icon: Icons.restaurant_rounded,
        color: Color(0xFF08A94F),
      ),
      _PlatformData(
        name: 'ShopeeFood',
        subtitle: 'Delivery makanan',
        icon: Icons.shopping_bag_rounded,
        color: Color(0xFFEE4D2D),
      ),
      _PlatformData(
        name: 'Gojek',
        subtitle: 'Transport & delivery',
        icon: Icons.two_wheeler_rounded,
        color: Color(0xFF00AA13),
      ),
      _PlatformData(
        name: 'Lalamove',
        subtitle: 'Delivery barang',
        icon: Icons.local_shipping_rounded,
        color: Color(0xFFFF6B00),
      ),
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              width: 38,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFD8DCE0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pilih Platform',
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors.dark,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            const SizedBox(height: 5),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pilih platform yang akan digunakan untuk sesi ini.',
                style: TextStyle(fontSize: 12, color: AppColors.muted),
              ),
            ),

            const SizedBox(height: 16),

            ...platforms.map((platform) {
              final isSelected = platform.name == selectedPlatform;

              return Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: InkWell(
                  borderRadius: BorderRadius.circular(13),
                  onTap: () {
                    Navigator.of(context).pop(platform.name);
                  },
                  child: Container(
                    height: 62,
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? platform.color.withOpacity(.06)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: isSelected
                            ? platform.color.withOpacity(.55)
                            : const Color(0xFFE9ECEF),
                        width: isSelected ? 1.3 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: platform.color.withOpacity(.10),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            platform.icon,
                            color: platform.color,
                            size: 20,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                platform.name,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.dark,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              const SizedBox(height: 3),

                              Text(
                                platform.subtitle,
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: AppColors.muted,
                                ),
                              ),
                            ],
                          ),
                        ),

                        if (isSelected)
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              color: platform.color,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check_rounded,
                              size: 15,
                              color: Colors.white,
                            ),
                          )
                        else
                          const Icon(
                            Icons.chevron_right_rounded,
                            size: 21,
                            color: AppColors.muted,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _PlatformData {
  final String name;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _PlatformData({
    required this.name,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}
