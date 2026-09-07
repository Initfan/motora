import 'package:go_router/go_router.dart';
import 'package:motora/main.dart';
import 'package:motora/screen/motor/add_motorcycle.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, _) => MotoraApp()),
    GoRoute(
      path: '/motor',
      routes: [GoRoute(path: '/add', builder: (_, _) => AddMotorcyclePage())],
    ),
  ],
);
