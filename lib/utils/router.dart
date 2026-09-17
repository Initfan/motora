import 'package:motora/components/motora.dart';
import 'package:go_router/go_router.dart';
import 'package:motora/screen/motor/add_motorcycle.dart';
import 'package:motora/ui/motor/widget/select_motor_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, _) => Motora()),
    GoRoute(
      path: '/motor',
      builder: (_, _) => SelectMotorScreen(),
      routes: [GoRoute(path: '/add', builder: (_, _) => AddMotorcyclePage())],
    ),
  ],
);
