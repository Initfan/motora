import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motora/data/repositories/work_session_repository.dart';
import 'package:motora/domain/models/work/work_session.dart';
import 'package:motora/utils/error.dart';

part 'work_session_view_model.freezed.dart';

@freezed
abstract class WorkSessionUiState with _$WorkSessionUiState {
  const factory WorkSessionUiState({
    @Default(false) bool isLoading,
    String? errorMessage,
    WorkSession? workSession,
    @Default(0) int fuelExpense,
    @Default(0) int income,
    @Default(0) double distance,
    @Default(0) int order,
    @Default(Duration.zero) Duration duration,
  }) = _WorkSessionUiState;
}

class WorkSessionViewModel extends ChangeNotifier {
  final WorkSessionRepository repository;

  WorkSessionViewModel({required this.repository});

  WorkSessionUiState _state = const WorkSessionUiState();

  WorkSessionUiState get state => _state;

  Timer? _timer;

  Duration _duration = Duration.zero;

  Duration get duration => _duration;

  String get durationText {
    final hours = _duration.inHours.toString().padLeft(2, '0');
    final minutes = (_duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (_duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }

  void startTimer() {
    final startedAt = state.workSession!.startedAt;

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _duration = DateTime.now().difference(startedAt!);
      notifyListeners();
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void resetTimer() {
    _duration = Duration.zero;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  double get profitProgress {
    if (state.workSession!.goalProfit <= 0) {
      return 0;
    }

    return ((state.workSession?.income ?? 0) / state.workSession!.goalProfit)
        .clamp(0.0, 1.0);
  }

  String get formatKm {
    if (state.distance == state.distance.roundToDouble()) {
      return state.distance.toInt().toString();
    }

    return state.distance.toStringAsFixed(1);
  }

  void addIncome(int amount, double distance, int order) async {
    try {
      await repository.addIncome(
        sessionId: _state.workSession!.id,
        amount: amount,
        km: distance,
        order: order,
      );

      _state = _state.copyWith(
        income: _state.income + amount,
        distance: _state.distance + distance,
        order: _state.order + order,
      );
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        errorMessage: getErrorMessage(e),
      );
    }
    notifyListeners();
  }

  Future<void> load() async {
    _state = _state.copyWith(isLoading: true, errorMessage: null);

    notifyListeners();

    try {
      final workSession = await repository.getActiveSession();

      _state = _state.copyWith(
        isLoading: false,
        workSession: workSession,
        distance: workSession.distance.toDouble(),
        fuelExpense: workSession.fuelExpense,
        income: workSession.income,
        order: workSession.order,
      );
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        errorMessage: getErrorMessage(e),
      );
    }

    notifyListeners();
  }
}
