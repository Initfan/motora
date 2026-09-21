import 'package:flutter/material.dart';
import 'package:motora/ui/core/widget/input.dart';
import 'package:motora/ui/work/view_models/work_session_view_model.dart';
import 'package:motora/utils/colors.dart';

class IncomeSheet extends StatelessWidget {
  final WorkSessionViewModel model;

  IncomeSheet({super.key, required this.model});

  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final kmController = TextEditingController();
  final order = TextEditingController(text: '1');

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              20,
              20,
              MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Tambah Pendapatan',
                        style: TextStyle(
                          color: AppColors.dark,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                const Text(
                  'Masukkan pendapatan yang kamu dapatkan.',
                  style: TextStyle(color: AppColors.muted, fontSize: 13),
                ),

                const SizedBox(height: 20),

                Text("Argo"),
                const SizedBox(height: 8),
                Input(controller: controller),

                const SizedBox(height: 16),

                Text("Jarak"),
                const SizedBox(height: 8),
                Input(controller: kmController, suffixText: "KM"),

                const SizedBox(height: 16),

                Text("Jumlah Order"),
                const SizedBox(height: 8),
                Input(controller: order),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) return;

                      final value = int.tryParse(
                        controller.text.replaceAll('.', '').replaceAll(',', ''),
                      );

                      if (value == null || value <= 0) {
                        return;
                      }

                      model.addIncome(
                        value,
                        double.parse(kmController.text),
                        int.parse(order.text),
                      );

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
                      'Simpan Pendapatan',
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
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showBottomSheet(context),
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
              child: Icon(
                Icons.add_card_rounded,
                color: AppColors.dark,
                size: 20,
              ),
            ),

            const SizedBox(height: 7),

            Text(
              "Pendapatan",
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
}
