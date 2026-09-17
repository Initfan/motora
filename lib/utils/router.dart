import 'package:motora/ui/core/widget/motora.dart';
import 'package:go_router/go_router.dart';
import 'package:motora/ui/work/widget/start_work_screen.dart';
import 'package:motora/screen/motor/add_motorcycle.dart';
import 'package:motora/ui/motor/widget/select_motor_screen.dart';
// import 'package:motora/ui/work/widget/work_sekssion_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, _) => Motora()),
    GoRoute(
      path: '/work',
      builder: (_, _) => StartWorkScreen(),
      routes: [
        // GoRoute(path: '/active', builder: (_, _) => WorkSessionScreen()),
      ],
    ),
    GoRoute(
      path: '/motor',
      builder: (_, _) => SelectMotorScreen(),
      routes: [GoRoute(path: '/add', builder: (_, _) => AddMotorcyclePage())],
    ),
  ],
);
