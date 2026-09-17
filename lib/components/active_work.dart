// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:motora/domain/models/motor/motorcycle.dart';
// import 'package:motora/model/work_model.dart';
// import 'package:motora/screen/home/active_work_session.dart';
// import 'package:motora/utils/api.dart';
// import 'package:motora/utils/colors.dart';

// class ActiveWorkSession extends StatefulWidget {
//   const ActiveWorkSession({super.key, required this.data});

//   final WorkModel data;

//   @override
//   State<ActiveWorkSession> createState() => _ActiveWorkSessionState();
// }

// class _ActiveWorkSessionState extends State<ActiveWorkSession> {
//   late Future<Motorcycle>? futureMotor;
//   double distance = 0;
//   int totalOrder = 0;
//   int income = 0;

//   @override
//   void initState() {
//     super.initState();
//     futureMotor = getMotor();
//   }

//   Future<MotorModel> getMotor() async {
//     try {
//       final incomes = await api.get(
//         '/work/${widget.data.motorcycleId}/incomes',
//       );
//       final data = incomes['data'] as List<dynamic>;

//       for (var e in data) {
//         setState(() {
//           distance += e['distance'];
//           totalOrder = data.length;
//           income += e['amount'] as int;
//         });
//       }

//       final res = await api.get('/motorcycle/${widget.data.motorcycleId}');
//       return MotorModel.fromJson(res['data']);
//     } catch (e) {
//       print(e);
//     }
//     return MotorModel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<MotorModel>(
//       future: futureMotor,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Container(
//             decoration: BoxDecoration(
//               color: AppColors.muted,
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: AppColors.border),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withValues(alpha: 0.04),
//                   blurRadius: 16,
//                   offset: const Offset(0, 6),
//                 ),
//               ],
//             ),
//           );
//         }
//         return ActiveWorkSessionCard(
//           platform: widget.data.platform!,
//           image: "${dotenv.env['IMAGE_URL']}/${snapshot.data?.motorUrl}",
//           motorcycleName: "${snapshot.data?.brand} ${snapshot.data?.model}",
//           kilometersStart: widget.data.kilometersStart!.toDouble(),
//           currentKilometers: widget.data.kilometersFinish!.toDouble(),
//           targetProfit: widget.data.goalProfit!,
//           totalOrder: totalOrder,
//           distance: distance,
//           startedAt: DateTime.parse(widget.data.startedAt!),

//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => ActiveWorkPage(
//                 work: widget.data,
//                 motor: snapshot.data!,
//                 distance: distance,
//                 income: income,
//                 totalOrder: totalOrder,
//               ),
//             ),
//           ),

//           onFinish: () {
//             // Buka halaman Akhiri Sesi
//           },
//         );
//       },
//     );
//   }
// }

// class ActiveWorkSessionCard extends StatefulWidget {
//   final String platform;
//   final String motorcycleName;
//   final double kilometersStart;
//   final double currentKilometers;
//   final int targetProfit;
//   final int totalOrder;
//   final DateTime startedAt;
//   final String image;
//   final double distance;

//   final VoidCallback? onTap;
//   final VoidCallback? onFinish;

//   const ActiveWorkSessionCard({
//     super.key,
//     required this.platform,
//     required this.motorcycleName,
//     required this.kilometersStart,
//     required this.currentKilometers,
//     required this.targetProfit,
//     required this.totalOrder,
//     required this.startedAt,
//     this.onTap,
//     this.onFinish,
//     this.image = '',
//     required this.distance,
//   });

//   @override
//   State<ActiveWorkSessionCard> createState() => _ActiveWorkSessionCardState();
// }

// class _ActiveWorkSessionCardState extends State<ActiveWorkSessionCard> {
//   Timer? _timer;

//   Duration _duration = Duration.zero;

//   @override
//   void initState() {
//     super.initState();

//     _updateDuration();

