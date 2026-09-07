import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:motora/components/card.dart';
import 'package:motora/model/motor_model.dart';
import 'package:motora/screen/motor/select_motor.dart';
import 'package:motora/utils/api.dart';
import 'package:motora/utils/colors.dart';

class MotorCard extends StatefulWidget {
  const MotorCard({super.key});

  @override
  State<MotorCard> createState() => _MotorCardState();
}

class _MotorCardState extends State<MotorCard> {
  late Future<MotorModel> futureMotor;

  @override
  void initState() {
    super.initState();
    futureMotor = getMotor();
  }

  Future<MotorModel> getMotor() async {
    final res = await api.get('/motorcycle/2', authenticated: true);
    return MotorModel.fromJson(res['data']);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MotorModel>(
      future: futureMotor,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SelectMotorPage()),
            ),
            child: CardMotora(
              height: 138,
              padding: const EdgeInsets.fromLTRB(17, 12, 12, 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: Image.network(
                      "${dotenv.env['IMAGE_URL']}/${snapshot.data?.motor_url}",
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
                          "${snapshot.data?.brand} ${snapshot.data?.model} ${snapshot.data?.year}",
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
                              "${snapshot.data?.kilometers}",
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
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.muted,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            Text(
                              'Status motor',
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.muted,
                              ),
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
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.muted,
                    size: 25,
                  ),
                ],
              ),
            ),
          );
        }

        return SizedBox();
      },
    );
  }
}
