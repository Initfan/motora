// import 'package:flutter/material.dart';
// import 'package:motora/components/motor_card.dart';
// import 'package:motora/model/motor_model.dart';
// import 'package:motora/provider/motor_provider.dart';
// import 'package:motora/screen/motor/add_motorcycle.dart';
// import 'package:motora/utils/api.dart';
// import 'package:motora/utils/colors.dart';
// import 'package:provider/provider.dart';

// class SelectMotorPage extends StatefulWidget {
//   const SelectMotorPage({super.key});

//   @override
//   State<SelectMotorPage> createState() => _SelectMotorPageState();
// }

// class _SelectMotorPageState extends State<SelectMotorPage> {
//   late Future<List<MotorModel>> futureListMotor;

//   @override
//   void initState() {
//     super.initState();
//     futureListMotor = loadMotorcycles();
//   }

//   MotorModel? _selectedMotorcycle;

//   final bool _isSelecting = false;
//   String? _errorMessage;

//   Future<List<MotorModel>> loadMotorcycles() async {
//     try {
//       final response = await api.get('/motorcycle/user');

//       final motorcycles = _parseMotorcycles(response);

//       return motorcycles;
//     } catch (e) {
//       setState(() {
//         _errorMessage = _getErrorMessage(e);
//       });
//     }

//     return [];
//   }

//   List<MotorModel> _parseMotorcycles(dynamic response) {
//     dynamic data = response['data'].values.toList();

//     if (data is! List) {
//       throw Exception('Format data motor tidak valid');
//     }

//     return data
//         .whereType<Map>()
//         .map((item) => MotorModel.fromJson(Map<String, dynamic>.from(item)))
//         .toList();
//   }

//   String _getErrorMessage(Object error) {
//     final message = error.toString();

//     if (message.contains('SocketException')) {
//       return 'Tidak dapat terhubung ke server.';
//     }

//     if (message.contains('401')) {
//       return 'Sesi login kamu telah berakhir.';
//     }

//     return 'Gagal mengambil data motor.';
//   }

//   void _selectMotorcycle(MotorModel motorcycle) {
//     setState(() {
//       _selectedMotorcycle = motorcycle;
//     });
//   }

//   Future<void> _useSelectedMotorcycle() async {
//     final motorcycle = _selectedMotorcycle;

//     if (motorcycle == null) {
//       _showSnackBar('Pilih motor terlebih dahulu', isError: true);
//       return;
//     }

//     Provider.of<MotorProvider>(context, listen: false).setMotor(motorcycle);

//     Navigator.pop(context);
//   }

//   void _addMotorcycle() => Navigator.push(
//     context,
//     MaterialPageRoute(builder: (_) => AddMotorcyclePage()),
//   );

//   void _showSnackBar(String message, {bool isError = false}) {
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           style: const TextStyle(fontWeight: FontWeight.w500),
//         ),
//         behavior: SnackBarBehavior.floating,
//         backgroundColor: isError ? Colors.red.shade700 : AppColors.dark,
//         margin: const EdgeInsets.all(16),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       // appBar: _buildAppbar(),
//       body: SafeArea(
//         child: FutureBuilder<List<MotorModel>>(
//           future: futureListMotor,
//           builder: (context, snapshot) {
//             if (_errorMessage != null) {
//               return _buildError();
//             }

//             if (snapshot.connectionState == ConnectionState.done) {
//               if (snapshot.hasData) {
//                 return _buildListMotor(snapshot);
//               }
//               return _buildEmpty();
//             }
//             return _buildLoading();
//           },
//         ),
//       ),

//       bottomNavigationBar: _buildBottomAction(),
//     );
//   }

//   ListView _buildListMotor(AsyncSnapshot<List<MotorModel>> snapshot) {
//     return ListView(
//       physics: const AlwaysScrollableScrollPhysics(),
//       padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Gunakan motor yang akan\ndipakai hari ini.',
//               style: TextStyle(
//                 color: AppColors.dark,
//                 fontSize: 26,
//                 height: 1.2,
//                 fontWeight: FontWeight.w700,
//                 letterSpacing: -0.7,
//               ),
//             ),

//             const SizedBox(height: 10),

//             Text(
//               '${snapshot.data!.length} motor terdaftar',
//               style: const TextStyle(
//                 color: AppColors.muted,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),

//         const SizedBox(height: 24),

//         ...snapshot.data!.map(
//           (motorcycle) => Padding(
//             padding: const EdgeInsets.only(bottom: 12),
//             child: _buildMotorcycleCard(motorcycle),
//           ),
//         ),

//         const SizedBox(height: 8),

//         _buildAddMotorButton(),
//       ],
//     );
//   }

//   Widget _buildMotorcycleCard(MotorModel motorcycle) {
//     final isSelected = _selectedMotorcycle?.id == motorcycle.id;

//     return GestureDetector(
//       onTap: () {
//         _selectMotorcycle(motorcycle);
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 180),
//         curve: Curves.easeOut,

//         padding: const EdgeInsets.all(1.5),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(18),

