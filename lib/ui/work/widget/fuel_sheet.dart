import 'package:flutter/material.dart';
import 'package:motora/ui/core/widget/input.dart';
import 'package:motora/ui/work/view_models/work_session_view_model.dart';
import 'package:motora/utils/colors.dart';
import 'package:motora/utils/format.dart';

class FuelSheet extends StatelessWidget {
  final WorkSessionViewModel model;

  FuelSheet({super.key, required this.model});

  final formKey = GlobalKey<FormState>();

  final odometer = TextEditingController();

  final amountController = TextEditingController();

  final literController = TextEditingController();

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        int liter = 0;
        int amount = 0;

        return StatefulBuilder(
          builder: (context, setState) {
            int pricePerLiter = liter > 0 && amount > 0
                ? (amount / liter).ceil()
                : 0;

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
                    Center(
                      child: Container(
                        width: 44,
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppColors.border,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Tambah Bensin',
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

                    const SizedBox(height: 20),

                    const Text('Odometer'),
                    const SizedBox(height: 8),
                    Input(
                      controller: odometer,
                      autofocus: true,
                      suffixText: "KM",
                    ),
                    const SizedBox(height: 16),

                    const Text('Liter'),
                    const SizedBox(height: 8),
                    Input(
                      controller: literController,
                      autofocus: true,
                      suffixText: "L",
                      onChanged: (value) => value.isNotEmpty
                          ? setState(() => liter = int.parse(value))
                          : null,
                    ),
                    const SizedBox(height: 16),

                    const Text('Harga Total'),
                    const SizedBox(height: 8),
                    Input(
                      controller: amountController,
                      onChanged: (value) => value.isNotEmpty
                          ? setState(() => amount = int.parse(value))
                          : null,
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Harga per Liter"),
                        Text(
                          formatRupiah(pricePerLiter),
                          style: TextTheme.of(
                            context,
                          ).labelMedium!.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!formKey.currentState!.validate()) return;

                          await model.addFuel(
                            int.parse(odometer.text),
                            liter,
                            amount,
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
                          'Tambah',
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
                Icons.local_gas_station_rounded,
                color: AppColors.dark,
                size: 20,
              ),
            ),

            const SizedBox(height: 7),

            Text(
              "Bensin",
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
