import 'package:flutter/material.dart';
import 'package:motora/screen/motor/add_motorcycle.dart';
import 'package:motora/ui/core/widget/motora.dart';
import 'package:motora/ui/motor/widget/select_motor_screen.dart';
import 'package:motora/ui/work/screen/start_work_screen.dart';
import 'package:motora/ui/work/screen/work_session_screen.dart';

final Map<String, WidgetBuilder> router = {
  '/': (BuildContext context) => Motora(),

  '/work': (BuildContext context) => StartWorkScreen(),
  '/work/active': (BuildContext context) => WorkSessionScreen(),

  '/motor': (BuildContext context) => SelectMotorScreen(),
  '/motor/add': (BuildContext context) => AddMotorcyclePage(),
};
