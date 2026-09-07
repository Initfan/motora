import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:motora/components/active_work.dart';
import 'package:motora/components/card.dart';
import 'package:motora/components/motor_card.dart';
import 'package:motora/components/motor_health.dart';
import 'package:motora/model/motor_model.dart';
import 'package:motora/model/work_model.dart';
import 'package:motora/provider/motor_provider.dart';
import 'package:motora/screen/home/active_work_session.dart';
import 'package:motora/screen/home/start_work_session.dart';
import 'package:motora/utils/api.dart';
import 'package:motora/utils/colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WorkModel> futureSession;

  @override
  void initState() {
    super.initState();
    futureSession = getActiveSession();
  }

  Future<WorkModel> getActiveSession() async {
    final res = await api.get('/work');
    return WorkModel.fromJson(res['data']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontal = max(20.0, constraints.maxWidth * .052);
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(
                      horizontal,
                      22,
                      horizontal,
                      14,
                    ),
                    child: FutureBuilder<WorkModel>(
                      future: futureSession,
                      builder: (context, snapshot) {
                        final motor = Provider.of<MotorProvider>(
                          context,
                          listen: false,
                        ).motor;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            header(),
                            const SizedBox(height: 22),
                            snapshot.hasData
                                ? _buildActiveSession(snapshot, motor)
                                : MotorCard(),
                            const SizedBox(height: 18),
                            MotorHealth(),
                            const SizedBox(height: 18),
                            const _AttentionCard(),
                            const SizedBox(height: 18),
                            snapshot.hasData ? SizedBox() : _TargetCard(),
                            const SizedBox(height: 4),
                          ],
                        );
                      },
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

  ActiveWorkSessionCard _buildActiveSession(
    AsyncSnapshot<WorkModel> snapshot,
    MotorModel? motor,
  ) {
    return ActiveWorkSessionCard(
      platform: snapshot.data!.platform!,
      image: "${dotenv.env['IMAGE_URL']}/${motor?.motorUrl}",
      motorcycleName: "${motor?.brand} ${motor?.model}",
      kilometersStart: snapshot.data!.kilometersStart!.toDouble(),
      currentKilometers: snapshot.data!.kilometersFinish!.toDouble(),
      targetProfit: snapshot.data!.goalProfit!,
      totalOrder: snapshot.data!.totalOrder!,
      startedAt: DateTime.now().subtract(
        Duration(
          hours: DateTime.parse(snapshot.data!.startedAt!).hour,
          minutes: DateTime.parse(snapshot.data!.startedAt!).minute,
          seconds: DateTime.parse(snapshot.data!.startedAt!).second,
        ),
      ),

      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ActiveWorkPage(work: snapshot.data!, motor: motor!),
        ),
      ),

      onFinish: () {
        // Buka halaman Akhiri Sesi
      },
    );
  }

  Widget header() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Selamat pagi, Andi 👋',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColors.dark,
              letterSpacing: -.2,
            ),
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              Icons.notifications_none_rounded,
              size: 27,
              color: AppColors.dark,
            ),
            Positioned(
              right: -3,
              top: -5,
              child: Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  color: Color(0xFFE51F3E),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AttentionCard extends StatelessWidget {
  const _AttentionCard();

  @override
  Widget build(BuildContext context) {
    return CardMotora(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              children: const [
                Text(
                  'Perlu perhatian',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.dark,
                  ),
                ),
                Spacer(),
                Text(
                  'Lihat semua',
                  style: TextStyle(fontSize: 9, color: AppColors.muted),
                ),
              ],
            ),
          ),
          const SizedBox(height: 9),
          _AttentionRow(
            icon: Icons.oil_barrel_outlined,
            iconColor: const Color(0xFFFF7043),
            bgColor: const Color(0xFFFFEAE4),
            title: 'Oli Mesin',
            subtitle: '280 km lagi',
            subtitleColor: const Color(0xFFFF7A35),
          ),
          const Divider(
            height: 1,
            indent: 17,
            endIndent: 17,
            color: AppColors.border,
          ),
          _AttentionRow(
            icon: Icons.disc_full_outlined,
            iconColor: const Color(0xFF5F6368),
            bgColor: const Color(0xFFFFF5D9),
            title: 'Kampas Rem Depan',
            subtitle: '1.200 km lagi',
            subtitleColor: AppColors.muted,
          ),
        ],
      ),
    );
  }
}

class _AttentionRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final String subtitle;
  final Color subtitleColor;

  const _AttentionRow({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.title,
    required this.subtitle,
    required this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 69,
      child: Row(
        children: [
          const SizedBox(width: 17),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.dark,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10,
                    color: subtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.muted,
            size: 21,
          ),
          const SizedBox(width: 14),
        ],
      ),
    );
  }
}

class _TargetCard extends StatelessWidget {
  const _TargetCard();

  @override
  Widget build(BuildContext context) {
    return CardMotora(
      padding: const EdgeInsets.fromLTRB(17, 14, 17, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'Target hari ini',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark,
                ),
              ),
              Spacer(),
              Text(
                'Rp150.000',
                style: TextStyle(fontSize: 10, color: AppColors.muted),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'Rp125.000',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 23,
              fontWeight: FontWeight.w800,
              letterSpacing: -.6,
            ),
          ),
          const SizedBox(height: 9),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const LinearProgressIndicator(
                    value: .83,
                    minHeight: 5,
                    backgroundColor: Color(0xFFE7EBEE),
                    valueColor: AlwaysStoppedAnimation(AppColors.green),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                '83%',
                style: TextStyle(fontSize: 9, color: AppColors.muted),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => StartWorkPage()),
              ),
              icon: const Icon(Icons.play_arrow_rounded, size: 19),
              label: const Text(
                'Mulai Narik',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