//     _timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       _updateDuration();
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _updateDuration() {
//     if (!mounted) return;

//     setState(() {
//       _duration = DateTime.now().difference(widget.startedAt);
//     });
//   }

//   String get _durationText {
//     final hours = _duration.inHours.toString().padLeft(2, '0');

//     final minutes = (_duration.inMinutes % 60).toString().padLeft(2, '0');

//     final seconds = (_duration.inSeconds % 60).toString().padLeft(2, '0');

//     return '$hours:$minutes:$seconds';
//   }

//   String _formatRupiah(int value) {
//     final formatted = value.toString().replaceAllMapped(
//       RegExp(r'\B(?=(\d{3})+(?!\d))'),
//       (match) => '.',
//     );

//     return 'Rp$formatted';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: AppColors.border),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.04),
//             blurRadius: 16,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           _buildHeader(),
//           _buildSessionInfo(),
//           _buildStats(),
//           _buildActions(),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
//       child: Row(
//         children: [
//           // Active indicator
//           Container(
//             width: 10,
//             height: 10,
//             decoration: const BoxDecoration(
//               color: AppColors.green,
//               shape: BoxShape.circle,
//             ),
//           ),

//           const SizedBox(width: 8),

//           const Text(
//             'Sesi sedang berjalan',
//             style: TextStyle(
//               color: AppColors.dark,
//               fontSize: 14,
//               fontWeight: FontWeight.w700,
//             ),
//           ),

//           const Spacer(),

//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
//             decoration: BoxDecoration(
//               color: const Color(0xFFF0FDF4),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Text(
//               widget.platform,
//               style: const TextStyle(
//                 color: AppColors.green,
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSessionInfo() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Row(
//         children: [
//           Container(
//             width: 44,
//             height: 44,
//             decoration: BoxDecoration(
//               color: const Color(0xFFF7F8FA),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: widget.image.isNotEmpty
//                 ? Image.network(widget.image)
//                 : Icon(
//                     Icons.two_wheeler_rounded,
//                     color: AppColors.dark,
//                     size: 24,
//                   ),
//           ),

//           const SizedBox(width: 12),

//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.motorcycleName,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     color: AppColors.dark,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),

//                 const SizedBox(height: 4),

//                 Text(
//                   '${_formatKm(widget.kilometersStart)} km',
//                   style: const TextStyle(
//                     color: AppColors.muted,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               const Text(
//                 'DURASI',
//                 style: TextStyle(
//                   color: AppColors.muted,
//                   fontSize: 9,
//                   fontWeight: FontWeight.w700,
//                   letterSpacing: 0.8,
//                 ),
//               ),

//               const SizedBox(height: 3),

//               Text(
//                 _durationText,
//                 style: const TextStyle(
//                   color: AppColors.dark,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w800,
//                   fontFeatures: [FontFeature.tabularFigures()],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStats() {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         children: [
//           Expanded(
//             child: _buildStat(
//               icon: Icons.route_rounded,
//               label: 'Jarak',
//               value: '${_formatKm(widget.distance)} km',
//             ),
//           ),

//           _buildDivider(),

//           Expanded(
//             child: _buildStat(
//               icon: Icons.local_shipping_outlined,
//               label: 'Order',
//               value: '${widget.totalOrder}',
//             ),
//           ),

//           _buildDivider(),

//           Expanded(
//             child: _buildStat(
//               icon: Icons.flag_outlined,
//               label: 'Target',
//               value: _formatRupiah(widget.targetProfit),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStat({
//     required IconData icon,
//     required String label,
//     required String value,
//   }) {
//     return Column(
//       children: [
//         Icon(icon, size: 18, color: AppColors.muted),

//         const SizedBox(height: 6),

//         Text(
//           value,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           style: const TextStyle(
//             color: AppColors.dark,
//             fontSize: 13,
//             fontWeight: FontWeight.w700,
//           ),
//         ),

//         const SizedBox(height: 2),

//         Text(
//           label,
//           style: const TextStyle(
//             color: AppColors.muted,
//             fontSize: 10,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDivider() {
//     return Container(width: 1, height: 36, color: AppColors.border);
//   }

//   Widget _buildActions() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
//       child: Row(
//         children: [
//           Expanded(
//             child: OutlinedButton(
//               onPressed: widget.onTap,
//               style: OutlinedButton.styleFrom(
//                 foregroundColor: AppColors.dark,
//                 minimumSize: const Size.fromHeight(46),
//                 side: const BorderSide(color: AppColors.border),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text(
//                 'Lihat Sesi',
//                 style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
//               ),
//             ),
//           ),

//           const SizedBox(width: 10),

//           Expanded(
//             child: ElevatedButton(
//               onPressed: widget.onFinish,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.green,
//                 foregroundColor: Colors.white,
//                 elevation: 0,
//                 minimumSize: const Size.fromHeight(46),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text(
//                 'Akhiri Sesi',
//                 style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String _formatKm(double value) {
//     if (value == value.roundToDouble()) {
//       return value.toInt().toString();
//     }

//     return value.toStringAsFixed(1);
//   }
// }
