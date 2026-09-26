import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motora/components/card.dart';
import 'package:motora/components/fuel_slider.dart';
import 'package:motora/ui/core/widget/button.dart';
import 'package:motora/ui/motor/view_models/select_motor_view_model.dart';
import 'package:motora/ui/motor/widget/motor_card.dart';
import 'package:motora/ui/work/view_models/start_work_view_model.dart';
import 'package:motora/utils/colors.dart';
import 'package:motora/utils/format.dart';
import 'package:provider/provider.dart';

class StartWorkScreen extends StatefulWidget {
  const StartWorkScreen({super.key});

  @override
  State<StartWorkScreen> createState() => _StartWorkScreenState();
}

class _StartWorkScreenState extends State<StartWorkScreen> {
  final TextEditingController profitController = TextEditingController();

  final FocusNode profitFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    profitController.addListener(_formatProfit);
  }

  @override
  void dispose() {
    super.dispose();
    profitController.removeListener(_formatProfit);
    profitController.dispose();
    profitFocusNode.dispose();
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

    final formatted = formatRupiah(number);

    if (profitController.text == formatted) {
      return;
    }

    final cursorPosition = formatted.length;

    profitController.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );

    Provider.of<StartWorkViewModel>(
      context,
      listen: false,
    ).setTargetProfit(number);
  }

  int get targetProfit {
    final raw = profitController.text.replaceAll(RegExp(r'[^0-9]'), '');

    return int.tryParse(raw) ?? 0;
  }

  Future<void> _showPlatformPicker(StartWorkViewModel model) async {
    await showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return _platformPickerSheet(model);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFEFE),
      appBar: _appBar(),
      body: SafeArea(
        child: Consumer<StartWorkViewModel>(
          builder: (context, model, child) {
            final motor = Provider.of<SelectMotorViewModel>(
              context,
              listen: false,
            ).state.selectedMotorcycle;
            final state = model.state;

            if (motor == null) return SizedBox();

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(20, 22, 20, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MotorCard(),

                        const SizedBox(height: 13),

                        _platformCard(model, state.selectedPlatform),

                        const SizedBox(height: 13),

                        FuelLevelSlider(
                          value: state.fuelLevel,
                          onChanged: (level) => model.setFuelLevel(level),
                        ),

                        const SizedBox(height: 13),

                        _profitTargetCard(),

                        const SizedBox(height: 16),

                        _tipsCard(),
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
                    child: Button(
                      onPressed: () async {
                        final session = await model.startSession(motor);
                        if (session != null)
                          Navigator.pushNamed(context, '/work/active');
                      },
                      text: "Mulai",
                      icon: Icons.play_arrow_rounded,
                      isLoading: model.state.isStarting,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/'),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 18,
          color: AppColors.dark,
        ),
      ),
      title: Text(
        'Mulai Narik',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: AppColors.dark,
          letterSpacing: -.25,
        ),
      ),
    );
  }

  Container _platformPickerSheet(StartWorkViewModel model) {
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

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: platforms.length,
                itemBuilder: (context, index) {
                  final platform = platforms[index];
                  final isSelected = platform == model.state.selectedPlatform;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(13),
                      onTap: () {
                        model.setPlatform(platform);
                        Navigator.of(context).pop();
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _platformCard(
    StartWorkViewModel model,
    PlatformData selectedPlatform,
  ) {
    return InkWell(
      onTap: () => _showPlatformPicker(model),
      borderRadius: BorderRadius.circular(15),
      child: CardMotora(
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
                    color: selectedPlatform.color.withOpacity(.10),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    selectedPlatform.icon,
                    size: 16,
                    color: selectedPlatform.color,
                  ),
                ),

                const SizedBox(width: 9),

                Text(
                  selectedPlatform.name,
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

  Container _tipsCard() {
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

  CardMotora _profitTargetCard() {
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
              Expanded(
                child: TextField(
                  controller: profitController,
                  focusNode: profitFocusNode,
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
