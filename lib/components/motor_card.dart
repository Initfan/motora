import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:motora/components/card.dart';
import 'package:motora/model/motor_model.dart';
import 'package:motora/provider/motor_provider.dart';
import 'package:motora/screen/motor/select_motor.dart';
import 'package:motora/utils/colors.dart';
import 'package:provider/provider.dart';

class MotorCard extends StatefulWidget {
  const MotorCard({super.key});

  @override
  State<MotorCard> createState() => _MotorCardState();
}

class _MotorCardState extends State<MotorCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MotorProvider>(
      builder: (context, value, child) {
        if (value.motor != null) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SelectMotorPage()),
            ),
            child: Motor(data: value.motor!, icon: true),
          );
        }
        return SizedBox();
      },
    );
  }
}

class Motor extends StatelessWidget {
  const Motor({super.key, required this.data, this.icon = false});

  final MotorModel data;
  final bool icon;

  String formatNumber(int number) {
    final value = number.toString();

    return value.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardMotora(
      height: 138,
      padding: const EdgeInsets.fromLTRB(17, 12, 12, 12),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            height: 75,
            child: Image.network(
              "${dotenv.env['IMAGE_URL']}/${data.motorUrl}",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  "${data.brand} ${data.model} ${data.year}",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.muted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      formatNumber(data.kilometers!),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.dark,
                        letterSpacing: -.6,
                      ),
                    ),
                    SizedBox(width: 5),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text(
                        'km',
                        style: TextStyle(fontSize: 14, color: AppColors.muted),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Text(
                      'Status motor',
                      style: TextStyle(fontSize: 10, color: AppColors.muted),
                    ),
                    SizedBox(width: 7),
                    Icon(Icons.circle, size: 6, color: AppColors.green),
                    SizedBox(width: 4),
                    Text(
                      'Baik',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.green,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          icon
              ? Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.muted,
                  size: 25,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