//           border: Border.all(
//             color: isSelected ? AppColors.green : AppColors.border,
//             width: isSelected ? 1.5 : 1,
//           ),

//           boxShadow: isSelected
//               ? [
//                   BoxShadow(
//                     color: AppColors.green.withValues(alpha: 0.08),
//                     blurRadius: 16,
//                     offset: const Offset(0, 6),
//                   ),
//                 ]
//               : null,
//         ),

//         child: Motor(data: motorcycle),
//       ),
//     );
//   }

//   Widget _buildAddMotorButton() {
//     return OutlinedButton.icon(
//       onPressed: _addMotorcycle,

//       style: OutlinedButton.styleFrom(
//         foregroundColor: AppColors.dark,
//         minimumSize: const Size(double.infinity, 52),
//         side: const BorderSide(color: AppColors.border),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//       ),

//       icon: const Icon(Icons.add_rounded, size: 21, color: AppColors.green),

//       label: const Text(
//         'Tambah Motor Baru',
//         style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//       ),
//     );
//   }

//   Widget _buildBottomAction() {
//     final canContinue = _selectedMotorcycle != null;

//     return Container(
//       padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),

//       decoration: const BoxDecoration(
//         color: Colors.white,

//         border: Border(top: BorderSide(color: AppColors.border)),
//       ),

//       child: SafeArea(
//         top: false,
//         child: SizedBox(
//           height: 54,
//           width: double.infinity,

//           child: ElevatedButton(
//             onPressed: canContinue && !_isSelecting
//                 ? _useSelectedMotorcycle
//                 : null,

//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.green,
//               disabledBackgroundColor: const Color(0xFFE4E7EC),
//               foregroundColor: Colors.white,
//               elevation: 0,

//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(14),
//               ),
//             ),

//             child: _isSelecting
//                 ? const SizedBox(
//                     width: 22,
//                     height: 22,
//                     child: CircularProgressIndicator(
//                       strokeWidth: 2.5,
//                       color: Colors.white,
//                     ),
//                   )
//                 : const Text(
//                     'Gunakan Motor Ini',
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLoading() {
//     return ListView(
//       padding: const EdgeInsets.all(20),
//       children: [
//         const SizedBox(height: 12),

//         Container(
//           width: 240,
//           height: 30,
//           decoration: BoxDecoration(
//             color: const Color(0xFFF2F4F7),
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),

//         const SizedBox(height: 10),

//         Container(
//           width: 150,
//           height: 18,
//           decoration: BoxDecoration(
//             color: const Color(0xFFF2F4F7),
//             borderRadius: BorderRadius.circular(6),
//           ),
//         ),

//         const SizedBox(height: 28),

//         ...List.generate(
//           3,
//           (_) => Container(
//             margin: const EdgeInsets.only(bottom: 12),
//             height: 105,
//             decoration: BoxDecoration(
//               color: const Color(0xFFF8F9FA),
//               borderRadius: BorderRadius.circular(18),
//               border: Border.all(color: AppColors.border),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildError() {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 64,
//               height: 64,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFEF3F2),
//                 borderRadius: BorderRadius.circular(18),
//               ),
//               child: const Icon(
//                 Icons.cloud_off_rounded,
//                 color: Color(0xFFD92D20),
//                 size: 30,
//               ),
//             ),

//             const SizedBox(height: 18),

//             const Text(
//               'Gagal memuat motor',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: AppColors.dark,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),

//             const SizedBox(height: 8),

//             Text(
//               _errorMessage ?? 'Terjadi kesalahan.',
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 color: AppColors.muted,
//                 fontSize: 14,
//                 height: 1.4,
//               ),
//             ),

//             const SizedBox(height: 24),

//             ElevatedButton(
//               onPressed: () => setState(() => _errorMessage = null),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.green,
//                 foregroundColor: Colors.white,
//                 elevation: 0,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 13,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text(
//                 'Coba Lagi',
//                 style: TextStyle(fontWeight: FontWeight.w700),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildEmpty() {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 80,
//               height: 80,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF0FDF4),
//                 borderRadius: BorderRadius.circular(24),
//               ),
//               child: const Icon(
//                 Icons.two_wheeler_rounded,
//                 color: AppColors.green,
//                 size: 40,
//               ),
//             ),

//             const SizedBox(height: 20),

//             const Text(
//               'Belum ada motor',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: AppColors.dark,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),

//             const SizedBox(height: 8),

//             const Text(
//               'Tambahkan motor yang kamu gunakan\n'
//               'untuk mulai mencatat aktivitas narik.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: AppColors.muted,
//                 fontSize: 14,
//                 height: 1.5,
//               ),
//             ),

//             const SizedBox(height: 24),

//             SizedBox(
//               width: double.infinity,
//               height: 52,
//               child: ElevatedButton.icon(
//                 onPressed: _addMotorcycle,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.green,
//                   foregroundColor: Colors.white,
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                 ),
//                 icon: const Icon(Icons.add_rounded),
//                 label: const Text(
//                   'Tambah Motor',
//                   style: TextStyle(fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
