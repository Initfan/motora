import 'package:flutter/material.dart';
import 'package:motora/model/motor_model.dart';

class MotorProvider extends ChangeNotifier {
  MotorModel? _motor;

  MotorModel? get motor => _motor;

  void setMotor(MotorModel motor) {
    _motor = motor;
    notifyListeners();
  }
}
